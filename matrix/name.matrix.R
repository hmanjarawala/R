# create vector
V <- 1:5
V
# give names
names(V) <- c('a','b','c','d','e')
V
V['d']
# clear names
names(V) <- NULL
V

#----------------------

#Naming matrix dimentions
rep(c('a', 'b', 'zZ'), times=3)
temp.vec <- rep(c('a', 'b', 'zZ'), each=3)
temp.vec
mat <- matrix(temp.vec,3,3)
mat
rownames(mat) <- c('How', 'are', 'you')
mat
colnames(mat) <- c('x','y','z')
mat
