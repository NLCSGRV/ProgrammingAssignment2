## This script tests makeCacheMatrix and cacheSolve with two matrices. 
## The first is created using makeCacheMatrix. The second uses the set function to set a
## existing CacheMatrix object to a new matrix value.

## change the /path/to in the line below to the path where cachematrix.R is stored
source('/path/to/cachematrix.R', echo=FALSE)
rm(test_matrix)
test_matrix <- makeCacheMatrix(matrix(c(1,5,3,5,7,10,4,3,1),3,3))
test_matrix$get()
message("Should not find a cached inverse matrix and should call solve to generate it")
cacheSolve(test_matrix)
message("Should find a cached inverse matrix and return it")
cacheSolve(test_matrix)
test_matrix$set(matrix(c(2,4,3,4,5,6,1,2,3),3,3))
test_matrix$get()
message("Should not find a cached inverse matrix and should call solve to generate it")
cacheSolve(test_matrix)
message("Should find a cached inverse matrix and return it")
cacheSolve(test_matrix)