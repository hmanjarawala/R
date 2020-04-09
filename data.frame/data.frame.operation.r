# How to show defined data frames?
# use built-in function data().
# name few defined data frames.
# USPersonalExpenditure, state.x77, mtcars, women etc
# Show structure of state.x77 data frame
print(str(state.x77))
# Show summary of state.x77 data frame
print(summary(state.x77))
# Show head & tails of data frame
print(head(mtcars))
print(tail(mtcars))
# Define Empty Data Frame
empty.dataframe <- data.frame()
print(empty.dataframe)
# Define data frame from vectors
days <- c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
temps <- c(28,26,29,30,32,25,34)
df <- data.frame(days,temps)
print(df)
# Display data of column 1 & 2 from 2nd & 3rd rows
print(df[2:3,c('days','temps')])
# Show data from data frame where temps>30
print(subset(df, subset = temps>30))
# Sort data frame temprature wise in ascending order
sort.ascending <- order(df['temps'])
print(sort.ascending)
print(df[sort.ascending,])
# Or
sort.ascending <- order(df$temps)
print(sort.ascending)
print(df[sort.ascending,])
# Or
print(df[order(df$temp),])
# Sort data frame temprature wise in descending order
sort.ascending <- order(-df['temps'])
print(sort.ascending)
print(df[sort.ascending,])
# Or
sort.ascending <- order(-df$temps)
print(sort.ascending)
print(df[sort.ascending,])
# Or
print(df[order(-df$temp),])
# Define data frame with customized column name
df <- data.frame(Weekdays = days, Temprature = temps)
print(df)
# Importing & exporting data from data frames
write.csv(df,file = "save_df.csv") # Export data from data frame to csv file.
df2 <- read.csv("save_df.csv") # Import data from csv file to data frame
print(df2)
# Getting information about data frames
print(ncol(df))
print(nrow(df))
print(colnames(df))
print(rownames(df))
print(str(df))
print(summary(df))
# Referencing cells
print(df[[1,2]]) # Print data from 2nd column of 1st row
print(df[[1,'Temprature']]) # same as above only referring column by name
df[[4,'Temprature']] <- 31 # Change temprature value in row#4
print(df)
# Referencing Rows
print(df[2,]) # Display data from 2nd Row
# Referencing Columns
print(df[,2]) # Display data from 2nd Column
print(df[,'Temprature']) # same as above only referring column by name
print(df$Temprature) # most sofisticated way
print(df[['Temprature']]) # least sofisticated way
print(df[2]) # same as njnjnjnabove only returning data frame instead of vector
print(df['Temprature']) # same as above only referring column by name
print(df[c('Weekdays','Temprature')]) # Display data from multiple columns
# Adding Row to existing data frame
c1 <- 1:10
c2 <- letters[1:10]
df.temp <- data.frame(column.1 = c1, column.2 = c2) # Generate temporary data frame to add new row
print(df.temp)
df.new <- data.frame(column.1 = 11, column.2 = 'k')
df.new <- rbind(df.temp,df.new)
print(df.new)
# Adding column to exising data frame
df.new$column.3 <- 2 * df.new$column.1
df.new['column.4'] <- df.new$column.3
print(df.new)
# Setting Column names
print(colnames(df))
colnames(df) <- c('days', 'temp') # change all comumn names in data frame
print(colnames(df))
colnames(df)[2] <- 'temps' # change perticular column name
print(colnames(df))
# Selecting multiple rows
print(df[1:5,]) # Select 1 to 5 rows from data frame
print(head(df,5)) # returns top 5 rows
print(tail(df,3)) # returns last 3 rows
print(df[-2,]) # returns all rows except 2nd row
print(df[-2:-4,]) # returns all rows except 2nd, 3rd and 4th
# Selecting multiple rows based on condition
print(mtcars[ mtcars$mpg > 20 ,]) # selecting all columns for data whose mpg > 20
print(mtcars[ (mtcars$mpg > 20) & (mtcars$cyl == 6) ,]) # selecting all columns for data whose mpg > 20 & cyl = 6
# Or
print(subset(mtcars, mpg > 20 & cyl == 6))
print(mtcars[ (mtcars$mpg > 20) & (mtcars$cyl == 6) , c('mpg','cyl','hp')]) # selecting perticular columns for data whose mpg > 20 & cyl = 6
# Selecting multiple columns
print(mtcars[,c(1,2,3)])
print(mtcars[,c('mpg','cyl','hp')])
# Dealing with missing data
is.na(mtcars) # display NA or TRUE If any data is missing in data frame mtcars
print(any(is.na(mtcars))) # display TRUE If data missing else FALSE
is.na(mtcars$mpg) # display NA or TRUE If any data is missing in mpg column of data frame mtcars
print(any(is.na(mtcars$mpg))) # display TRUE If data missing in mpg column else FALSE
mtcars[is.na(mtcars)] <- 0 # Set value 0 If any data missing in data frame mtcars
mtcars[is.na(mtcars$mpg)] <- 0 # Set value 0 If any data missing in mpg column