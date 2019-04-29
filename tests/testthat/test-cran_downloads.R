context("test-cran_downloads")

test_that("cran_downloads works", {
  skip_on_cran()
  
  from <- as.Date("2019-02-23", format = "%Y-%m-%d")
  to <- as.Date("2019-04-24", format = "%Y-%m-%d")
  
  expect_is(cran_downloads("igraph", from = from, to = to),
            "data.frame")
  
  from <- "2019-02-23"
  to <- "2019-04-24"
  
  expect_is(cran_downloads("igraph", from = from, to = to),
            "data.frame")
})
