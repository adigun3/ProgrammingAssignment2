## Matrix inversion can prove to be a long and costly computational process, hence there 
## may be need to caching the inverse of the matrix instead of computing them repeatedly.
## In this assignment, I introduced the `<<-` operator which can be used to
## assign a value to an object in an environment that is different from the
## current environment. 
## The two functions below are used to create a
## special object that stores a matrix and caches its inverse.


## The first function, `makeCacheMatrix` creates a "list", which is
## really a list containing a function to

## 1.  set the value of the matrix
## 2.  get the value of the matrix
## 3.  set the value of the inverse of matrix
## 4.  get the value of the inverse of matrix


    makeCacheMatrix <- function(x = matrix()) {
            inv <- NULL
            set <- function(y) {
                    x <<- y
                    inv <<- NULL
            }
            get <- function() x
            setinverse <- function(inverse) inv <<- mean
            getinverse <- function() inv
            list(set = set, get = get,
                 setinverse = setinverse,
                 getinverse = getinverse)
    }





## The second function calculates the inverse of the "matrix"
## created with the above first function simply by returning the inverse of the matrix.
## The function first checks to see if the inverse has already been calculated, and 
## If so, it gets the result of the inverse from the cache and skips the computation. 
## On the other hand, if the result is not cache, it calculates the inverse of
## the data and sets the value of the cache via the `setinverse` function.

    cacheSolve <- function(x, ...) {
            inv <- x$getinverse()
            if(!is.null(inv)) {
                    message("getting cached data")
                    return(inv)
            }
            data <- x$get()
            inv <- solve(data, ...)
            x$setinverse(inv)
            inv
    }


