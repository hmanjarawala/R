library(ggplot2)
library(ggthemes)
library(data.table)

# Import the ggplot2 data.table libraries and use fread to load the csv file
# 'Economist_Assignment_Data.csv' into a dataframe called df
# (Hint: use drop=1 to skip the first column)
df <- fread(file = '~/R Scripts/Files/Economist_Assignment_Data.csv', drop=1)

# Check the head of df
#print(head(df))

# Use ggplot() + geom_point() to create a scatter plot object called pl.
# You will need to specify x=CPI and y=HDI and color=Region as aesthetics
pl <- ggplot(data = df, aes(x=CPI,y=HDI,color=Region)) + geom_point()

# Change the points to be larger empty circles.
# (You'll have to go back and add arguments to geom_point() and reassign it to pl.)
# You'll need to figure out what shape= and size=
pl <- ggplot(data = df, aes(x=CPI,y=HDI,color=Region)) + geom_point(size=4,shape=1)

# Add geom_smooth(aes(group=1)) to add a trend line
#print(pl + geom_smooth(aes(group=1)))

# We want to further edit this trend line. Add the following arguments to geom_smooth
# (outside of aes):
#
#   method = 'lm'
#   formula = y ~ log(x)
#   se = FALSE
#   color = 'red'
#
# Assign all of this to pl2
pl2 <- pl + geom_smooth(aes(group=1), method = 'lm', formula = y ~ log(x),
                        se = FALSE, color = 'red')

# It's really starting to look similar! But we still need to add labels,
# we can use geom_text! Add geom_text(aes(label=Country)) to pl2 and see what happens.
# (Hint: It should be way too many labels)
#print(pl2 + geom_text(aes(label=Country)))

# Labeling a subset is actually pretty tricky! So we're just going to give you the answer
# since it would require manually selecting the subset of countries we want to label!
pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

pl3 <- pl2 + geom_text(aes(label = Country), color = "gray20", 
                       data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE)

# Almost there! Still not perfect, but good enough for this assignment. Later on we'll see
# why interactive plots are better for labeling. Now let's just add some labels and a theme,
# set the x and y scales and we're done!
#
# Add theme_bw() to your plot and save this to pl4
pl4 <- pl3 + theme_economist_white()

# Add scale_x_continuous() and set the following arguments:
#
#   name = Same x axis as the Economist Plot
#   limits = Pass a vector of appropriate x limits
#   breaks = 1:10
#
pl5 <- pl4 + scale_x_continuous(name = "Corruption Perceptions Index, 2011 (10=least corrupt)",
                               limits = c(.9, 10.5),breaks = 1:10)

# Now use scale_y_continuous to do similar operations to the y axis!
pl6 <- pl5 + scale_y_continuous(name = "Human Development Index, 2011 (1=Best)", 
                               limits = c(.2,1.0))

# Finally use ggtitle() to add a string as a title.
print(pl6 + ggtitle("Corruption and Human development"))