setwd("C:\\Users\\himanshu.manjarawala\\Documents\\R Programming\\R\\Files")
df <- read.csv('student-mat.csv', sep = ';')

# Split data into train and test set
#install.packages('caTools')
library(caTools)
library(ggplot2)
# Set a seed
set.seed(101)
# Split up sample
sample <- sample.split(df$G3, SplitRatio = .7)

# 70% of data --> train
train <- subset(df, sample == TRUE)

# 30% will be test
test <- subset(df, sample == FALSE)

# Train & Build model
model <- lm(G3 ~ ., data = train)

# Predictions
G3.predict <- predict(model, test)
result <- cbind(G3.predict, test$G3)
colnames(result) <- c('predicted','actual')
result <- as.data.frame(result)
print(head(result))

# Take care of negative value
to_zero <- function(x){
  if(x<0){
    return(0)
  }else{
    return(x)
  }
}

# Apply zero function
result$predicted <- sapply(result$predicted, function(x){
  if(x<0){0}else{x}
})

# Print mean squared error
mse <- mean((result$actual - result$predicted)^2)
print('MSE')
print(mse)

#RAISE
print('Square root of MSE')
print((mse)^.5)

#############
SSE <- sum((result$predicted - result$actual)^2)
SST <- sum((mean(df$G3) - result$actual)^2)

R2 <- 1 - SSE/SST
print('R2')
print(R2)

# Run Model


#Interpret the model
print(summary(model))

res <- residuals(model)
res <- as.data.frame(res)

print(ggplot(res, aes(x=res)) + geom_histogram(fill='blue',alpha=0.5))
