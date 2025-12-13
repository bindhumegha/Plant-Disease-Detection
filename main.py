from flask import Flask, render_template, request,flash,session
import numpy as np
import mysql.connector
from werkzeug.utils import secure_filename
import os
import io
import base64
from googletrans import Translator
translator = Translator()
from prediction import img_prediction
from datetime import datetime

app = Flask(__name__)
app.secret_key = "1234"

@app.route('/')
def index():
    return render_template('index.html')

#USER SECTION

@app.route("/signup")
def signup():
    return render_template("signup.html")

@app.route("/user_reg",methods =["GET", "POST"])
def user_reg():
    name = request.form.get('name')
    uid = request.form.get('uid')
    pwd = request.form.get('pwd')
    email = request.form.get('mail')
    mno = request.form.get('mno')
    con, cur = database()
    sql = "select count(*) from users where userid='" + uid + "'"
    cur.execute(sql)
    res = cur.fetchone()[0]
    if res > 0:
        return render_template("signup.html", msg2="User Id already exists..!")
    else:
        sql = "insert into users values(%s,%s,%s,%s,%s)"
        values = (name, uid, pwd, email, mno)
        cur.execute(sql,values)
        con.commit()
        return render_template("user.html", msg1="Registered Successfully..! Login Here.")
    return ""

@app.route("/user")
def user():
    return render_template("user.html")

@app.route("/user_login_check",methods=['GET','POST'])
def user_login_check():
    uid=request.form.get('uid')
    pswd=request.form.get('pwd')
    con,cur=database()
    sql = "select count(*) from users where userid='" + uid + "' and password='" + pswd + "'"
    cur.execute(sql)
    res = cur.fetchone()[0]
    print("res",res)
    if res > 0:
        session['uid'] = uid
        qry = "select * from users where userid= '" + uid + " ' "
        cur.execute(qry)
        val = cur.fetchall()
        for values in val:
            name = values[0]
            print(name)

        return render_template("user_home.html", name=name)
    else:
        return render_template("user.html", msg="Invalid Credentials")
    return ""

@app.route("/uhome")
def uhome():
    con,cur=database()
    uid = session['uid']
    qry="select * from users where userid='"+uid+"'"
    cur.execute(qry)
    val = cur.fetchall()
    for values in val:
        name = values[0]
        print(name)

    return render_template("user_home.html",name=name)

@app.route("/evaluations")
def evaluations():
    return render_template("evaluations.html")

@app.route("/detection")
def detection():
    return render_template("detection.html")

@app.route("/detection2",methods =["GET", "POST"])
def detection2():
    uid = session['uid']
    image = request.files['pic']
    imgdata = secure_filename(image.filename)
    filename = image.filename

    filelist = [f for f in os.listdir("testimg")]
    for f in filelist:
        os.remove(os.path.join("testimg", f))
    image.save(os.path.join("testimg", imgdata))
    image_path = "../leaf_disease/testimg/" + filename
    result = img_prediction(image_path)
    #print(result)
    if result=="Invalid image, please select a valid image.":
        return render_template("detection.html",msg="invaid")

    else:
        # Split the result by the underscore
        parts = result.split('_')
        # Extract the plant and disease
        plant = parts[0]
        disease = ' '.join(parts[1:])  # Join the remaining parts for the disease
        disease = ' '.join(parts[1:])  # Join the remaining parts for the disease
        con, cur = database()
        qry = "select * from remidies where disease='" + result + "'"
        cur.execute(qry)
        res = cur.fetchall()
        possibilities = res[0][1]
        solution = res[0][2]

        current_datetime = datetime.now()
        sql = "insert into history values(%s,%s,%s,%s,%s,%s)"
        values = (uid, plant, disease, possibilities, solution, current_datetime)
        cur.execute(sql, values)
        con.commit()

        return render_template("sltns3.html",possibilities=possibilities,solution=solution,plant=plant,
                               disease=disease)

@app.route("/lang_translator/<lang>/<plant>/<disease>/<possibilities>/<solution>")
def lang_translator(lang,plant,disease,possibilities,solution):
    plant_translated = translator.translate(plant,dest=lang).text
    disease_translated = translator.translate(disease, dest=lang).text
    possibilities_translated = translator.translate(possibilities, dest=lang).text
    solutions_translated = translator.translate(solution, dest=lang).text
    return render_template('sltns3.html',possibilities=possibilities_translated,solution=solutions_translated,
                           plant=plant_translated,
                           disease=disease_translated)

@app.route("/history")
def history():
    uid = session['uid']
    con,cur = database()
    qry = "select * from history where userid='"+uid+"'"
    cur.execute(qry)
    res = cur.fetchall()
    return render_template("view_history.html",rawdata=res)


#DATABASE CONNECTION
def database():
    con = mysql.connector.connect(host="127.0.0.1", user='root', password="root", database="plant_leaf_disease")
    cur = con.cursor()
    return con, cur

if __name__ == '__main__':
    app.run(debug=True)
