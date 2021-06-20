library(swirl)
swirl()
#Name
Zhao
#Course
1
##1.lapply and sapply
head(flags)
dim(flags)  #check the dimension of the dataset
cls_list <- lapply(flags, class)
cls_vect <- sapply(flags, class)
flag_colors <- flags[, 11:17]
head(flag_colors)
lapply(flag_colors,sum)
sapply(flag_colors,sum)
sapply(flag_colors,mean)
flag_shapes <- flags[, 19:23]
lapply(flag_shapes,range)
shape_mat <- sapply(flag_shapes,range)
unique_vals <- lapply(flags, unique)
lapply(unique_vals, function(elem) elem[2]) 

##2. vapply and tapply
###Whereas sapply() tries to 'guess' the correct format of the result, vapply() allows you to specify it explicitly.
vapply(flags, unique, numeric(1)) #will obviously get an error.
vapply(flags, class, character(1))
table(flags$landmass)
table(flags$animate)
tapply(flags$animate, flags$landmass, mean)
tapply(flags$population, flags$red, summary)
tapply(flags$population, flags$landmass, summary)

#Assignment
##the <<- operator:
#assign a value to an object in an environment that is different from the current environment.
#Example: Caching the Mean of a Vector
##makeVector <- function(x = numeric()) {
##  m <- NULL
##  set <- function(y) {  #set the value of the vector
##    x <<- y
##    m <<- NULL
##  }
##  get <- function() x  #get the value of the vector
##  setmean <- function(mean) m <<- mean  #set the value of the mean
##  getmean <- function() m   #get the value of the mean
##  list(set = set, get = get,
##       setmean = setmean,
##       getmean = getmean)
##}
##cachemean <- function(x, ...) {
##  m <- x$getmean()
##  if(!is.null(m)) {
##    message("getting cached data")
##    return(m)
##  }
##  data <- x$get()
##  m <- mean(data, ...)
##  x$setmean(m)
##  m
##}

#1. Fork from the ProgrammingAssignment2 repository by the "Fork" button on Github
#2. In your own ProgrammingAssignment2 repository, click "Clone" and copy the http link
#3. Open the directory you wanna keep this repository and right click "Git bash here"
#4. A Git window will be openned and enter "git clone" followed by the http link from Github.

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(solve) m <<- solve
  getinv <- function()  m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x,...) {
  m <- x$getinv()
  if(!is.null(m)) {
  message("getting cached data")
  return(m)
  }
  data <- x$get()
  m <- solve(data,...)
  x$setinv(m)
  m
}

x<-matrix(1:4,2,2)
z<-makeCacheMatrix(x)
cacheSolve(z)


