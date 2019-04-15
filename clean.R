clean <- function(sentence)
{
  require(plyr)  
  require(stringr)
  #for removing hash tags
  sentence = gsub("((@|#)[a-zA-Z0-9_-]+)", "", sentence)
  #for removing $
  sentence = gsub("\\$", "", sentence) 
  #for keeping only english and removing others.
  sentence = iconv(sentence, "latin1", "ASCII", sub="")
  #for removing urls
  sentence = gsub("(f|ht)tp(s?)://(.*)[.][a-z]+/[0-9,a-z,A-Z]+", "", sentence)
  #for removing punctuation
  sentence = gsub('[[:punct:]]', "", sentence)  
  #for removing digits or numbers
  sentence = gsub("[[:digit:]]", "", sentence)
  #for removing double spaces
  sentence = gsub("^\\s+|\\s+$", "", sentence)
  #for converting to lowercase
  try.error = function(x)
  {
    y = NA
    try_error = tryCatch(tolower(x), error=function(e) e)
    
    # if not an error
    if (!inherits(try_error, "error"))
      y = tolower(x)
    
    return(y)
  }
  try.error(sentence)
  #print(sentence)
  return(sentence)
}
