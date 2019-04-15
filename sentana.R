sentana <- function(or_fileText)
{
  require(tidytext)
  require(tidyr)
  require(dplyr)
  fileText <- clean(or_fileText)
  tokens<-spell(fileText)
  tokens<-as.data.frame(tokens,col.names = "word")
  temp_df <- tokens %>% inner_join(get_sentiments("bing")) 
  tot_neg <- nrow(temp_df %>% filter(sentiment=="negative"))
  tot_pos <- nrow(temp_df %>% filter(sentiment=="positive"))
  if (tot_pos-tot_neg < 0) tot_sen = "Negative"
  if (tot_pos-tot_neg > 0) tot_sen = "Positive"
  if (tot_neg==tot_pos) tot_sen = "Neutral"
  res <- data.frame(negative = tot_neg,positive = tot_pos, sentiment = tot_sen, text = fileText)
  return (res)
}