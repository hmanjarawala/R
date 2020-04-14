# Visualization and MATPLOT()
head(FieldGoals)
# get transpose of matrix FieldGoals
t(FieldGoals)
matplot(t(FieldGoals), type='b', pch=15:18, col=c(1:4,6))
legend('bottomleft', inset = 0.01, legend = Players, col=c(1:4,6), pch=15:18, horiz = F)

matplot(t(FieldGoals/Games), type='b', pch=15:18, col=c(1:4,6))
legend('bottomleft', inset = 0.01, legend = Players, col=c(1:4,6), pch=15:18, horiz = F)

matplot(t(FieldGoals/FieldGoalAttempts), type='b', pch=15:18, col=c(1:4,6))
legend('bottomleft', inset = 0.01, legend = Players, col=c(1:4,6), pch=15:18, horiz = F)

# Visualizing Subset
data <- MinutesPlayed[1:3,]

matplot(t(data), type='b', pch=15:18, col=c(1:4,6))
legend('bottomleft', inset = 0.01, legend = Players[1:3], col=c(1:4,6), pch=15:18, horiz = F)
data

# When we select Single row from Matrix, it will retur Vector instead of Matrix.
# Hence, we've to set drop option to FALSE
data <- MinutesPlayed[1, ,drop=F]

matplot(t(data), type='b', pch=15:18, col=c(1:4,6))
legend('bottomleft', inset = 0.01, legend = Players[1], col=c(1:4,6), pch=15:18, horiz = F)
data
