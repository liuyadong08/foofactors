context("Reorder variables")

test_that("reorder2 reorders a variable in a dataframe", {
  library(dplyr)
  df <- data.frame("book" = LETTERS[1:4], "price" = c("25", "19", "80", "49"))
  x <- df$book
  y <- df$price
  z <- data.frame("book" = c("C", "D", "A", "B"), "price" = c("80", "49", "25", "19"))
  
  expect_identical(reorder2(df, x, y), z)
})
