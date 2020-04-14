myplot <- function(data,row=1:10){
  my.data <- data[row, ,drop=F]
  
  matplot(t(my.data), type='b', pch=15:18, col=c(1:4,6))
  legend('bottomleft', inset = 0.01, legend = Players[row], col=c(1:4,6), pch=15:18, horiz = F)
}

#Salary
myplot(Salary)
myplot(Salary / Games)
myplot(Salary / FieldGoals)

#In-game Metrics
myplot(MinutesPlayed)
myplot(Points)

#In-game Metrics Normalized
myplot(FieldGoals / Games)
myplot(FieldGoals / FieldGoalAttempts)
myplot(FieldGoalAttempts / Games)
myplot(Points / Games)

#Interesting Observation
myplot(MinutesPlayed/Games)
myplot(Games)

#Time is valuable
myplot(FieldGoals/MinutesPlayed)

#Player Style
myplot(Points/FieldGoals)