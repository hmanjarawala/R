## TREE
# install.packages('rpart')
library(rpart)
str(kyphosis)
head(kyphosis)

tree <- rpart(Kyphosis ~ ., method = 'class', data = kyphosis)
printcp(tree)
plot(tree, uniform = TRUE, main = 'Kyphosis Tree')
text(tree, use.n = TRUE, all = TRUE)
# install.packages('rpart.plot')
library(rpart.plot)
prp(tree)

## RANDOM FOREST
# install.packages('randomForest')
library(randomForest)
rf.model <- randomForest(Kyphosis ~ ., data = kyphosis)
print(rf.model)
