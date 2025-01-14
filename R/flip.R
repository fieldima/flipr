#Roxygen tags -----------------------------------------------------------------------
#' @title Flipping data frames.
#'
#' @description This function flips rows and columns in a data frame and optionally returns
#' the flipped data frame as a tibble or data table.
#'
#' @param df Short for data frame, the first argument should be a data frame of any type.
#' @param out Short for output, this argument determines the form of the resulting data.
#' Options include 'DF' for data frame, 'TB' for tibble, and 'DT' for data table.
#'
#' @details Function will return errors if first argument is not of type data frame. out is
#' an optional argument that determines if the output is a data frame, tibble, or data table.
#' Defaults to data frame if left empty.
#'
#' @return Either a data frame, data table, or tibble with columns and rows flipped.
#'
#' @examples
#' flip(mtcars)
#' flip(mtcars, "TB")
#' @export

flip <- function (df, out) {
  if(! is.data.frame(df)) stop("First argument needs to be a data frame.")
  if(missing(out)) {
    out = "DF"
  }
  if(! out %in% c("DF", "DT", "TB")) stop("Second argument needs to be empty or a string indicating type of output.")
  final <- data.frame(t(df))
  ifelse(out == "DT", final <- data.table::as.data.table(final),
         ifelse(out == "TB", final <- tibble::as_tibble(final), final <- final))
  final
}
