# Visualization with ggPlot2
#
# Different layers of visulization are:
# 1. Data
# 2. Aesthetics
# 3. Geometries
# 4. Facets
# 5. Statistics
# 6. Coordinates
# 7. Theme
# install.packages('ggplot2')
#
library(ggplot2)

pl <- ggplot(data=mtcars,aes(x=mpg,y=hp)) # Data + Aesthetics
pl <- pl + geom_point() # Geometries
pl2 <- pl + facet_grid(cyl~.) # Facets
pl2 <- pl2 + stat_smooth() # Statistics
pl2 <- pl2 + coord_cartesian(xlim = c(15,25)) # Coordinates
print(pl2 + theme_bw()) # Theme