context("test for checkers")

test_that("check_prob with valid or invalid value of probability", {
  expect_error(check_prob(-1))
  expect_error(check_prob('character'))
  expect_true(check_prob(0))
})

test_that("check_trials with valid or invalid value of trials", {
  expect_error(check_trials(-1))
  expect_error(check_trials('character'))
  expect_true(check_trials(3))
})

test_that("check_trials with valid or invalid value of successes", {
  expect_error(check_success(-1,3))
  expect_error(check_success('character',3))
  expect_true(check_success(3,3))
})