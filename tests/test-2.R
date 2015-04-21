context("matrix 4x4")

m <- matrix(c(22, 6, 36, 31, 27, 40, 46, 43, 45, 50, 2, 3, 14, 21, 4, 35), nrow = 4, ncol = 4)
m2 <- matrix(c(26, 15, 29, 19, 28, 38, 10, 4, 34, 30, 27, 17, 22, 1, 21, 46), nrow = 4, ncol = 4)

mInv <- solve(m)
m2Inv <- solve(m2)

mCache <- makeCacheMatrix(m)

test_that("m$get() returns original matrix",{
  expect_equal(mCache$get(), m)
})

test_that("cacheSolve() returns inverse",{
  expect_identical(cacheSolve(mCache), mInv)
})

test_that("m$getinverse() returns inverse",{
  expect_identical(mCache$getinverse(), mInv)
})

test_that("cacheSolve() returns inverse from cache", {
  # how?
  expect_equal(cacheSolve(mCache), mInv)
  expect_message(cacheSolve(mCache), "loading cached data")
})

test_that("updating matrix",{
  mCache$set(m2)
  expect_equal(mCache$get(), m2)
  expect_equal(cacheSolve(mCache), m2Inv)
  expect_equal(mCache$getinverse(), m2Inv)
})
