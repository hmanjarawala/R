#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
# profit for each month
profit.month <- round(revenue - expenses, 2)
# Caclulate tax
tax <- round(0.30 * profit.month, 2)
# profit after tax for each month
profit.after.tax <- profit.month - tax
# Profit margin for each month
profit.margin.month <- round(profit.after.tax / revenue, 2) * 100
# calculate good months
good.months <- profit.after.tax>mean(profit.after.tax)
# Calculate bad months
bad.months <- !good.months
# Calculate best & worst month
best.month <- profit.after.tax == max(profit.after.tax)
worst.month <- profit.after.tax == min(profit.after.tax)

#Convert All Calculations To Units Of One Thousand Dollars
revenue.1000 <- round(revenue/1000, 0)
expenses.1000 <- round(expenses/1000, 0)
profit.1000 <- round(profit.month/1000, 0)
profit.after.tax.1000 <- round(profit.after.tax/1000, 0)

# Print rersults
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin.month
good.months
bad.months
best.month
worst.month

#BONUS:
#Preview Of What's Coming In The Next Section
M <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profit.margin.month,
  good.months,
  bad.months,
  best.month,
  worst.month
)

#Print The Matrix
M
