library(tidyverse)
library(caret)

churn_df <- read_csv("churn.csv")
View(churn_df)

#prepare
#split data
train_test_split <- function(data){
  n <- nrow(data)
  train_id <- sample(1:n, 0.8*n)
  train_df <- data[train_id, ]
  test_df <- data[-train_id, ]
  return(list ( train_df, test_df))
}
split_churn <- train_test_split(churn_df)

#2 train 
model <- train(churn ~ totaldaycharge+totalnightcharge,
               data = prepare_df[[1]],
               method = "glm")

#3 test
predict_churn <- predict(model, newdata = prepare_df[[2]])

#4 score and evaluate
acc <- mean(predict_churn == split_churn[[2]]$churn)
