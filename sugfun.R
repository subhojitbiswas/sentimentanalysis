sugfun <- function(x)
{
  require(qdap)
  return(qdap::check_spelling(x,n.suggests = 1)$suggestion)
}