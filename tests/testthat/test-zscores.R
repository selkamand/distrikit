test_that("Robust Z-Score calculation works correctly", {
  data <- c(1, 2, 3, 4, 5)
  expected_output <- c(-1.34898151895319, -0.674490759476595, 0, 0.674490759476595, 1.34898151895319)
  computed_output <- compute_zscore_robust(data)
  expect_equal(computed_output, expected_output, tolerance = 1e-6)
})

test_that("Robust Z-Score calculation handles NA values correctly", {
  data <- c(1, 2, NA, 4, 5)
  expected_output <- c(-0.89932101263546, -0.44966050631773, NA, 0.44966050631773, 0.89932101263546)
  computed_output <- compute_zscore_robust(data)
  expect_equal(computed_output, expected_output, tolerance = 1e-6)
})

test_that("Robust Z-Score calculation with different constant values", {
  data <- c(1, 2, 3, 4, 5)
  constant <- 1.0
  expected_output <- c(-2, -1, 0, 1, 2)
  computed_output <- compute_zscore_robust(data, constant = constant)
  expect_equal(computed_output, expected_output, tolerance = 1e-6)
})


test_that("Robust Z-Score calculation when MAD = 0", {
  data <- c(0, 1, 1, 1, 5) # MAD = 0
  expected_output <- c(-Inf, 0, 0, 0, Inf)
  computed_output <- compute_zscore_robust(data)
  expect_equal(computed_output, expected_output, tolerance = 1e-6)
})
