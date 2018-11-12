#' Reorder the levels of the first argument, which is a vairable in a dataframe based on 
#' the values of the second argument in decreasing order.
#' @param df dataframe
#' @param a variable
#' @param b variable
#' @return dataframe
#' @export
#' @examples 
#' reorder2(mtcars, mtcars$cyl, mtcars$hp) 
#' reorder2(mtcars, mtcars$cyl, mtcars$wt)
#' reorder2(iris, iris$Species, iris$Sepal.Length)

reorder2 <- function(df, a, b) {
  library(dplyr)
  arrange(df, desc(b), a)
}