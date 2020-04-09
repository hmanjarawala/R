# K MEANS CLUSTERING

library(ISLR)
print(head(iris))

library(ggplot2)
pl <- ggplot(iris, aes(Petal.Length,Petal.Width,color=Species))
print(pl + geom_point(size=4))
set.seed(101)
irisCluster <- kmeans(iris[,1:4],3,nstart = 20)
print(irisCluster)
table(irisCluster$cluster,iris$Species)
library(cluster)
clusplot(iris,irisCluster$cluster,color = TRUE,shade = TRUE,labels = 0,lines = 0)
