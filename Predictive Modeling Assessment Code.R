# Getting the current working directory and saving the correct working directory for this project
getwd()
setwd("/Users/graydon/Desktop/Predictive Modeling Project for BLA")
# Loading the necessary packages needed for this project
library(tidyverse)
library(caret)
library(GGally)
# Loading the original data set into R
data <- read.csv("PredictiveModelingAssessmentData.csv")
data
# Creating a plot to examine the relationship between x1, x2 and y
ggpairs(data=data, columns = 1:3, title = "Predictive Modeling Assessment Data")
# Splitting the original data set into smaller training and test data sets
set.seed(123)
training.samples <- data$y %>%
  createDataPartition(p = 0.8, list = FALSE)
train.data <- data[training.samples, ]
test.data <- data[-training.samples, ]
train.data
test.data
# The model which best minimized the RMSE while not overfitting (R^2 adjusted = maxed out)
my.model <- lm(y ~ x1/I(x1^3) * log2(x2) * (I(x1^2)), data=train.data)
summary(my.model)
predictions.train <- my.model %>% predict(train.data)
data.frame(RMSE = RMSE(predictions.train, train.data$y),
           R2 = R2(predictions.train, train.data$y))
# Testing model on test portion of original data set
predictions.test <- my.model %>% predict(test.data)
data.frame(RMSE = RMSE(predictions.test, test.data$y),
           R2 = R2(predictions.test, test.data$y))

# Implementing model to predict value of y for new data provided in "TestData.csv"
new.data <- read.csv("TestData.csv")
new.data
predictions.new.data <- my.model %>% predict(new.data)

# Saving predictions for new data to a csv titled "TestDataPredictions.csv"
write.csv(predictions.new.data, "TestDataPredictions.csv",
          row.names = FALSE)
