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
