getwd()
setwd("C:\\Users\\himanshu.manjarawala\\Documents\\R Programming\\R\\Files")
getwd()

movies <- read.csv(file = "P2-Movie-Ratings.csv")
head(movies)
colnames(movies) <- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions", "Year")
head(movies)
tail(movies)
str(movies)
summary(movies)

factor(movies$Year) # convert column values into factor
movies$Year <- factor(movies$Year)

summary(movies)
str(movies)


#----------------Aesthetics
library(ggplot2)

ggplot(data = movies, aes(x=CriticRating, y=AudienceRating))

#Add geomatry
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating)) + 
  geom_point()

#Add color
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, color=Genre)) + 
  geom_point()

#Add Size
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, color=Genre, size=BudgetMillions)) + 
  geom_point()
# This is #1 we'll improve it.

#----------------Plotting with Layers
p <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, color=Genre, size=BudgetMillions))

#Point
p + geom_point()

#Line
p + geom_line()


#----------------Overriding Aesthetics
q <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, color=Genre, size=BudgetMillions))

#Add geom layer
q + geom_point()

#overriding aes
#Ex.1
q + geom_point(aes(size=CriticRating))

#Ex.2
q + geom_point(aes(color=BudgetMillions))

#Ex.3
q + geom_point(aes(x=BudgetMillions)) + xlab("Budget Millions $$$")

#Ex.4
q + geom_line() + geom_point()
#Redule line size
q + geom_line(size=1) + geom_point()


#----------------Mapping vs Setting

r <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#Add color
#1. Mapping (What we've done so far)
r + geom_point(aes(color=Genre))
#2. Setting
r + geom_point(color="DarkGreen")
#Error
r + geom_point(aes(color="DarkGreen"))

#1. Mapping
r + geom_point(aes(size=BudgetMillions))
#2. Setting
r + geom_point(size=10L)
#Error
r + geom_point(aes(size=10L))

#----------------Histograms & Density Charts

s <- ggplot(data = movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10L)
#Add color
s + geom_histogram(binwidth = 10L, aes(fill=Genre))
#Add border
s + geom_histogram(binwidth = 10L, aes(fill=Genre), color="Black")
#>>>3 (we'll improve it.)

#Sometimes you may need density charts
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position = "stack")


#----------------Starting Layer Tips
t <- ggplot(data = movies, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10L, fill = "White", color = "Blue")
#other way
t <- ggplot(data = movies)
t + geom_histogram(binwidth = 10L, aes(x=AudienceRating), fill = "White", 
                   color = "Blue")

#>>>4

t + geom_histogram(binwidth = 10L, aes(x=CriticRating), fill = "White", 
                   color = "Blue")

#>>>5


