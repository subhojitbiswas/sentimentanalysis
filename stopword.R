stopword<-function(x)
{
  require(qdap)
  res<-rm_stopwords(x)
  return (res)
}