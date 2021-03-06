test_that("as.Distribution errors when expected", {
  pdf <- runif(200)
  mat <- matrix(pdf, 20, 10)
  mat <- t(apply(mat, 1, function(x) x / sum(x)))

  expect_error(as.Distribution(mat), "'obj' must have")
  colnames(mat) <- 1:10
  expect_error(as.Distribution(mat, "surv"), "'fun' should be one of")
})

test_that("as.Distribution works with pdf expected", {
  pdf <- runif(200)
  mat <- matrix(pdf, 20, 10)
  mat <- t(apply(mat, 1, function(x) x / sum(x)))
  colnames(mat) <- 1:10

  wd <- as.Distribution(mat, fun = "pdf")

  expect_is(wd, "VectorDistribution")
  expect_equal(unique(wd$modelTable$Distribution), "WeightedDiscrete")

  expect_equal(
    vapply(wd$getParameterValue("x"), identity, numeric(10)),
    matrix(1:10, 10, 20, FALSE, list(NULL, paste0("WeightDisc", 1:20)))
  )

  expect_equal(
    vapply(wd$getParameterValue("pdf"), identity, numeric(10)),
    matrix(t(mat), 10, 20, FALSE, list(1:10, paste0("WeightDisc", 1:20)))
  )
})

test_that("as.Distribution works with pdf expected", {
  pdf <- runif(200)
  mat <- matrix(pdf, 20, 10)
  mat <- t(apply(mat, 1, function(x) x / sum(x)))
  colnames(mat) <- 1:10

  mat <- t(apply(mat, 1, function(x) cumsum(x)))

  wd <- as.Distribution(mat, fun = "cdf")

  expect_is(wd, "VectorDistribution")
  expect_equal(unique(wd$modelTable$Distribution), "WeightedDiscrete")

  expect_equal(
    vapply(wd$getParameterValue("x"), identity, numeric(10)),
    matrix(1:10, 10, 20, FALSE, list(NULL, paste0("WeightDisc", 1:20)))
  )

  expect_equal(
    vapply(wd$getParameterValue("cdf"), identity, numeric(10)),
    matrix(t(mat), 10, 20, FALSE, list(1:10, paste0("WeightDisc", 1:20)))
  )
})
