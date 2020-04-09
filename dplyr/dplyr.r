# Dplyr
# install.packages('dplyr')
# install.packages('nycflights13')
library(dplyr)
library(nycflights13)

# filter() (and slice())
head(filter(flights,month==11,day==3,carrier=='AA')) # Filter data based on given condition from data frame flights
slice(flights, 1:10) # Select 1st 10 rows from flights data frame

# arrange()
head(arrange(flights,year,month,day,arr_time)) # Order the data by yer,month,day and arr_time in ascending order
head(arrange(flights,year,month,day,desc(arr_time))) # Order the data by yer,month,day in ascending order and arr_time in descending order

# select() (and rename())
head(select(flights,carrier)) # select carrier column from flights data frame
head(select(flights,carrier,arr_time)) # select carrier, arr_time columns from flights data frame
head(rename(flights,airline_carrier = carrier)) # renames carrier column to airline_carrier in flights data frame

# distinct()
distinct(select(flights,carrier)) # select distinct carrier from flight data frame

# mutate() (and transmute())
head(mutate(flights,new_col = arr_time - dep_time)) # add a new column based on calculation of existing columns
head(transmute(flights,new_col = arr_time - dep_time)) # add a new column based on calculation of existing columns
# Difference between mutate and transmute is: mutate add new column based on formula given and returns entire data frame
# while as transmute add new column based on formula given and return only added column from data frame.

# summarise()
summarise(flights,avg_air_time = mean(air_time, na.rm = TRUE)) # calculate average air time using mean() function.
summarise(flights,tot_air_time = sum(air_time, na.rm = TRUE)) # calculate total air time using sum() function.

# sample_n() (and sample_frac())
sample_n(flights,10) # select 10 random rows from flights data frame
sample_frac(flights,0.3) # select 0.1 fraction of rows

# working with pipe (%>%) operator
df <- mtcars
# Ex 1: Select 5 random rows from df whose mpg>20 and display them in descending order of mpg.

# perform above example with nesting
result <- arrange(sample_n(filter(df, mpg>20), size = 5), desc(mpg)) # :O much complex
print(result)

# simplify above expression into series of codes
a <- filter(df, mpg>20) # filter data from df whose mpg>20 and store them into a
b <- sample_n(a, size = 5) # select 5 random rows from a
result <- arrange(b, desc(mpg)) # arrange rows in mpg wise descending order.s
# too much temporaryy variable created :/ in memory.

# Let's use pipe operator then
# syntax: Data %>% op1 %>% op2 .....
result <- df %>% filte(mpg>20) %>% sample_n(size = 5) %>% arrange(desc(mpg))
print(result) # :O Woowwwww
