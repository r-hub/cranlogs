context("test-cran_downloads")

test_that("cran_downloads works", {
  testthat::skip_on_cran()
  
  from <- as.Date("2019-02-23", format = "%Y-%m-%d")
  to <- as.Date("2019-04-24", format = "%Y-%m-%d")
  
  testthat::expect_is(cran_downloads("igraph", from = from, to = to),
            "data.frame")
  
  from <- "2019-02-23"
  to <- "2019-04-24"
  
  testthat::expect_is(cran_downloads("igraph", from = from, to = to),
            "data.frame")
  
  #### Test large number of CRAN packages ####
  packages <- rownames(utils::available.packages(
    contriburl = "https://cran.rstudio.com/src/contrib"))[seq_len(1000)]
  res <- cran_downloads(packages = packages, 
                        batch_size = 800)
  testthat::expect_true(all(packages %in% res$package))
  testthat::expect_is(res, "data.frame")
})
