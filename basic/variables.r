# Types of variable in R

#Integer
x <- 2L
print(paste('type of x is', typeof(x)))

#Double
y <- 2.5
print(paste('type of y is', typeof(y)))
z <- 5
print(paste('type of z is', typeof(z)))

#Complex
p <- 3 + 2i
print(paste('type of p is', typeof(p)))

#Character
a <- 'H'
print(paste('type of a is', typeof(a)))
b <- 'Hello'
print(paste('type of b is', typeof(b)))

#Logical
q1 <- T
print(paste('type of q1 is', typeof(q1)))
q2 <- TRUE
print(paste('type of q2 is', typeof(q2)))
p1 <- F
print(paste('type of p1 is', typeof(p1)))
p2 <- FALSE
print(paste('type of p2 is', typeof(p2)))