#Swirl: Statistics with Interactive R Learning by Nick Carchedi

#install.packages("swirl")
#packageVersion("swirl")
library(swirl)
install_from_swirl("R Programming")     #Install the R Progroamming course
swirl()                                 #start swirl
#| Welcome to swirl! Please sign in. If you've been here before, use the same name as you did then. If you are new, call yourself something unique.
Zhao
#You can exit swirl and return to the R prompt (>) at any time by pressing the Esc key.If you are already at the prompt, type bye() to exit and save your progress.
#When you exit properly, you'll see a short message letting you know you've done so.

#| When you are at the R prompt (>):
#| -- Typing skip() allows you to skip the current question.
#| -- Typing play() lets you experiment with R on your own; swirl will ignore what you do...
#| -- UNTIL you type nxt() which will regain swirl's attention.
#| -- Typing bye() causes swirl to exit. Your progress will be saved.
#| -- Typing main() returns you to swirl's main menu.
#| -- Typing info() displays these options again.


#Then, follow the menus and select the R Programming course when given the option. For the first part of this course you should complete the following lessons:
#1. Basic Building Blocks

##When given two vectors of the same length, R simply performs the specified arithmetic operation (`+`, `-`, `*`, etc.) element-by-element. 
##If the vectors are of different lengths, R 'recycles' the shorter vector until it is the same length as the longer vector.

#2. Workspace and Files

getwd()           #get working dicectory
ls()              #lsit all the objects in local workspace
list.files()      #list all the files in the working directory
dir()             #list all the files in the working directory
args(list.files)  #list all the arguments to list.files()
#function (path = ".", pattern = NULL, all.files = FALSE, 
#          full.names = FALSE, recursive = FALSE, ignore.case = FALSE, 
#          include.dirs = FALSE, no.. = FALSE) 
old.dir<-getwd()  
dir.create("testdir")   #create a directory in the current working directory called "testdir"
setwd("testdir")        #Set your working directory to "testdir"
file.create("mytest.R") #Create a file in your working directory called "mytest.R"
file.exists("mytest.R") #Check to see if "mytest.R" exists in the working directory
file.info("mytest.R")   #Access information about the file "mytest.R"
file.rename("mytest.R","mytest2.R") #Change the name of the file "mytest.R" to "mytest2.R".
file.copy("mytest2.R","mytest3.R")  #Make a copy of "mytest2.R" called "mytest3.R".
file.path("mytest3.R")  #Provide the relative path to the file "mytest3.R"
file.path("folder1", "folder2")     #Pass 'folder1' and 'folder2' as arguments to| file.path to make a platform-independent pathname.
dir.create(file.path('testdir2', 'testdir3'), recursive = TRUE) # Create a directory in the current working directory called "testdir2" and a subdirectory for it called "testdir3".
                                                                #'recursive' arguemnt should be TRUE to create the nested directory.
setwd(old.dir)


#3. Sequences of Numbers

1:20
pi:10       # The result is a vector of real numbers starting with pi (3.142...) to 9.141593.
15:1
#if you have questions about an operator like the colon used above, you must enclose the symbol in backticks like this: ?`:`.
seq(1, 20)  #The same as 1:20
seq(0, 10, by=0.5)  #sequence with the increment 0.5
my_seq<-seq(5, 10, length=30) #sequence of 30 numbers.
length(my_seq)
seq(along.with = my_seq)      #Create a sequence the same as 1:length(my_seq)
seq_along(my_seq)             #Create a sequence the same as 1:length(my_seq)
rep(0, times = 40)            #creating a vector that contains 40 zeros
rep(c(0, 1, 2), times = 10)   #Create a vector to contain 10 repetitions of the vector (0, 1, 2)
rep(c(0, 1, 2), each = 10)    #Create a vector to contain 10 zeros, then 10 ones, then 10 twos. We can do this with the `each` argument


#4. Vectors

num_vect<-c(0.5,55,-10,6)
tf<- num_vect < 1         #The vector of 4 logical values of num_vect < 1
tf
num_vect >= 6
#Logical operators:`<`, `>=`, `>`, `<=`, `==` , `!=` 
#A | B : or/union
#A & B : and/intersection
#!A : negation

my_char<-c("My", "name", "is")
my_char
paste(my_char, collapse = " ") 
my_name<-c(my_char,"Zhao")
my_name
paste(my_name, collapse = " ") 
paste("Hello", "world!", sep = " ")
paste(1:3,c("X", "Y", "Z"),sep = "")
paste(LETTERS, 1:4, sep = "-")

#5. Missing Values

x<-c(44, NA, 5, NA)
x*3
y <- rnorm(1000)                #1000 random value that match normal distribution
z <- rep(NA, 1000)              #1000 NAs
my_data <- sample(c(y, z), 100) #randomly select 100 value from 2000 (y & z).
my_na<-is.na(my_data)           #is.na: TRUE for NA, FALSE for others.
my_data == NA                   #A vector of 100 NAs, because NA is not a value but a placeholder, so all the logical expression can only get NA
sum(my_na)

0/0                             #to get a NaN
Inf/Inf                         #to get a NaN
Inf - Inf                       #to get a NaN

#6. Subsetting Vectors
x
x[1:10]
x[is.na(x)]
y <- x[!is.na(x)]
y[y > 0]
x[x > 0]
x[!is.na(x) & x > 0]
x[c(3,5,7)]
x[0]
x[3000]
x[c(-2, -10)]
x[-c(2, 10)]
vect <- c(foo = 11, bar = 2, norf = NA)
vect
names(vect)       #Get the name of vect
vect2 <-c(11, 2, NA)
names(vect2) <- c("foo", "bar", "norf")   #name vect2
identical(vect,vect2)   #To check 2 vectors whether have identical names.
vect["bar"]
vect[c("foo", "bar")]

#7. Matrices and Data Frames

my_vector<-1:20
dim(my_vector)  #The dimension of my_vector. Vectors dont's have dimension attribute.
length(my_vector)
dim(my_vector) <- c(4, 5)   #transfer my_vector into a matrix.
dim(my_vector)
attributes(my_vector)
my_vector
class(my_vector)
my_matrix<-my_vector
my_matrix2<-matrix(1:20, nrow=4, ncol=5)  #Build a matrix.
identical(my_matrix,my_matrix2)
patients<-c("Bill","Gina","Kelly","Sean")
cbind(patients,my_matrix)
my_data <- data.frame(patients, my_matrix)
class(my_data)
cnames<-c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data)<-cnames
