library(ggplot2)
library(ggplot2movies)

pl <- ggplot(movies,aes(x=year,y=rating))

#pl1 <- pl + geom_bin2d(binwidth=c(3,1))

# install.packages('hexbin')
#pl1 <- pl + geom_hex()

#print(pl1 + scale_fill_gradient(low = 'blue', high = 'red'))

pl1 <- pl + geom_density2d()

print(pl1)