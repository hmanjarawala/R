# install.packages('tm')
# install.packages('twitteR')
# install.packages('wordcloud')
# install.packages('RColorBrewer')
# install.packages('e1017')
# install.packages('class')
library(twitteR)
library(tm)
library(wordcloud)
library(RColorBrewer)

# CONNECT TO TWITTER
ckey <- 'axFdWMXpp6Oo4F8AGelXBXaOc'
skey <- '8x86P5itfrrBsJfDdN5f3AkZ9AcghopsOqQeOqynT1PqSaTTKY'
token <- '370521434-7iQbRTyu4C7jkh1vCcaFqPxeIE5wQrH1zRwWq0xi'
sectoken <- 'VI2ELzmqxQXBI9RSVHE5RBpp8S5KhzL9tgFOQJu29UTGF'

setup_twitter_oauth(ckey,skey,token,sectoken)

## Search on twitter
soccer.tweets <- searchTwitter('python', n=1000, lang = 'en')

## Get text of each tweet
soccer.text <- sapply(soccer.tweets, function(x) x$getText() )

## CLEAN TEXT DATA
soccer.text <- iconv(soccer.text, 'UTF-8', 'ASCII')
##
soccer.corpus <- Corpus(VectorSource(soccer.text))
##
# DOCUMENT TERM METRIX
##
term.doc.matrix <- TermDocumentMatrix(soccer.corpus,
                            control = list(removePunctuation=TRUE, stopwords=c('python',
                            'http',stopwords('english')), 
                            removeNumbers=TRUE,tolower=TRUE))
###
# Convert the object into Matrix
###
term.doc.matrix <- as.matrix(term.doc.matrix)

# Get Word count
word.freq <- sort(rowSums(term.doc.matrix), decreasing = TRUE)
df <- data.frame(word=names(word.freq), freq=word.freq)

# CREATE THE WORD CLOUD
wordcloud(df$word,df$freq,random.order = FALSE,colors = brewer.pal(8,'Dark2'))
