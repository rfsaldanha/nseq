#' Run Length Encoding and return result as a data frame
#'
#' Given a tibble object and a variable \code{y}, this function will count the number of occurrence of each element in \code{y} in the sequence that they appear, and return this count as a tibble object.
#'
#' @param x a vector.
#'
#' @return a \code{data.frame} object.
#'
#' @seealso [rle()]
#'
#' @export
#'
#' @examples
#' trle(c(8,15,20,0,0,0,0,5,9,12))
trle <- function(x){
  # Check assertions
  checkmate::assert_vector(x = x)

  # Run length encoding
  res <- rle(x)

  # Tibble result
  data.frame(
    value = res$values,
    length = res$lengths
  )
}

