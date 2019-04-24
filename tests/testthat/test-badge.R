context("test-badge")

test_that("cranlogs_badge works", {
  expect_equal(cranlogs_badge("praise"),
               "[![CRAN RStudio mirror downloads](https://cranlogs.r-pkg.org/badges/last-month/praise?color=blue)](https://r-pkg.org/pkg/praise)")
  expect_equal(cranlogs_badge("praise", summary = "last-week", color = "orange")
, "[![CRAN RStudio mirror downloads](https://cranlogs.r-pkg.org/badges/last-week/praise?color=orange)](https://r-pkg.org/pkg/praise)")
})

test_that("parameter checks", {
  expect_error(cranlogs_badge(), "no default")
  expect_error(cranlogs_badge("praise", summary = "all"),
               'should be one')
})
