library(ggplot2)
library(plotly)

pl <- ggplot(mtcars, aes(x=mpg,y=wt)) + geom_point()

gpl <- ggplotly(pl)

print(gpl)