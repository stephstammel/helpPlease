#' helpError
#'
#' @description This function takes a key phrase from the error you don't understand
#' and looks for a plain language explanation from our database. It may also be
#' able to provide you with helpful links or tips.
#' For example, say you are presented with the error:
#' Error in library(abcd) : there is no package called ‘abcd’
#' Try using helpError("there is no package called").
#'
#' Currently search capability is pretty rudimentary. The function works best
#' searching for short strings of text that don't include the specific variables
#' that are unique to your workspace.
#'
#' @param item the text the function will search for in the database
#'

#' @export
#' @import utils
#'
#' @examples
#' helpError("there is no package called")
#'
#'
helpError <- function(item){

  helpText <- {}
  helpDB <- NULL
  data(helpDB, envir = environment())
  db <- helpDB
  indices <- {}           ## TODO build a function and use map to get this more efficient
                          ## Alert: proof of concept quick-coding!
  for (i in 1:nrow(db)){
     if (length(grep(item, as.character(db[i,1]), ignore.case = TRUE)) == 1){
       indices <- append(indices, i)
     }
  }

  if (length(indices) < 1){
    indices <- {}       ## TODO build a function and use map to get this more efficient
                        ## Alert: proof of concept quick-coding!
    for (i in 1:nrow(db)){
      if (length(grep(item, as.character(db[i,2]), ignore.case = TRUE)) == 1){
        indices <- append(indices, i)
      }
    }
    if (length(indices) < 1){
      helpText <-
"We haven't found a match for you, we're sorry.
It's hard to search for exact matches because R error messages are so variable. Here's some tips to get a good match:
1. Try and search for the minimum possible words. This isn't a situation where too many responses is the big problem!
2. Search for one or two consecutive words in your error message. For example, if your message is
Error in sheets_fun(path) :
zip file '../data/database.xlsx' cannot be opened
Then try searching for 'cannot be opened' to start with.

If you've tried these tips and still not having any luck - we're sorry!
Our database is not yet big enough or sophisticated enough for your error.
Congratulations! You're doing great if your error messages are sophisticated.. right?

Here are some tips for finding information outside the R environment:
1. Google your WHOLE error message. You may need to add 'in R' on the end.
This often turns up great tips.
2. Try searching on www.stackoverflow.com using the `R` tag. Usually, somebody made
this error before you did. We are a community of error makers in R!
3. Try the rStudio community: https://community.rstudio.com they're a helpful bunch.
4. Consider building a reproducible example - a reprex. Often this process solves your problem.
But if it doesn't, you will have a way of asking about your problem on StackOverflow or the RStudio community.
For more about reprexes, see here: https://cran.r-project.org/web/packages/reprex/README.html
And here: https://speakerdeck.com/jennybc/reprex-help-me-help-you
5. If all else fails, this has often provided great comfort to R users in despair: https://xkcd.com/979/"
    }
  }
  if (length(indices) > 0){
    helpText <- db[indices,3] # get the help text for this item
    helpText <- unique(helpText) # remove duplicates
    helpText <- unlist(helpText)

  }
  cat("Searched for information about:" ,item)
  cat ("\n")
  cat(as.character(helpText))

}
