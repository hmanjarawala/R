setwd("C:\\Users\\himanshu.manjarawala\\Documents\\R Programming\\R\\Files")
movies <- read.csv(file = "Section6-Homework-Data.csv")
colnames(movies) <- c("DayofWeek","Director","Genre","MovieTitle","ReleaseDate","Studio",
                      "AdjustedGrossMillion","BudgetMillion","GrossMillion","IMDBRating",
                      "MovieLensRating","OverseasMillion","Overseas","ProfitMillion","Profit",
                      "RuntimeMinute","USMillion","GrossUS")
selected.genre <- c('action', 'animation','comedy','drama','adventure')
selected.studios <- c('Buena Vista Studios','Fox','Paramount Pictures','Sony','Universal','WB')

movies <- movies[movies$Studio %in% selected.studios & movies$Genre %in% selected.genre,]

rm(selected.studios,selected.genre)

library(ggplot2)


pl <- ggplot(data=movies,aes(x=Genre,y=GrossUS))

#Place boxplot on top of jitter
pl <- pl + geom_jitter(aes(color=Studio,size=BudgetMillion)) + 
  geom_boxplot(alpha=0.7, outlier.colour = NA)

# Axis lable
pl <- pl + xlab("Genre") + ylab("Gross % US")

# Title
pl <- pl + ggtitle("Domestic Gross % by Genre")

# Formatting
pl <- pl + theme(
           #this is a shortcut to alter ALL text elements at once:
           text = element_text(family="Comic Sans MS"),
           
           
           #Axes titles:
           axis.title.x = element_text(color='blue',size=30),
           axis.title.y = element_text(color='blue',size=30),
           
           #Axes texts:
           axis.text.x = element_text(size=20),
           axis.text.y = element_text(size=20),
           
           # Legend title
           legend.title = element_text(size=20),
           
           #Legend text
           legend.text = element_text(size=12),
           
           #Plot title:
           plot.title = element_text(colour="Black", size=40)
           )
pl
