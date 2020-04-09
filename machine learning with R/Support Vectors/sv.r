library(ISLR)
print(head(iris))
# install.packages('e1071')
library(e1071)
model <- svm(Species ~ ., data = iris)
summary(model)
predict.values <- predict(model, iris[1:4])
table(predict.values,iris[,5])
tune.results <- tune(svm, train.x = iris[1:4], train.y = iris[,5], kernel = 'radial', 
                     ranges = list(cost=c(0.5,1,1.5),gama = c(0.1,0.5,0.7)))
summary(tune.results)
# cost = 1.5
# gama = 0.1
tune.svm <- svm(Species ~ ., data = iris, kernel = 'radial', cost = 1.5, gama = 0.1)
summary(tune.svm)
