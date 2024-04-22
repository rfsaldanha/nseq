#' Statistics of events in a sequence
#'
#' This function will compute statistics of sequential events that meets some conditions.
#'
#' Example: in a vector, what is the maximum size of sequences with values equal or greater than 5?
#'
#' @param x numeric vector.
#' @param b integer. Value threshold.
#' @param b_op character. Operator, \code{gte} = greater than or equal, \code{lte} = less than or equal, \code{gt} = greater than, \code{lt} = less than, \code{e} = equal.
#' @param stat character. A statistic to be calculated. One of: max, min, mean, median, sd, var.
#'
#' @return a numeric value
#' @export
#'
#' @examples
#' # What is the maximum size of sequences with values equal or greater than 5?
#' trle_cond_stat(c(4,6,6,4,7,8,9), b = 5, b_op = "gte", stat = "max")
#'
trle_cond_stat <- function(x, b, b_op, stat){
  # Check assertions
  checkmate::assert_numeric(x = x)
  checkmate::assert_numeric(x = b)
  checkmate::assert_choice(x = b_op, choices = c("gte", "lte", "gt", "lt", "e"))
  checkmate::assert_choice(x = stat, choices = c("max", "min", "mean", "median", "sd", "var"))

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

  # Compute tibble run length encoding considering the reference value,
  # filter positive values, pull lengths and compute statistics
  res <- trle(res$value_ref)
  res <- subset(res, res$value == TRUE)

  # Pull lengths vector
  if(nrow(res >= 1)){
    res2 <- res$length

    # Calculate statistics
    if(stat == "max"){
      res3 <- max(res2, na.rm = TRUE)
    } else if(stat == "min"){
      res3 <- min(res2, na.rm = TRUE)
    } else if(stat == "mean"){
      res3 <- mean(res2, na.rm = TRUE)
    } else if(stat == "median"){
      res3 <- stats::median(res2, na.rm = TRUE)
    } else if(stat == "sd"){
      res3 <- stats::sd(res2, na.rm = TRUE)
    } else if(stat == "var"){
      res3 <- stats::var(res2, na.rm = TRUE)
    }

  } else {
    res3 <- NA
  }

  # Return result
  return(res3)
}
