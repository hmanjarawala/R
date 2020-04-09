# install.packages('corrgram')
# install.packages('corrplot')
library(ggplot2)
library(ggthemes)
library(dplyr)
library(corrgram)
library(corrplot)


df <- read.csv('~/R Scripts/Files/student-mat.csv', sep = ';')
#numberic columns only
num.cols <- sapply(df,is.numeric)
# filter data
cor.data  <- cor(df[,num.cols])

print(cor.data)
print(corrplot(cor.data, method = 'color'))
print(corrgram(df))
print(corrgram(df, lower.panel = panel.shade, upper.panel = panel.pie, 
               text.panel = panel.txt, order = TRUE))
print(ggplot(df,aes(x=G3)) + geom_histogram(bins=20,alpha=.5,fill='blue'))
