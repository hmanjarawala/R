# 1: Create a function that takes in a name as a string argument, and prints out "Hello name"
hello_you <- function(name){
  print(paste("Hello",name))
}

# 2: Create a function that takes in a name as a string argument and returns a string of the form - "Hello name"
hello_you2 <- function(name){
  return(paste("Hello",name))
}

print(hello_you2('Sam'))

# 3: Create a function that will return the product of two integers.
prod <- function(num1, num2){
  return(num1*num2)
}
prod(3,4)

# 4: Create a function that accepts two arguments, an integer and a vector of integers. It returns TRUE if the integer
# is present in the vector, otherwise it returns FALSE. Make sure you pay careful attention to your placement of the
# return(FALSE) line in your function!
num_check <- function(num,vec){
  ret.val <- FALSE
  for(ele in vec){
    if(num == ele){
      ret.val <- TRUE
      break
    }
  }
  return(ret.val)
}

print(num_check(2,c(1,2,3)))
print(num_check(2,c(1,4,5)))

# 5: Create a function that accepts two arguments, an integer and a vector of integers. It returns the count of the number
# of occurences of the integer in the input vector. 
num_count <- function(num,vec){
  num.cnt <- 0
  for(ele in vec){
    if(num == ele){
      num.cnt <- num.cnt + 1
    }
  }
  return(num.cnt)
}

print(num_count(2,c(1,1,2,2,3,3)))
print(num_count(1,c(1,1,2,2,3,1,4,5,5,2,2,1,3)))

# 6: We want to ship bars of aluminum. We will create a function that accepts an integer representing the requested
# kilograms of aluminum for the package to be shipped. To fullfill these order, we have small bars (1 kilogram each)
# and big bars (5 kilograms each). Return the least number of bars needed. 

#For example, a load of 6 kg requires a minimum of two bars (1 5kg bars and 1 1kg bars). A load of 17 kg requires a
# minimum of 5 bars (3 5kg bars and 2 1kg bars). 
bar_count <- function(req.kgs){
  kg.bars <- req.kgs %% 5
  req.kgs <- req.kgs - kg.bars
  return((req.kgs/5) + kg.bars)
}

print(bar_count(6))
print(bar_count(17))

# 7: Create a function that accepts 3 integer values and returns their sum. However, if an integer value is evenly
# divisible by 3, then it does not count towards the sum. Return zero if all numbers are evenly divisible by 3.

# Hint: You may want to use the append() function.
summer <- function(num1, num2, num3){
  v <- c(0)
  if(num1 %% 3 != 0){
    v <- append(num1,v, after = length(v))
  }
  if(num2 %% 3 != 0){
    v <- append(num2,v, after = length(v))
  }
  if(num3 %% 3 != 0){
    v <- append(num3,v, after = length(v))
  }
  
  return(sum(v))
}

print(summer(7,2,3))
print(summer(3,6,9))
print(summer(9,11,12))

# 8: Create a function that will return TRUE if an input integer is prime. Otherwise, return FALSE. You may want to look
# into the any() function.

prime_check <- function(num) {
  if (num == 2) {
    return(TRUE)
  } else if (any(num %% 2:(num-1) == 0)) {
    return(FALSE)
  } else { 
    return(TRUE)
  }
}

# Alternatively:
prime_check <- function(num){
  # Could put more checks for negative numbers etc...
  if (num == 2) {
    return(TRUE)
  }
  for (x in 2:(num-1)){
    
    if ((num%%x) == 0){
      return(FALSE)
    }
  }
  return(TRUE)
  
}