#' troubleShooter
#'
#' @description A function that will generate some troubleshooting tips in response to a limited
#' number of query items. This will include resources like StackOverflow questions,
#' websites, links to helpful blog posts or RStudio community posts etc.
#'
#' @param item the text the function will search for.
#'
#'
#' @export
#' @import stats
#' @import utils
#'
#'
#' @examples troubleShooter()
#'
troubleShooter <- function(item){

  troubleshooterText <- {}
  troubleShootDB <- NULL
  data(troubleShootDB, envir = environment())
  db <- troubleShootDB
  n <- nrow(db)
  shot <- runif(1, min=1, max=n+1)
  troubleShooterText <- paste(db[shot,2],
                            " --- ",
                            db[shot,1],
                            sep = "")

  print(as.character(troubleShooterText))

}
