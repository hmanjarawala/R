# Generate Vectors
V <- c(3,42,125,72) # Generate numeric vector using combine function.
V
is.numeric(V) # Return TRUE as V is numeric vector
is.integer(V) # Return FALSE as V is type double vector
is.double(V) # Return TRUE as V is type double vector

V1 <- c(3L, 12L,754L,23L) # Generate numeric vector using combine function.
V1
is.numeric(V1) # Return TRUE as V1 is numeric vector
is.integer(V1) # Return TRUE as V1 is type integer vector
is.double(V1) # Return FALSE as V1 is type integer vector

V2 <- c('H', "FOO", "AB", 7) # Generate character vector using combine function.
V2
is.character(V2) # Return TRUE as V2 is character vector
is.numeric(V2) # Return FALSE as V2 is character vector

# Generate Vector using seq() function
seq(from = 1,to = 15) # Generate vector of sequance from 1 to 15. Equivalent of 1:15
1:15 # same as above without using seq() function
seq(1:15) # another way to create sequance from 1 to 15

seq(from=1,to=15,by=2) # Generate vector of odd numbers from 1 to 15

# Generate Vector using rep() function
rep(3,10) # Replicate 3, 10 times
rep('h',5) # Replicate 'h', 5 times
x <- c(20,80)
rep(x,10) # Replicate vector x, 10 times
