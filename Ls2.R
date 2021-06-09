library(swirl)
swirl()
#Name
Zhao
#Course
1
8#Logic
##`==`
  TRUE==TRUE
  6 == 7
##"("
  (FALSE == TRUE) == FALSE
##"<", "<=",">" & ">=" 
  6 < 7
  10<=10
##"!="
  5!=7
  !(5 == 7)
##"&", "&&"
###`&` operator to evaluate AND across a vector
###`&&` only evaluates the first member of a vector.
    FALSE & FALSE
    TRUE & c(TRUE, FALSE, FALSE)
    c(TRUE, TRUE, TRUE) & c(TRUE, FALSE, FALSE)
    TRUE && c(TRUE, FALSE, FALSE)
## "|", "||"
    TRUE | c(TRUE, FALSE, FALSE)
    TRUE || c(TRUE, FALSE, FALSE)
##Order of Operator: AND > OR
    5 > 8 || 6 != 8 && 4 > 3.9
##isTRUE()
    isTRUE(6 > 4)
##xor() :If one argument evaluates to TRUE and one argument evaluates to FALSE
##        then this function will return TRUE,otherwise it will return FALSE.
    xor(5 == 6, !FALSE)
##which(),any(),all()    
    ints <- sample(10)
    ints
    ints > 5
    which(ints > 7)
    any(ints<0)
    all(ints>0)
    
#Functions
    Sys.Date() #Return today's date.
    mean(c(2,4,5))
##To understand computations in R, two slogans are helpful: 1. Everything that exists is an object. 
##                                                          2. Everything that happens is a function call.
##If you want to see the source code for any function, just type the function name without any arguments or parentheses.
    args(remainder) #see the arguments for the function.
    
##"Unpack" arguments from an ellipses:
    # add_alpha_and_beta <- function(...){
    #use list() function to see the arguments in "..."
    #   args <- list(...)    
    #   alpha <- args[["alpha"]]
    #   beta  <- args[["beta"]]
    
## User-defined binary operators have the following syntax:
    #      %[whatever]% 
    # where [whatever] represents any valid variable name.  

    
#Dates and Times
    d1 <- Sys.Date()
    class(d1)
    unclass(d1)
    d2<-as.Date("1969-01-01")
    unclass(d2)
    t1<-Sys.time()
    class(t1)
    unclass(t1)
    t2<-as.POSIXlt(Sys.time())
    class(t2)
    unclass(t2)
    weekdays(d1)
    months(t1)
    quarters(t2)
    t3<-"October 17, 1986 08:24"
    t4<-strptime(t3, "%B %d, %Y %H:%M")
    difftime(Sys.time(), t1, units = 'days')#find the amount of time in DAYS that has passed since t1

#################################################################    
#Assignment 1 INSTRUCTIONS: Air Pollution
##Part 1
pollutantmean<-function(directory = "specdata",pollutant, id =1:332){
  pltm<-data.frame()
  for (i in id){
    pltm<-rbind(pltm,read.csv(paste(directory,"/",sprintf('%03d', i),".csv",sep=""),header = TRUE))
  }
  mean(pltm[pollutant][!is.na(pltm[pollutant])])
}
#Part 2
complete<-function(directory = "specdata",id =1:332){
  cptc<-data.frame(id, nobs = numeric(length(id)))
  for (i in id){
    df<-read.csv(paste(directory,"/",sprintf('%03d', i),".csv",sep=""),header = TRUE)
    x<-is.na(df[2]) | is.na(df[3])
    cptc[which(cptc[,1]==i),2] <- nrow(df) - sum(x)
    }
  cptc
}
#Part 3
corr<-function (directory = "specdata",threshold = 0){
  cpc<-complete(directory)
  x<- cpc$nobs >threshold
  cpc<-cbind(cpc,x)
  crl<- function(directory = "specdata",id){
    df<-read.csv(paste(directory,"/",sprintf('%03d', id),".csv",sep=""),header = TRUE)
    x<-is.na(df[2]) | is.na(df[3])
    df<-df[-which(x),]
    cor(df[,2],df[,3])
  }
  re<-numeric()
  for (i in 1:332) {
    if (cpc$x[i])  re<-c(re,crl(directory,i))
  }
  re
}
