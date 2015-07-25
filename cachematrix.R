## First an object is created in which a matrix can be saved, then the inverse of a matrix is stored in this object

## The function first creates functions and then stores them in a list

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


## This functions inverses the matrix if there is one to begin with.

cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    data <- x$get()
    m <- inverse(data, ...)
    x$setinverse(m)
    m
        ## Return a matrix that is the inverse of 'x'
}
