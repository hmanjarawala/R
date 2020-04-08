# Apply functions

v<- 1:5

addrandom <- function(x){
  rand <- sample(1:100, 1)
  return(x + rand)
}

result <- lapply(v, addrandom)  # lapply will returns list object.
print(result)

result <- sapply(v, addrandom) # user-friendly version and wrapper of lapply by default returning a vector, matrix
print(result)

result <- vapply(v, addrandom, c(0))
print(result)


result <- sapply(v, function(num){num*2}) # using anonymous function
print(result)

# Apply functions with more than one argument

add_choice <- function(num, choice){
  return(num + choice)
}

result <- sapply(v, add_choice, choice = 100) # argument function with more than one argument
print(result)

# Alternatively

result <- sapply(v, function(num, choice){num + choice}, choice = 200)
print(result)