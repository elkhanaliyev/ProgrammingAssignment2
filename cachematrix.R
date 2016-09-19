## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Through below function you can cache created matrix in object. Try follow:
##a<-diag(5,3)
## a>
##     [,1] [,2] [,3]
##[1,]    5    0    0
##[2,]    0    5    0
##[3,]    0    0    5
> makeCacheMatrix <- function(x = matrix()) {
       m <- NULL
       set <- function(y) {
             x <<- y
             m <<- NULL
       }
       get <- function() x
       setinverse <- function(solve) m <<- solve
       getinverse <- function() m
       list(set = set, get = get,
            setinverse = setinverse,
            getinverse = getinverse)
}


## Now try to run matrix<-makeCacheMatrix(a) So you'll create "cache" in object matrix

## Below function  inverse (1/x to each element of object) and returns output of our manipulating with data
> cacheSolve <- function(x, ...) {
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
 
 ## run > cacheSolve(matrix)and function will manipulate with data and return the desired output.
 
##      [,1] [,2] [,3]
##[1,]  0.2  0.0  0.0
##[2,]  0.0  0.2  0.0
##[3,]  0.0  0.0  0.2
