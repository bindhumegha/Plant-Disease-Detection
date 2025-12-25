# Plant Disease Detection Using Machine Learning

## Project Overview
Plant diseases are a major cause of reduced agricultural productivity. Early detection of these diseases is essential to prevent crop loss and improve yield. However, manual identification is time-consuming and requires expert knowledge.

This project implements a **Plant Disease Detection System using Machine Learning**, where a **Convolutional Neural Network (CNN)** is trained to detect plant diseases from leaf images. The system identifies the disease, explains its cause, and suggests possible solutions.

---

![Image](static/plant.png)

---

## Objectives
- Detect plant diseases from leaf images
- Identify the disease accurately using CNN
- Provide disease cause and preventive solutions
- Assist farmers with early diagnosis
- Promote smart and sustainable agriculture

---

## Technology Stack

| Category | Technologies |
|--------|--------------|
| Programming Language | Python |
| Machine Learning Model | Convolutional Neural Network (CNN) |
| Libraries | TensorFlow, Keras, NumPy, OpenCV, Matplotlib |
| Platform | Jupyter Notebook / Python |
| Version Control | Git & GitHub |

---

## System Architecture
1. User uploads a plant leaf image  
2. Image preprocessing (resize, normalization)  
3. Feature extraction using CNN  
4. Disease classification  
5. Output:
   - Disease name  
   - Cause of disease  
   - Suggested solution  

---

## Dataset Description
- Contains images of healthy and diseased plant leaves  
- Multiple disease categories supported  
- Images are preprocessed before training  
- Dataset is divided into:
  - Training set
  - Validation set
  - Testing set  

*(Dataset can be obtained from sources like Kaggle or custom collections.)*

---

## Model Details
- Model Type: Convolutional Neural Network (CNN)
- Layers Used:
  - Convolutional Layers
  - Max Pooling Layers
  - Flatten Layer
  - Fully Connected (Dense) Layers
- Activation Functions:
  - ReLU
  - Softmax
- Optimizer: Adam
- Loss Function: Categorical Cross-Entropy

---

## Model Performance
- Achieved good accuracy on training and validation data
- Handles multiple plant diseases efficiently
- Overfitting reduced using data augmentation

*(Performance may vary depending on dataset size and quality.)*

---

## How to Run the Project

### Step 1: Clone the Repository
```bash
git clone https://github.com/your-username/plant-disease-detection.git
cd plant-disease-detection
```
### Step 2: Install Dependencies
```bash
pip install -r requirements.txt
```
### Step 3: Run the Application
```bash
python main.py
```

---

## Sample Output
- **Input**: Leaf image.
- **Output**:
  - Disease Detected: Leaf Blight.
  - Cause: Fungal infection.
  - Solution: Apply appropriate fungicide and maintain proper irrigation

---

## Applications
- Smart farming systems.
- Agricultural decision support tools.
- Crop disease monitoring.
- Academic and research projects.

---

## Future Enhancements
- Mobile application support.
- Real-time camera-based detection.
- Cloud deployment.
- Multilingual support.
- More plant and disease classes.
