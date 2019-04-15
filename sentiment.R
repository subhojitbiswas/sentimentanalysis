senti<-function(rt)
{
  require("rtweet")
  res<-data.frame(negative = 0,positive = 0, sentiment = "unknown", text = "random")
  c=1
  for ( i in rt$text)
  {
    print(paste("completed ",(c*100/nrow(rt)),"% "))
    #print (i)
    c=c+1
    res <- rbind(res, sentana(i))
  }
  return (res)
}