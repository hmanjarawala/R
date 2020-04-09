# install.packages('tidyr')
# install.packages('data.table')
library(tidyr)
library(data.table)

# gather()
comp <- c(1,1,1,2,2,2,3,3,3)
yr <- c(1998,1999,2000,1998,1999,2000,1998,1999,2000)
q1 <- runif(9, min = 0, max = 100)
q2 <- runif(9, min = 0, max = 100)
q3 <- runif(9, min = 0, max = 100)
q4 <- runif(9, min = 0, max = 100)

df <- data.frame(comp=comp,year=yr,Qtr1=q1,Qtr2=q2,Qtr3=q3,Qtr4=q4)

result <- gather(df,Quater,Revenue,Qtr1:Qtr4) # Gather columns into key-value pairs
print(result)
# Alternatively
result <- df %>% gather(key = Quater, value = Revenue,Qtr1:Qtr4)
print(result)

# spread()
result <- spread(result, key = Quater, value = Revenue)
print(result)
# Alternatively
result <- result %>% spread(key = Quater, value = Revenue)
print(result)

# separate()
df <- data.frame(new_col=c(NA,'a.x','b.y','c.z'))
df.sep <- separate(data = df, col = new_col, into = c('ABC','XYZ'))
print(df.sep)

df <- data.frame(new_col=c(NA,'a-x','b-y','c-z'))
df.sep <- separate(data = df, col = new_col, into = c('abc','xyz'), sep = '-')
print(df.sep)

# unite()
df <- unite(data = df.sep, col = new_col, abc, xyz, sep = '<<>>')
print(df)

#stocks <- data.frame(
#  time = as.Date('2020-01-03') + 0:9,
#  X = rnorm(10, 0, 1),
#  Y = rnorm(10, 0, 2),
#  Z = rnorm(10, 0, 4)
#)
