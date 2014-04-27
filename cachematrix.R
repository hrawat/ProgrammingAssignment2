## This file contains functions that can be used to create a wrapper objects around matrix 
## to cache the results of matrix inverse calculation. Typical usage scenario would be 
## m <- makeCacheMatrix(matrix(rep(1,1), 1, 1)) // create cacheable matrix
## cacheSolve(m) // Get the inverse of the matrix

## makeCacheMatrix function creates a new list that caches the result of matrix
## inverse calculation. The input argument is the matrix
## The function returns a list containing following four named items:
## set: Function object that (re)- sets the value of matrix
## get: Function object that returns the value of the matrix
## setResult: Function used to set the result of inverse calculation
## getResult: Function used to get the result of inverse calculation

makeCacheMatrix <- function(x = matrix()) {
  cachedResult <- NULL
  set <- function(y) {
    x <<- y
    cachedResult <<- NULL
  }
  
  get <- function() {
    x
  }
  
  
  setResult <- function(value) {
    cachedResult <<- value
  }
  
  getResult <- function() {
    cachedResult
  }
  
  list(set=set, get=get, setResult=setResult, getResult=getResult)

}


## The cacheSolve funtion tries to re-use the previously cached inverse result. On first invocation
## it computes the inverse by calling solve function and caches in result so as to avoid the inverse
## computation on future invocations of this function on the same matrix

cacheSolve <- function(x, ...) {
  result <- x$getResult();
  if (!is.null(result)) {
    message("returning result from cache")
    result
  } else {
    data <- x$get()
    result <- solve(data)
    x$setResult(result)
    result
  }
}
