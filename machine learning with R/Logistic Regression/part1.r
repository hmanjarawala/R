# LOGISTIC REGRESSION
df.train <- read.csv('~/R Scripts/Files/titanic_train.csv')
print(head(df.train))
print(str(df.train))

#install.packages('Amelia')
library(Amelia)
#print(missmap(df.train, main = 'Missing Map', col = c('yellow', 'black'), legend = FALSE))
library(ggplot2)
print(ggplot(df.train,aes(Survived)) + geom_bar())
print(ggplot(df.train,aes(Pclass)) + geom_bar(aes(fill=factor(Pclass))))
print(ggplot(df.train,aes(Sex)) + geom_bar(aes(fill=factor(Sex))))
print(ggplot(df.train,aes(Age)) + geom_histogram(bins = 20, alpha = 0.5, fill='blue'))
print(ggplot(df.train,aes(SibSp)) + geom_bar())
print(ggplot(df.train,aes(Fare)) + geom_histogram(alpha = 0.5, fill='green', color = 'black'))
pl <- ggplot(df.train, aes(x=Pclass,y=Age))
pl <- pl + geom_boxplot(alpha=.4,aes(group=Pclass,fill=factor(Pclass)))
print(pl + scale_y_continuous(breaks = seq(min(0),max(80),by=2)) + theme_bw())

#IMPUTATION OF AGE BASED ON CLASS
##
impute_age <- function(age,class){
  out <- age
  for(i in 1:length(age)){
    
    if(is.na(age[i])){
      
      if(class[i]==1){
        out[i] <- 37
      }else if(class[i]==2){
        out[i] <- 29
      }else{
        out[i] <- 24
      }
      
    }else{
      out[i] <- age[i]
    }
  }
  return(out)
}

########################
fixed.ages <- impute_age(df.train$Age,df.train$Pclass)
###
df.train$Age <- fixed.ages
###
print(missmap(df.train, main = 'Imputation Check', col = c('yellow', 'black'), legend = FALSE))
library(dplyr)
df.train <- select(df.train, -PassengerId, -Name, -Ticket, -Cabin)
df.train$Survived <- factor(df.train$Survived)
df.train$Pclass <- factor(df.train$Pclass)
df.train$Parch <- factor(df.train$Parch)
df.train$SibSp <- factor(df.train$SibSp)
####### Generate Model
log.model <- glm(formula = Survived ~ ., family = binomial(link = 'logit'), data = df.train)
print(summary(log.model))
library(caTools)
set.seed(101)
split <- sample.split(df.train$Survived,SplitRatio = .7)
final.trail <- subset(df.train, split == TRUE)
final.test <- subset(df.train, split == FALSE)
final.log.model <- glm(formula = Survived ~ ., family = binomial(link = 'logit'), data = final.trail)
fitted.probabilities <- predict(final.log.model,final.test,type = 'response')
fitted.result <- ifelse(fitted.probabilities>.5,1,0)
misClassError <- mean(fitted.result != final.test$Survived)
print(1 - misClassError)
# Confusion Matrix
print(table(final.test$Survived,fitted.probabilities>.5))
