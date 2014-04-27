## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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


## Write a short comment describing this function

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
