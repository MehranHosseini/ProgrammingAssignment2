## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache the input matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
  x<<-y
  m<<-NULL
}
get<-function() x
setmatrix<-function(solve) m<<- solve
getmatrix<-function() m
list(set=set, get=get,
   setmatrix=setmatrix,
   getmatrix=getmatrix)
}


## This function calls functions stored in the special "matrix" returned by makeCacheMatrix (above).

cacheSolve <- function(x=matrix(), ...) {
    m<-x$getmatrix()
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }
    matrix <- x$get()
    m<-solve(matrix, ...)
    x$setmatrix(m)
    m
}
