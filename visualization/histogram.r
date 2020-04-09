# install.packages('ggplot2')
# install.packages('ggplot2movies')
library(ggplot2)
library(ggplot2movies)

# Data & Aesthetics
pl <- ggplot(data = movies, aes(x=rating))

# Geometry
#pl1 <- pl + geom_histogram(binwidth = 0.1, color='green', fill='light green', alpha=0.3)
pl1 <- pl + geom_histogram(binwidth = 0.1, aes(fill=..count..))

# facets
pl2 <- pl1 + xlab("Movie Rating") + ylab("Count")

print(pl2 + ggtitle("My Title"))