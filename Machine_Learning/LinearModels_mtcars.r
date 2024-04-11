library(caret)

## Preview data 
head(mtcars)
nrow(mtcars)

## Example buile model r
model <- lm(mpg ~ hp + wt, data=mtcars )

model$coefficients

##BUILD STANDARD INTERFACE

train(mpg ~ hp + wt,
      data = mtcars,
      method = "lm")


##1. split data

train_test_split <- function (data, size = 0.8) {
  n <- nrow(data)
  train_id <- sample(1:n, size*n)
  train_df <- data[train_id,]
  test_df <- data[-train_id,]
  return( list(train_df, test_df))
}

prep_df <- train_test_split(mtcars, size = 0.8)
print(prep_df)

## 2. train model
## Resampling: Cross-Validated (5 fold) 

train_control <- trainControl(method = "cv",
                              number = 5)

model <-train(mpg~ hp + wt,
              data = prep_df[[1]],
              method = "lm",
              trControl = train_control )

## 3. score model

predict_mpg <- predict(model, newdata= prep_df[[2]])

## 4. evaluate model

actual_mpg <- prep_df[[2]]$mpg

## error = actual - prediction 
test_mae_mpg <- mean(abs(predict_mpg - actual_mpg ))
test_rmse_mpg <- sqrt(mean((predict_mpg - actual_mpg)**2))


test_mae_mpg
test_rmse_mpg
