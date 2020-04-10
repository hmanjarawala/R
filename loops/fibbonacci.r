# Program to print 1st 10 fibbonacCi numbers
n <- 10

a <- 0
b <- 1

for(i in 1:n){
  print(a)
  a <- b - a
  b <- a + b
}