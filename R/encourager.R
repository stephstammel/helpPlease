#' encourager
#'
#' @description Inspired by the praise function.
#' A randomly generated assortment of encouragement from the Rstats community
#' that demonstrates that failure isn't just common when coding - it's essential.
#' A selection of helpful hints and tips from the Rstats community about their own
#' pitfalls and difficulties.
#'
#' Learning R isn't easy, we promise we've all been there.
#'
#' @export
#' @import stats
#' @import utils
#'
#' @examples encourager()
#'
encourager <- function(){

  encourageText <- {}
  encourageDB <- NULL
  data(encourageDB, envir = environment())
  db <- encourageDB
  n <- nrow(db)
  encouragement <- runif(1, min=1, max=n+1)
  encouragementText <- paste(db[encouragement,2], db[encouragement,1],
                        sep = "   ---   ")

  print(as.character(encouragementText))

}
