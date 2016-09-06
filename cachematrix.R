## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
## creates a special matrix that can cache the inverse

  xinv <- NULL
  set <- function(y) {
    ## saved to global environment; original data & inverse
    x <<- y
    xinv <<- NULL
  }

  get <- function() x

  setInverse <- function(inverse) xinv <<- inverse

  getInverse <- function() xinv

  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  ## if the inverse was already calculated; use the cache
  ## Return a matrix that is the inverse of 'x'
  inverse <- x$getInverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  z <- x$get()
  inverse <- solve(z, ...)
  x$setInverse(inverse)
  message("getting uncached data")
  inverse

}
