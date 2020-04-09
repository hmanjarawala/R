# NEURAL NETWORKS
# install.packages('MASS')
library(MASS)
# head(Boston)
data <- Boston
# Normalize data
maxs <- apply(data, 2, max)
mins <- apply(data, 2, min)
scaled.data <- scale(data,center = mins, scale = maxs - mins)
scaled <- as.data.frame(scaled.data)
# head(scaled)
# Split data for training
library(caTools)
split <- sample.split(scaled$medv, SplitRatio = 0.7)
train <- subset(scaled, split == TRUE)
test <- subset(scaled, split == FALSE)
# Train neural network model
# install.packages('neuralnet')
library(neuralnet)
n <- names(train)
f <- as.formula(paste("medv ~",paste(n[!n %in% 'medv'], collapse = '+')))
nm <- neuralnet(formula = f, data = train, hidden = c(5,3), linear.output = TRUE)
plot(nm)
# Test the mdel
predicted.nm.values <- compute(nm, test[1:14])
true.prediction <- predicted.nm.values$net.result*(max(data$medv) - min(data$medv))+min(data$medv)
# Convert the test data
test.r <- (test$medv)*(max(data$medv) - min(data$medv)) + min(data$medv)
MSE.nm <- sum((test.r - true.prediction)^2)/nrow(test) # Calculate MEAN SQUARE ERROR
error.df <- data.frame(test.r, true.prediction)
# Create visulization
library(ggplot2)
print(ggplot(error.df,aes(x=test.r,y=true.prediction)) + geom_point() + stat_smooth())
