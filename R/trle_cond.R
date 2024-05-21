#' Count the number of events in a sequence
#'
#' This function will count the occurrence of sequential events that meets some conditions.
#'
#' Example: In a vector, how many sequences have at least 3 consecutive observations (\code{a_op = "gte", a = 3}) with values equal or greater than 5 (\code{b_op = "gte", b = 5})?
#'
#' @param x numeric vector.
#' @param a_op,b_op character. Operator, \code{gte} = greater than or equal, \code{lte} = less than or equal, \code{gt} = greater than, \code{lt} = less than, \code{e} = equal.
#' @param a integer. Length of period threshold.
#' @param b integer. Value threshold.
#' @param isolated logical. Consider only isolated events, i.e. surrounded by zeros. On this case, \code{a} and \code{a_op} are not considered.
#'
#' @return a numeric value.
#' @export
#'
#' @examples
#' # How many sequences have at least 3 consecutive observations with value equal or greater than 5?
#' trle_cond(x = c(8,15,20,0,0,0,0,5,9,12), a_op = "gte", a = 3, b_op = "gte", b = 5)
#'
trle_cond <- function(x, a_op = "gte", a, b_op = "gte", b, isolated = FALSE){
  # Check assertions
  checkmate::assert_numeric(x = x)
  checkmate::assert_choice(x = a_op, choices = c("gte", "lte", "gt", "lt", "e"))
  checkmate::assert_choice(x = b_op, choices = c("gte", "lte", "gt", "lt", "e"))
  checkmate::assert_count(x = a)
  checkmate::assert_numeric(x = b)

  # Vector to tibble
  res <- data.frame(y = x)

  # Create a logical variable, operating y and b
  if(b_op == "gte"){
    res$value_ref <- ifelse(res$y >= b, TRUE, FALSE)
  } else if(b_op == "lte"){
    res$value_ref <- ifelse(res$y <= b, TRUE, FALSE)
  } else if(b_op == "gt"){
    res$value_ref <- ifelse(res$y > b, TRUE, FALSE)
  } else if(b_op == "lt"){
    res$value_ref <- ifelse(res$y < b, TRUE, FALSE)
  } else if(b_op == "e"){
    res$value_ref <- ifelse(res$y == b, TRUE, FALSE)
  }

  # For isolated true, consider if previous and ahead values are equal to zero
  if(isolated == TRUE){
    res$lag <- shift(res$y, n = 1, default = 0)
    res$lead <- shift(res$y, n = -1, default = 0)
    res$value_ref_2 <- ifelse(res$lag == 0 & res$lead == 0, TRUE, FALSE)
    res$value_ref <- as.logical(res$value_ref * res$value_ref_2)
  }

  # Tidy length encoding
  res1 <- trle(res$value_ref)

  # For isolated false, filter positive results, and operate length and a value
  if(isolated == FALSE){
    if(a_op == "gte"){
      res2 <- subset(res1, res1$value == TRUE & res1$length >= a)
    } else if(a_op == "lte"){
      res2 <- subset(res1, res1$value == TRUE & res1$length <= a)
    } else if(a_op == "gt"){
      res2 <- subset(res1, res1$value == TRUE & res1$length > a)
    } else if(a_op == "lt"){
      res2 <- subset(res1, res1$value == TRUE & res1$length < a)
    } else if(a_op == "e"){
      res2 <- subset(res1, res1$value == TRUE & res1$length == a)
    }
  } else if(isolated == TRUE){
    # For isolated true, consider only positive results with length of one
    if(a != 1L){
      stop("Argument `a` must be equal to 1.")
    }

    if(a_op != "e"){
      stop("Argument `a_op` must be equal to `e`.")
    }

    res2 <- subset(res1, res1$value == TRUE & res1$length == a)
  }

  # Returns the number of rows that meets the specified criteria
  nrow(res2)
}
