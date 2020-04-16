library(dplyr)
# Follow the steps outlined in bold below using your new R skills and help the Oakland A's
# recruit under-valued players!

# Use R to open the Batting.csv file and assign it to a dataframe called batting using
# read.csv
setwd("C:\\Users\\himanshu.manjarawala\\Documents\\R Programming\\R\\Files")
batting <- read.csv(file = 'Batting.csv')

# Use head() to check out the batting
#print(head(batting))

# Use str() to check the structure. Pay close attention to how columns that start with a
# number get an 'X' in front of them! You'll need to know this to call those columns!
#print(str(batting))

# Make sure you understand how to call the columns by using the $ symbol.

# Call the head() of the first five rows of AB (At Bats) column
print(head(batting$AB,5))

# Call the head of the doubles (X2B) column
print(head(batting$X2B))

# We need to add three more statistics that were used in Moneyball! These are:
#
# Batting Average
# On Base Percentage
# Slugging Percentage
# 
# the Batting Average is equal to H (Hits) divided by AB (At Base). So we'll do the
# following to create a new column called BA and add it to our data frame:
batting$BA <- batting$H/batting$AB

# After doing this operation, check the last 5 entries of the BA column of your data
# frame and it should look like this:
print(tail(batting$BA,5))

# Now do the same for some new columns! On Base Percentage (OBP) and Slugging Percentage
# (SLG). Hint: For SLG, you need 1B (Singles), this isn't in your data frame. However you
# can calculate it by subtracting doubles,triples, and home runs from total hits (H): 
#1B = H-2B-3B-HR

# Create an OBP Column
batting$OBP <- (batting$H + batting$BB + batting$HBP) / (batting$AB + 
                                      batting$BB + batting$HBP + batting$SF)

# Create an SLG Column
batting$X1B <- batting$H - batting$X2B - batting$X3B - batting$HR
batting$SLG <- (batting$X1B + (2 * batting$X2B) + (3 * batting$X3B) + (4 * batting$HR)) /
  batting$AB

# Check the structure of your data frame using str()
#print(str(batting))

######################################################
# Merging Salary Data with Batting Data
######################################################

# Load the Salaries.csv file into a dataframe called sal using read.csv
sal <-  read.csv(file = '~/R Scripts/Files/Salaries.csv')

# Use summary to get a summary of the batting data frame and notice the minimum year in
# the yearID column. Our batting data goes back to 1871! Our salary data starts at 1985,
# meaning we need to remove the batting data that occured before 1985.
print(summary(batting))

# Use subset() to reassign batting to only contain data from 1985 and onwards
batting <- subset(batting, yearID>=1985)

# Now use summary again to make sure the subset reassignment worked, your yearID min should
# be 1985
print(summary(batting))

# Use the merge() function to merge the batting and sal data frames by
# c('playerID','yearID'). Call the new data frame combo
combo <- merge(batting, sal, by=c('playerID', 'yearID'))

# Use summary to check the data
print(summary(combo))

##############################################
# Analyzing the Lost Players
##############################################

# As previously mentioned, the Oakland A's lost 3 key players during the off-season.
# We'll want to get their stats to see what we have to replace. The players lost were:
# first baseman 2000 AL MVP Jason Giambi (giambja01) to the New York Yankees,
# outfielder Johnny Damon (damonjo01) to the Boston Red Sox and
# infielder Rainer Gustavo "Ray" Olmedo ('saenzol01').

# Use the subset() function to get a data frame called lost_players from the combo data frame
# consisting of those 3 players. Hint: Try to figure out how to use %in% to avoid a bunch of
# or statements!
lost_players <- subset(combo, playerID %in% c('giambja01','damonjo01','saenzol01'))

# Use subset again to only grab the rows where the yearID was 2001.
lost_players <- subset(lost_players,yearID==2001)

# Reduce the lost_players data frame to the following columns: playerID,H,X2B,X3B,HR,OBP,
#SLG,BA,AB
lost_players <- select(lost_players, playerID,H,X2B,X3B,HR,OBP,SLG,BA,AB)

#####################################################
# Replacement Players
#####################################################

# Now we have all the information we need! Here is your final task - Find Replacement
# Players for the key three players we lost! However, you have three constraints:
#
# The total combined salary of the three players can not exceed 15 million dollars.
# Their combined number of At Bats (AB) needs to be equal to or greater than the lost
# players.
# Their mean OBP had to equal to or greater than the mean OBP of the lost players

# Use the combo dataframe you previously created as the source of information! Remember to
# just use the 2001 subset of that dataframe. There's lost of different ways you can do this,
# so be creative! It should be relatively simple to find 3 players that satisfy the requirements,
# note that there are many correct combinations available!

# First only grab available players from year 2001
avail.players <- filter(combo, yearID==2001)

# Then I made a quick plot to see where I should cut-off for salary in respect to OBP:
# Looks like there is no point in paying above 8 million or so (I'm just eyeballing this
# number). I'll choose that as a cutt off point. There are also a lot of players with
# OBP==0. Let's get rid of them too.
avail.players <- filter(avail.players,salary<8000000 & OBP>0)

# The total AB of the lost players is 1469. This is about 1500, meaning I should probably
# cut off my avail.players at 1500/3= 500 AB.
avail.players <- filter(avail.players, AB>=500)

# Now let's sort by OBP and see what we've got!
possible <- head(arrange(avail.players, desc(OBP)),10)

# Grab columns I'm interested in:
possible <- select(possible, playerID,OBP,AB,salary)
print(possible)
