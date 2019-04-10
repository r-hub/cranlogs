context("test-check_date")

test_that("check_date throws an error if the date is poorly formatted", {
  expect_error(check_date("lala"), "formatted")
  expect_error(check_date("2016-31-12"), "formatted")
  expect_error(cran_downloads(from = "2019-01-01", to = "2019-31-12"), 
               "formatted")
  expect_error(cran_downloads(from = "2019-99-01", to = "2019-01-12"), 
               "formatted")
})
