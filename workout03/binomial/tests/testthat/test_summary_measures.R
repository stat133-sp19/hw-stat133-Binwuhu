context("test for summary measures")

test_that("aux_mean with valid output", {
  expect_equal(aux_mean(100,0.5),50)
  expect_equal(aux_mean(40,0.3),12)
  expect_type(aux_mean(40,0.3),"double")
})

test_that("aux_variance with the valid output", {
  expect_equal(aux_variance(100,0.5),25)
  expect_equal(aux_variance(40,0.3),8.4)
  expect_type(aux_variance(40,0.3),"double")
})

test_that("aux_mode with the valid output", {
  expect_equal(aux_mode(100,0.6),60)
  expect_equal(aux_mode(7,0.5),c(4,3))
  expect_type(aux_mode(100,0.6),"double")
})

test_that("aux_skewness with the valid output",{
  expect_lte(aux_skewness(10,0.6) + 0.1290994, 10e-06)
  expect_equal(aux_skewness(7,0.5),0)
  expect_type(aux_skewness(100,0.6),"double")
})

test_that("aux_kurtosis with the valid output",{
  expect_lte(aux_kurtosis(10,0.6) + 0.1833333, 10e-06)
  expect_equal(aux_kurtosis(8,0.5),-0.25)
  expect_type(aux_kurtosis(8,0.5),"double")
})
