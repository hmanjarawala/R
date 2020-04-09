# You can download the data or just use the supplied csv in the repository. The data has the following features:
  
#   datetime - hourly date + timestamp
#   season - 1 = spring, 2 = summer, 3 = fall, 4 = winter
#   holiday - whether the day is considered a holiday
#   workingday - whether the day is neither a weekend nor holiday
#   weather -
#     1: Clear, Few clouds, Partly cloudy, Partly cloudy
#     2: Mist + Cloudy, Mist + Broken clouds, Mist + Few clouds, Mist
#     3: Light Snow, Light Rain + Thunderstorm + Scattered clouds, Light Rain + Scattered clouds
#     4: Heavy Rain + Ice Pallets + Thunderstorm + Mist, Snow + Fog
#   temp - temperature in Celsius
#   atemp - "feels like" temperature in Celsius
#   humidity - relative humidity
#   windspeed - wind speed
#   casual - number of non-registered user rentals initiated
#   registered - number of registered user rentals initiated
#   count - number of total rentals

library(ggplot2)
library(corrgram)

# Read in bikeshare.csv file and set it to a dataframe called bike.
df <- read.csv(file = '~/R Scripts/Files/bikeshare.csv')

# Check the head of df
print(head(df))

###############################################
# Exploratory Data Analysis
###############################################

# Create a scatter plot of count vs temp. Set a good alpha value.
print(ggplot(df,aes(x=temp,y=count,color=temp)) + geom_point(alpha=.3,size=3) + theme_bw())

# Plot count versus datetime as a scatterplot with a color gradient based on temperature.
# You'll need to convert the datetime column into POSIXct before plotting.
df$datetime <- as.POSIXct(df$datetime)
print(ggplot(df,aes(x=datetime,y=count,color=temp)) + geom_point(alpha=.3,size=3) + 
        scale_color_continuous(low='#55D8CE',high='#FF6E2E') + theme_bw())

# What is the correlation between temp and count?
cor.data <- cor(df[,c('temp','count')])
print(cor.data)

# Let's explore the season data. Create a boxplot, with the y axis indicating count and
# the x axis begin a box for each season.
print(ggplot(df, aes(x=factor(season),y=count)) + geom_boxplot(aes(color=factor(season))) + 
        theme_bw())

##################################################
# Feature Engineering
##################################################

# Create an "hour" column that takes the hour from the datetime column. You'll probably need
# to apply some function to the entire datetime column and reassign it. Hint:
#     time.stamp <- bike$datetime[4]
#     format(time.stamp, "%H")
df$hour <- sapply(df$datetime,function(x){ format(x, '%H') })

# Now create a scatterplot of count versus hour, with color scale based on temp. Only use
# bike data where workingday==1.
# Optional Additions:
#     Use the additional layer: scale_color_gradientn(colors=c('color1',color2,etc..)) where
#     the colors argument is a vector gradient of colors you choose, not just high and low.
#     Use position=position_jitter(w=1, h=0) inside of geom_point() and check out what it does.
#
library(dplyr)
pl <- ggplot(filter(df,workingday==1), aes(x=hour,y=count))
pl <- pl + geom_point(aes(color=temp), position = position_jitter(w=1, h=0), alpha=.5)
pl <- pl + scale_color_gradientn(colors = c('dark blue','blue','light blue', 'light green', 'yellow', 'red'))
print(pl + theme_bw())

# Now create the same plot for non working days:
pl <- ggplot(filter(df,workingday==0), aes(x=hour,y=count))
pl <- pl + geom_point(aes(color=temp), position = position_jitter(w=1, h=0), alpha=.5)
pl <- pl + scale_color_gradientn(colors = c('dark blue','blue','light blue', 'light green', 'yellow', 'red'))
print(pl + theme_bw())

#############################################
# Building the Model
#############################################

# Use lm() to build a model that predicts count based solely on the temp feature, name it
# temp.model
temp.model <- lm(formula = count ~ temp, data = df)

# Get the summary of the temp.model
print(summary(temp.model))

# How many bike rentals would we predict if the temperature was 25 degrees Celsius?
# Calculate this two ways:
#     Using the values we just got above
#     Using the predict() function
# Method 1:
print(6.0462 + 9.1705 * 25)

# Method 2:
temp.test <- data.frame(temp=c(25))
print(predict(temp.model, temp.test))

# Use sapply() and as.numeric to change the hour column to a column of numeric values.
df$hour <- sapply(df$hour, as.numeric)

#  Finally build a model that attempts to predict count based off of the following features.
# Figure out if theres a way to not have to pass/write all these variables into the lm()
# function. Hint: StackOverflow or Google may be quicker than the documentation.
#
#     season
#     holiday
#     workingday
#     weather
#     temp
#     humidity
#     windspeed
#     hour (factor)
temp.model1 <- lm(formula = count ~ . - datetime - atemp - casual - registered, data = df)

# Get the summary of the model
print(summary(temp.model1))
