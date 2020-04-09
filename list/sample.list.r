# Generate sample list from a vector, matrix and data frame.
v <- 1:3 #vector
m <- matrix(1:9, nrow = 3) #matrix
df <- mtcars #data frame
my.list = list(v,m,df)
print(my.list)

# Generate named list from above example
my.named.list = list(my.vector=v,my.matrix=m,my.data.frame=df)
print(my.named.list)

# Get objects from list
my.list[1] # return 1st object from list (Bracket Notation)
my.named.list[1]
my.named.list['my.matrix'] # return matrix object from list
my.named.list$my.matrix # Column Notation

# Difference between Column notation and Bracket notation
# Bracket notation returns list object instead of stored object. 
# i.e. my.named.list['my.matrix'] will return list object instead of matrix
print(class(my.named.list['my.matrix'])) # will return "list"
# but
print(class(my.named.list$my.matrix)) # will return "matrix"
# We can get same result in Bracket notation using "[[]]". i.e
print(class(my.named.list[['my.matrix']])) # will return "matrix"

# Combine multiple list into single list
my.named.list.1 <- list(my.vec1 = letters[1:5])
my.combined.list <- c(my.named.list,my.named.list.1)
print(my.combined.list)

# Get imformation about list
print(str(my.named.list))
