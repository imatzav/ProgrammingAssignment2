## Put comments here that give an overall description 
## of what your functions do

## A pair of functions that cache the inverse of a matrix

## Write a short comment describing this function

## The first function, makeCacheMatrix creates a special "vector", 
## which is really a list containing a function to
##  > set the value of the vector
##  > get the value of the vector
##  > set the value of the inverse
##  > get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

## The following function calculates the inverse of the special "vector" 
## created with the above function. However, it first checks to see if 
## the inverse has already been calculated. If so, it gets the inverse from the 
## cache and skips the computation. Otherwise, it calculates the inverse of 
## the data and sets the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}


