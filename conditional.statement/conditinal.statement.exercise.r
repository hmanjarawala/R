# 1: Write a script that will print "Even Number" if the variable x is an even number, otherwise print "Not Even": 
x <- 3
if(x %% 2 == 0){
  print("Even Number")
}else{
  print('Not Even')
}

# 2: Write a script that will print 'Is a Matrix' if the variable x is a matrix, otherwise print "Not a Matrix".
# Hint: You may want to check out help(is.matrix) 
x <- matrix()
if(is.matrix(x)){
  print("Is a Matrix")
}else{
  print('Not a Matrix')
}

# 3: Create a script that given a numeric vector x with a length 3, will print out the elements in order from high to low.
# You must use if,else if, and else statements for your logic. (This code will be relatively long) 
x <- c(3,7,1)
if(x[1] > x[2]){
  fir <- x[1]
  sec <- x[2]
}else{
  fir <- x[2]
  sec <- x[1]
}
if(x[3] < fir & x[3] > sec){
  thr <- sec
  sec <- x[3]
}else if(x[3] < sec){
  thr <- x[3]
}else{
  thr <- sec
  sec <- fir
  fir <- x[3]
}
print(paste(fir, sec, thr))
# 4: Write a script that uses if,else if, and else statements to print the max element in a numeric vector with 3
# elements. 
x <- c(20,10,1)
if(x[1] > x[2]){
  if(x[1] > x[3]){
    print(x[1])
  }else{
    print(x[3])
  }
}else{
  if(x[2] > x[3]){
    print(x[2])
  }else{
    print(x[3])
  }
}