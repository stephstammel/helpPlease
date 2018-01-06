#' defineMe
#'
#' @description Did you ever wonder what _atomic_ refers to in R?
#' What's a _closure_ and why is it not _subsettable_?
#' This function takes the word you're unsure about and searches for a plain
#' language explanation from our database. There may be links to further
#' reading. For example, say you are presented with the error: Error in
#' encourager[4, 5] : object of type 'closure' is not subsettable and you'd
#' like to know what on earth a closure is. Try defineMe("closure").
#'
#' @param item the text that the function will search for in the database
#' @import utils
#' @export
#'
#'
defineMe <- function(item){

  defineText <- {}
  defineDB <- NULL
  data(defineDB, envir = environment())
  db <- defineDB
  indices <- {}           ## TODO build a function and use map to get this more efficient
                          ## Alert: proof of concept quick-coding!

  for (i in 1:nrow(db)){
    if (length(grep(item, as.character(db[i,1]), ignore.case = TRUE)) == 1){
      indices <- append(indices, i)
    }
  }
  if (length(indices) < 1){
    defineText <-
      "We haven't found a match for you, we're sorry.
    It's hard to search for all possible words because there's so much in R!
    We haven't got a definition for this word yet - we're sorry!"
  }
  if (length(indices) > 0){
    defineText <- db[indices,2] # get the help text for this item
    defineText <- unique(defineText) # remove duplicates
    defineText <- unlist(defineText)

  }
  cat("Searched for information about:" ,item)
  cat ("\n")
  cat(as.character(defineText))

}
