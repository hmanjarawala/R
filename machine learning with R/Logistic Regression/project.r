################################
# Logistic Regression Project
################################

# In this project we will be working with the UCI adult dataset. We will be attempting to
# predict if people in the data set belong in a certain class by salary, either making <=50k
# or >50k per year.

# Typically most of your time is spent cleaning data, not running the few lines of code that
# build your model, this project will try to reflect that by showing different issues that may
# arise when cleaning data.

# Get the Data
setwd("C:\\Users\\himanshu.manjarawala\\Documents\\R Programming\\R\\Files")
adult <- read.csv('adult_sal.csv')

# Check the head of adult
print(head(adult))

# You should notice the index has been repeated. Drop this column.
library(dplyr)
adult <- select(adult, -X)

# Check the head,str, and summary of the data now.
print(head(adult))
print(str(adult))
print(summary(adult))

# Data Cleaning
# type_employer column
# Use table() to check out the frequency of the type_employer column.
print(table(adult$type_employer))

# How many Null values are there for type_employer? What are the two smallest groups?
# 1846 Null values
# Never-worked and Without-pay

# Combine these two smallest groups into a single group called "Unemployed". There are lots
# of ways to do this, so feel free to get creative. Hint: It may be helpful to convert these
# objects into character data types (as.character() and then use sapply with a custom
# function)
unemp <- function(obj){
  job <- as.character(obj)
  if(job == 'Never-worked' | job == 'Without-pay'){
    return('Unemployed')
  }else{
    return(job)
  }
}
adult$type_employer <- sapply(adult$type_employer,unemp)
print(table(adult$type_employer))

# What other columns are suitable for combining? Combine State and Local gov jobs into a
# category called SL-gov and combine self-employed jobs into a category called self-emp.
comb <- function(obj){
  job <- as.character(obj)
  if(job == 'State-gov' | job == 'Local-gov'){
    return('SL-gov')
  }else if(job == 'Self-emp-inc' | job == 'Self-emp-not-inc'){
    return('self-emp')
  }else{
    return(job)
  }
}
adult$type_employer <- sapply(adult$type_employer,comb)
print(table(adult$type_employer))

# Marital Column
# Use table() to look at the marital column
print(table(adult$marital))

# Reduce this to three groups:
#   Married
#   Not-Married
#   Never-Married
married <- function(obj){
  stat <- as.character(obj)
  if(stat == 'Married-AF-spouse' | stat == 'Married-civ-spouse' | 
     stat == 'Married-spouse-absent'){
    return('Married')
  }else if(stat == 'Divorced' | stat == 'Separated' | stat == 'Widowed'){
    return('Not-Married')
  }else{
    return(stat)
  }
}
adult$marital <- sapply(adult$marital,married)
print(table(adult$marital))

# Country Column
# Check the country column using table()
print(table(adult$country))


