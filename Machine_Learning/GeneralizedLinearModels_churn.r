library(tidyverse)
library(caret)

churn_df <- read_csv("churn.csv")

#split data
train_test_split <- function(data){
  n <- nrow(data)
  train_id <- sample(1:n, 0.8*n)
  train_df <- data[train_id, ]
  test_df <- data[-train_id, ]
  return(list ( train_df, test_df))
}
prepare_df <- train_test_split(churn_df)

#train 
model <- train(churn ~ totaldaycharge+totalnightcharge,
               data = prepare_df[[1]],
               method = "glm")

#test
predict_churn <- predict(model, newdata = prepare_df[[2]])

#score and evaluate
acc <- mean(predict_churn == split_churn[[2]]$churn)

acc
model
