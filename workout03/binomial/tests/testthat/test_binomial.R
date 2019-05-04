context("test for binomial")

test_that("bin_choose with valid output", {
  expect_equal(bin_choose(5,2),10)
  expect_error(bin_choose(5,1.5))
  expect_error(bin_choose(2,5))
})


test_that("bin_probability with valid output", {
  expect_equal(bin_probability(2,5,0.5),0.3125)
  expect_error(bin_probability(5,2,0.5))
  expect_error(bin_probability(2,5,-0.1))
})

test_that("bin_distribution with valid output", {
  expect_error(bin_distribution(5,-0.5))
  expect_error(bin_distribution(5,1.5))
  expect_is(bin_distribution(5,0.5),c("bindis","data.frame"))
})

test_that("bin_cumulative with valid output", {
  expect_error(bin_cumulative(5,-0.5))
  expect_error(bin_cumulative(5,1.5))
  expect_is(bin_cumulative(5,0.5),c("bincum","data.frame"))
})