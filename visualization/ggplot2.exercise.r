library(ggplot2)
library(ggthemes)

# For the first few plots, use the mpg dataset 
# Histogram of hwy mpg values:

print(ggplot(mpg, aes(x=hwy)) + geom_histogram(fill='red',alpha=0.5))

# Barplot of car counts per manufacturer with color fill defined by cyl count

print(ggplot(mpg, aes(x=manufacturer)) + geom_bar(aes(fill=factor(cyl))) + theme_gdocs())

# Switch now to use the txhousing dataset that comes with ggplot2
# Create a scatterplot of volume versus sales. Afterwards play around with alpha and color
# arguments to clarify information.
print(ggplot(txhousing, aes(x=sales,y=volume)) + geom_point(alpha=0.5,color='blue'))

# Add a smooth fit line to the scatterplot from above. Hint: You may need to look up geom_smooth()
print(ggplot(txhousing, aes(x=sales,y=volume)) + geom_point(alpha=0.5,color='blue') + geom_smooth(color='red'))
