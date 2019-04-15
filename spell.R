spell<-function(x) # this function will take a sentence and check its spelling and return tokenize
{
  require(qdap)
  require(hunspell)
  x<-tolower(x)
  tokens <- stopword(x)
  q<-qdap::which_misspelled(x)
  if (!is.null(q))
  {
    q<-lapply(split(q,names(q)),unname)
    tokens<-setdiff(unlist(tokens),unlist(q))
    q<-lapply(q,sugfun)
    tokens<-union(tokens,q)
  }
  return (tokens)
}

