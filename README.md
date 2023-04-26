# Predictive-Modeling-Project
For the purposes of this project, I divided the original data provided in PredictiveModelingProjectData.csv into both a training and test dataset. I then developed multiple models attempting to accurately predict the training dataset and tested these models against the test dataset in an attempt to reduce the RMSE while also using other factors to make sure I wasn't overfitting my model to the training data set. Once a model was identified that reduced the RSME and increased accuracy without overfitting it on the data contained in the training dataset, I tested this model on the TestData.csv to obtain the predicted values of y for each new value of x1 and x2 contained in TestData.csv.  

PredictiveModelingProjectData = the original data provided on the y, x1 and x2 variables

TestData = new data to apply model to in order to generate predictions for what y should be given certain values of x1 and x2

Predictive Modeling Project Code = code used in order to train and test various models on the original data in order to identify the most accurate model that reduces
the RMSE while not overfitting based on the data contained in the training dataset. Also includes code used to test the proposed model on the data contained in TestData.csv.

TestDataPredictions = the predictions for the value of y obtained from applying the model identified in the predictive modeling code against the data contained in the TestData.csv file
