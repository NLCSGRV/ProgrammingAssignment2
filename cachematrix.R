## Caching the Inverse of a Matrix:
## Matrix inversion can be computationally expensive and caching the inverse of a matrix rather 
## than compute it repeatedly can reduce the computational load.
## The two functions below are used to create a special object that 
## stores a matrix and will also store (cache) its inverse.
## See testcachematrix.R for tests.


## The makeCacheMatrix function creates a matrix object that can cache its inverse. 
## It takes one parameter (x), which is a matrix.

makeCacheMatrix <- function(x = matrix()) {
  if (!is.matrix(x)) {
    stop("This function takes a matrix as its only parameter!")
    ## we could test if the matrix is invertible here, but it has been left out as it is computationally expensive.  
  }
  ## initialise the inverse matrix to NULL so that we can tell that inverse needs to be solved
  inverse_matrix <- NULL   
  
  ## create a setter function to set the matrix x to a new matrix y. Set the inverse matrix to NULL to ensure new inverse will be solved
  set_matrix <- function(y) {
     inverse_matrix <<- NULL
     x <<- y   
  }
  
  ## create a getter function to return the uninverted matrix
  get_matrix <- function() x
  
  ## create a setter function to set the solved (inverted) matrix
  set_inverse_matrix <- function(inverse) inverse_matrix <<- inverse
  
  ## create a setter function to return the inverted matrix
  get_inverse_matrix <- function() inverse_matrix
  
  list(set = set_matrix, 
       get = get_matrix,
       set_inverse = set_inverse_matrix,
       get_inverse = get_inverse_matrix)
}


## This function returns the inverse of the matrix created using the makeCacheMatrix function.
## It takes one parameter (x), which is a matrix.If the inverse has already been stored 
## and the matrix has not changed, then it will return the cached version. Otherwise 
## it will solve the inverse and cache it.


cacheSolve <- function(x,...) {                  
   inverse<- x$get_inverse()               
   if(!is.null(inverse)) {    
      message("Cached inverse found. Returning cached data.")
      return(inverse)
   }                                       
   message("No cached data found. Solving inverse.")
   original_matrix <- x$get()
   x$set_inverse(solve(original_matrix,...))
   x$get_inverse()                        
}
