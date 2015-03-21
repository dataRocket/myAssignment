## functions are designed to make use of the scoping rules in R. they try to reduce computation by 
## caching the inverse of a matrix

## makes an object which return functions to set and get the matrix and the cached inverse

makeCacheMatrix <- function(x = matrix()) {
inver<- NULL

getmatrix<- function() 
	{
		x
	}
getinverse <- function()
	{
		inver
	}
setmatrix <- function(y)
	{
		x<<-y
		inver<<-NULL
	}
setinverse <- function(z)
	{
		inver<<- z
	}
list(getmatrix=getmatrix , getinverse=getinverse, setmatrix=setmatrix , setinverse=setinverse)


}


## if the matrix is unchanged this function return a cached entry of inverse, 
##however if this function is called with a different matrix inverse is computed and cached

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
cached_matrix<-x$getinverse()
	if(!is.null(cached_matrix))
	{
		message("yep")
		return(cached_matrix)
		}
	m<-x$getmatrix()
	im<-solve(m, ...)
	x$setinverse(im)
	im
}
