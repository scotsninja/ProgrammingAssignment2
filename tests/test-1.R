context("matrix 2x2")

m <- matrix(1:4, nrow = 2, ncol = 2)
m2 <- matrix(c(0, 5, 9, 66), nrow = 2, ncol = 2)

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
