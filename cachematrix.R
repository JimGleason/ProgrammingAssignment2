## R Programming Project 2
## Two functions implementing a cached matrix inverse, using the same pattern as the cachemean example
## described in the home work.
## makeCacheMatrix - creates a set of functions that allow setting and getting a matrix and it's inverse
##                   solve is used to calculate the matrix
## cacheSolve      - uses the object created by makeCacheMatrix to store the matrix and it's inverse
##                   ... is passed to the solve function

## makeCacheMatrix
##     params (x is a matrix)
##     returns an object with 4 methods (set, get, setinverse, getinverse)

makeCacheMatrix <- function(x = matrix()) {
    
    inverse <<- NULL
    set <- function (y) {
        x <<- y
        inverse <<- NULL
    }
    get <- function () x
    setinverse <- function (inv) inverse <<- inv
    getinverse <- function () inverse
    list (set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## cacheSolve
##   param x : a matrix
##   params ... : these additional parameters are passed to solve and must be compatible with that function
##   return : the inverse of x
##   This uses makeCacheMatrix to store the inverse so it only has to be calculated one time

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    i <- x$getinverse()
    if (!is.null(i)) {
        message ("getting cached data")
        return (i)
    }
    data <- x$get()
    i    <- solve (data, ...)
    x$setinverse (i)
    i
}
