##Note : Frontend Part repository link (with release): [Link for frontend (Flutter App)](https://github.com/(ankit7115/CarPriceo_frontend)
# Car Price Predictor

A machine learning project to predict car prices based on various features.

## Introduction

The Car Price Predictor is a machine learning model designed to predict the selling price of cars based on features such as company, model, age, fuel type and more. 
This project uses a dataset of historical car prices to train and evaluate the predictive model.

## Features

- **Data Preprocessing**: Clean and prepare the dataset for training.
- **Model Selection**: Choose and train a suitable machine learning model.
- **Prediction**: Predict car prices based on user input.
- **Web Interface**: Provide a simple web interface for users to input car features and get price predictions.

## Installation

To run the Car Price Predictor locally, follow these steps:

1. Clone the repository
2. Install the required dependencies:
   ```bash
   pip install -r requirements.txt
   ```
## Usage   
1. Start the web interface:
   ```bash
   python manage.py runserver
   ```
2. Open your web browser and go to http://localhost:5000 to use the Car Price Predictor.

## Dataset
The dataset used for this project contains various features of cars, including:

+ Company: The manufacturer of the car.
+ Model: The specific model of the car.
+ Year: The manufacturing year of the car.
+ Fuel Type: The type of fuel the car uses (e.g., Petrol, Diesel).
+ Travelled Distance: The distance in Km the car driven.
+ Price: The selling price of the car (target variable).

## Model Training

The model training process involves the following steps:

- **Data Preprocessing**: Handle missing values, encode categorical variables, and normalize numerical features.
- **Model Selection**: Train and evaluate machine learning models on Linear Regression.
- **Hyperparameter Tuning**: Optimize the model parameters to improve performance.

## Evaluation

Evaluate the performance of the trained model using metrics such as:

- Mean Absolute Error (MAE)
- Mean Squared Error (MSE)
- R-squared (R²) score

Visualize the results using plots to compare the predicted prices with the actual prices.

## Deployment

Deploy the model as a web service:

[Car Price Predictor on Render](https://car-priceo.onrender.com)

## Contact

If you have any questions or suggestions, feel free to contact the project maintainer:

- **Email**: [ankitsrivastav5555@gmail.com](mailto:ankitsrivastav5555@gmail.com)

