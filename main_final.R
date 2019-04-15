#library(tidyverse)
library(tidytext)
library(glue)
library(stringr)
require(rtweet)
require(httr)  
library(plyr)  
library(stringr)

setwd("E:/DC Sharing/personal backup/study materialz/kgp study/3rd sem project/latest sentiment analysis/sentiment analysis final")

set_config(use_proxy(url="172.16.2.30",port=8080))

token <- create_token(
  app = "rtweet_token",
  consumer_key = "ZJhNoovP5HnO62GG5nYkwo11m",
  consumer_secret = "0U1S8b3ED11H9T3IjLuB2p9BEUlB7iaww71tP3nV5EjsxshYPt")
get_token()

rt <- rtweet::search_tweets(q = "donaldtrump")
nrow(rt)
res <- senti(rt)
print(res)
res%>%count(3)
write.csv(res,file = "abcd.csv")

print(rt)
head(rt$text)
sentana("@ericgarland Always remember this endless 2016 campaign quote: \n\n "I love WIKILEAKS!" \n#Assange  #DonaldTrump")
sentana("Thankkkk u very much")
rafe_sent<-get_sentiments("bing")

