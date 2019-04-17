context("test-badge")

test_that("cranlogs_badge works", {
  expect_equal(cranlogs_badge("praise"),
               "[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/last-month/praise?color=blue)](http://cranlogs.r-pkg.org/badges/last-month/praise?color=blue)")
  expect_equal(cranlogs_badge("praise", summary = "last-week", color = "orange")
, "[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/last-week/praise?color=orange)](http://cranlogs.r-pkg.org/badges/last-week/praise?color=orange)")
})

test_that("parameter checks", {
  expect_error(cranlogs_badge(), "no default")
  expect_error(cranlogs_badge("praise", summary = "all"),
               'cranlogs_badge(summary = "all")')
})
