# Dates
#
# %d Day of the month (decimal number)
# %m Month (decimal number)
# %b Month (abbreviated)
# %B Month (full name)
# %y Year (2 digit)
# %Y Year (4 digit)

# Get system date
my.date <- Sys.Date()
print(my.date)

# convert string as date
my.date <- as.Date('Nov-03-20', format = '%b-%d-%y')
print(my.date)

my.date <- as.Date('June,24,2020', format = '%B,%d,%Y')
print(my.date)

# Generate timestamp
print(strptime('Nov-30-20 11:02:03', format = '%b-%d-%y %H:%M:%S'))
