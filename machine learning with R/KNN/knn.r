# K Nearest Neighbour (KNN)
# install.packages('ISLR')
library(ISLR)

# GET THE DATA
purchase <- Caravan[,86]
print(var(Caravan[,1]))
print(var(Caravan[,2]))
#
standardized.carvan <- scale(Caravan[,-86])
print(var(standardized.carvan[,1]))
print(var(standardized.carvan[,2]))

#Train Test Split
test.index <- 1:1000
test.data <- standardized.carvan[test.index,]
test.purchase <- purchase[test.index]

train.data <- standardized.carvan[-test.index,]
train.purchase <- purchase[-test.index]


################
################
################
# KNN Model
library(class) # library contains KNN function
set.seed(101)

predicted.purchase <- knn(train.data,test.data,train.purchase,k=1)
print(head(predicted.purchase))
misclass.error <- mean(test.purchase != predicted.purchase)
print(misclass.error)

######
# Chosing K Value
######

predicted.purchase <- NULL
error.rate <- NULL

for(i in 1:20){
  set.seed(101)
  predicted.purchase <- knn(train.data,test.data,train.purchase,k=i)
  error.rate[i] <- mean(test.purchase != predicted.purchase)
}

print(error.rate)
###############
# Visualize K ELBOW METHOD
library(ggplot2)
k.values <- 1:20
error.df <- data.frame(error.rate,k.values)
print(ggplot(error.df, aes(x=k.values,y=error.rate)) + geom_point() + 
        geom_line(lty='dotted', color='red'))
