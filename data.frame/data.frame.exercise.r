# 1: Recreate the following dataframe by creating vectors and using the data.frame function:
c1 <- c(22,25,26)
c2 <- c(150,165,120)
c3 <- c('M','M','F')
df <- data.frame(c1,c2,c3)
colnames(df) <- c('Age', 'Weight', 'Sex')
rownames(df) <- c('Sam', 'Frank', 'Amy')
# OR
Name <- c("Sam","Frank","Amy")
Age <- c(22,25,26)
Weight <- c(150,165,120)
Sex <- c("M", "M", "F")
df <- data.frame (row.names = Name, Age, Weight, Sex)
df
print(df)

# 2: Check if mtcars is a dataframe using is.data.frame()
print(is.data.frame(mtcars))

# 3: Use as.data.frame() to convert a matrix into a dataframe:
mat <- matrix(1:25, nrow = 5)
df <- as.data.frame(mat)
print(df)

# 4: Set the built-in data frame mtcars as a variable df. We'll use this df variable for the rest of the exercises.
df <- mtcars

# 5: Display the first 6 rows of df
print(head(df,6))

# 6: What is the average mpg value for all the cars? 
print(mean(df$mpg))

# 7: Select the rows where all cars have 6 cylinders (cyl column) 
print(df[ df$cyl == 6, ])

# 8: Select the columns am,gear, and carb. 
print(df[,c('am','gear','carb')])

# 9: Create a new column called performance, which is calculated by hp/wt. 
df$performance <- df$hp/df$wt
print(head(df))

# 10: Your performance column will have several decimal place precision. Figure out how to use round() (check help(round))
# to reduce this accuracy to only 2 decimal places.
df$performance <- round(df$performance, 2)
print(head(df))

# 11: What is the average mpg for cars that have more than 100 hp AND a wt value of more than 2.5.
print(mean(df[ (df$hp > 100) & (df$wt > 2.5) , 'mpg']))
# OR
print(mean(subset(df, hp > 100 & wt > 2.5)$mpg))

# 11: What is the mpg of the Hornet Sportabout? 
print(df['Hornet Sportabout','mpg'])
# OR
print(df['Hornet Sportabout',]$mpg)