# Generate a Sequance of 1st 5 numbers
seq(5)

# Generate a sequance of 1st 5 alternate numbers
seq(1, 10, by = 2)

# Sort a vector
sort(c(1,5,3,7))

sort(c(1,5,3,7), decreasing = TRUE) # Sort in descending order

sort(c('a', 'd', 'b'))

sort(c('a', 'd', 'b', 'A', 'C'))

# Reverse elements in objects
rev(1:5)

rev(letters[4:7])

# Show structure of the object
str(mtcars)
summary(mtcars)

# Merge objects togather
v <- c(0)
v <- append(v, 7, after = length(v))
v <- append(v, 11, after = length(v))
