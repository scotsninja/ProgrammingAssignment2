## Calculate and store the inverse of a matrix so that it may be accessed quickly
## without requiring re-calculation

## Object for storing a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  
  # set the base matrix
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  
  # return the base matrix
  get <- function() x
  
  # store the inverted matrix
  setinverse <- function(solve) m <<- solve
  
  # return the inverted matrix
  getinverse <- function() m
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Compute matrix inverse using solve(),
## loading from cached value if one exists

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  
  if(!is.null(m)){
    message("loading cached data")
    return(m)
  }
  
  # calculate inverted matrix, then store
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  
  m
}
