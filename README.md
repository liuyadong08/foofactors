<!-- README.md is generated from README.Rmd. Please edit that file -->
**NOTE: This is a toy package created for expository purposes. It is not meant to actually be useful. If you want a package for factor handling, please see [forcats](https://cran.r-project.org/package=forcats).**

### foofactors

Factors are a very useful type of variable in R, but they can also drive you nuts. This package provides some helper functions for the care and feeding of factors. This package also include a function that reorders the levels in a variable based on levels in decreasing order in another variable.

### Installation

``` r
devtools::install_github("liuyadong08/foofactors")
```

### Quick demo

Binding two factors via `fbind()`:

``` r
library(foofactors)
a <- factor(c("character", "hits", "your", "eyeballs"))
b <- factor(c("but", "integer", "where it", "counts"))
```

Simply catenating two factors leads to a result that most don't expect.

``` r
c(a, b)
#> [1] 1 3 4 2 1 3 4 2
```

The `fbind()` function glues two factors together and returns factor.

``` r
fbind(a, b)
#> [1] character hits      your      eyeballs  but       integer   where it 
#> [8] counts   
#> Levels: but character counts eyeballs hits integer where it your
```

Often we want a table of frequencies for the levels of a factor. The base `table()` function returns an object of class `table`, which can be inconvenient for downstream work. Processing with `as.data.frame()` can be helpful but it's a bit clunky.

``` r
set.seed(1234)
x <- factor(sample(letters[1:5], size = 100, replace = TRUE))
table(x)
#> x
#>  a  b  c  d  e 
#> 25 26 17 17 15
as.data.frame(table(x))
#>   x Freq
#> 1 a   25
#> 2 b   26
#> 3 c   17
#> 4 d   17
#> 5 e   15
```

The `freq_out()` function returns a frequency table as a well-named `tbl_df`:

``` r
freq_out(x)
#> # A tibble: 5 x 2
#>   x         n
#>   <fct> <int>
#> 1 a        25
#> 2 b        26
#> 3 c        17
#> 4 d        17
#> 5 e        15
```

The `reorder2()` funtion returns a dataframe, and one variable of the dataframe is reordered based on the levels in decreasing order in another variable.

``` r
new_mtcars <- reorder2(mtcars, mtcars$cyl, mtcars$wt)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
```

``` r
knitr::kable(new_mtcars)
```

|   mpg|  cyl|   disp|   hp|  drat|     wt|   qsec|   vs|   am|  gear|  carb|
|-----:|----:|------:|----:|-----:|------:|------:|----:|----:|-----:|-----:|
|  10.4|    8|  460.0|  215|  3.00|  5.424|  17.82|    0|    0|     3|     4|
|  14.7|    8|  440.0|  230|  3.23|  5.345|  17.42|    0|    0|     3|     4|
|  10.4|    8|  472.0|  205|  2.93|  5.250|  17.98|    0|    0|     3|     4|
|  16.4|    8|  275.8|  180|  3.07|  4.070|  17.40|    0|    0|     3|     3|
|  19.2|    8|  400.0|  175|  3.08|  3.845|  17.05|    0|    0|     3|     2|
|  13.3|    8|  350.0|  245|  3.73|  3.840|  15.41|    0|    0|     3|     4|
|  15.2|    8|  275.8|  180|  3.07|  3.780|  18.00|    0|    0|     3|     3|
|  17.3|    8|  275.8|  180|  3.07|  3.730|  17.60|    0|    0|     3|     3|
|  14.3|    8|  360.0|  245|  3.21|  3.570|  15.84|    0|    0|     3|     4|
|  15.0|    8|  301.0|  335|  3.54|  3.570|  14.60|    0|    1|     5|     8|
|  15.5|    8|  318.0|  150|  2.76|  3.520|  16.87|    0|    0|     3|     2|
|  18.1|    6|  225.0|  105|  2.76|  3.460|  20.22|    1|    0|     3|     1|
|  19.2|    6|  167.6|  123|  3.92|  3.440|  18.30|    1|    0|     4|     4|
|  17.8|    6|  167.6|  123|  3.92|  3.440|  18.90|    1|    0|     4|     4|
|  18.7|    8|  360.0|  175|  3.15|  3.440|  17.02|    0|    0|     3|     2|
|  15.2|    8|  304.0|  150|  3.15|  3.435|  17.30|    0|    0|     3|     2|
|  21.4|    6|  258.0|  110|  3.08|  3.215|  19.44|    1|    0|     3|     1|
|  24.4|    4|  146.7|   62|  3.69|  3.190|  20.00|    1|    0|     4|     2|
|  15.8|    8|  351.0|  264|  4.22|  3.170|  14.50|    0|    1|     5|     4|
|  22.8|    4|  140.8|   95|  3.92|  3.150|  22.90|    1|    0|     4|     2|
|  21.0|    6|  160.0|  110|  3.90|  2.875|  17.02|    0|    1|     4|     4|
|  21.4|    4|  121.0|  109|  4.11|  2.780|  18.60|    1|    1|     4|     2|
|  19.7|    6|  145.0|  175|  3.62|  2.770|  15.50|    0|    1|     5|     6|
|  21.0|    6|  160.0|  110|  3.90|  2.620|  16.46|    0|    1|     4|     4|
|  21.5|    4|  120.1|   97|  3.70|  2.465|  20.01|    1|    0|     3|     1|
|  22.8|    4|  108.0|   93|  3.85|  2.320|  18.61|    1|    1|     4|     1|
|  32.4|    4|   78.7|   66|  4.08|  2.200|  19.47|    1|    1|     4|     1|
|  26.0|    4|  120.3|   91|  4.43|  2.140|  16.70|    0|    1|     5|     2|
|  27.3|    4|   79.0|   66|  4.08|  1.935|  18.90|    1|    1|     4|     1|
|  33.9|    4|   71.1|   65|  4.22|  1.835|  19.90|    1|    1|     4|     1|
|  30.4|    4|   75.7|   52|  4.93|  1.615|  18.52|    1|    1|     4|     2|
|  30.4|    4|   95.1|  113|  3.77|  1.513|  16.90|    1|    1|     5|     2|
