library(ggplot2)

df <- mtcars

# Data & Aesthetics
pl <- ggplot(data = df, aes(x=wt,y=mpg))

# Geometry
#print(pl + geom_point(alpha=0.4,size=5))
pl1<- pl + geom_point(aes(shape=factor(cyl),color=hp), size=5)

pl2 <- pl1 + scale_color_gradient(low = 'blue', high = 'red')

print(pl2)