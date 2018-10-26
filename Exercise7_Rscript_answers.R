##Exercise 7##
##Iker Soto##

setwd("Documents/biocomputing-2018/Biocomp-Fall2018-181012-Exercise7/")
flower<-read.csv(file="iris.csv")
dim(flower)
# Write a function that returns the odd (1, 3, 5, etc.) rows of any dataframe passed as an argument.
oddrow<-function(data){
  totalrow<-seq(nrow(data)) %% 2==1 #This variable contains all the odd numbers(remainder of 1 when divided by zero) contained in the sequence from 1 to (total number of rows) by 1. 
  noneven<-data[totalrow,] #This variable uses the odd numbers extracted ib the previous step to subset the sepecific rows we want from this dataframe
  return(noneven)
}
oddrow(flower) #Returns the odd rows from the iris.csv dataframe

##Return the number of observations for a given species included in the data set
numobservation<-function(data,specie){ 
  obsperspecie<-data[data$Species==specie,] #only returns rows that have a particular specie in the Species column
  obscount<-nrow(obsperspecie) 
  return(obscount)
}
#Example of use: getting the number of observations for the specie setosa, virginica or versicolor
numobservation(flower,"setosa")
numobservation(flower,"virginica")
numobservation(flower,"versicolor")

##Return a dataframe for flowers with Sepal.Width greater than a value specified by the function user
Sepal.Width<-function(data,greater){ 
  class.by.width<-data[data$Sepal.Width>greater,] #Only returns columns where the value in the Sepal.Width column is greater than the value inputed in the place of "greater"
  return(class.by.width)
}
#Example of use: getting a data frame of flowers with a sepal width greater than 3.5 
Sepal.Width(flower,3.5)

##Write the data for a given species to a comma-delimited file with the given species name as the file name. 
speciedata<-function(data,specie){
  specieinfo<-data[data$Species==specie,] #returns the data corresponding to a particular specie
  newfile<-write.csv(specieinfo,(paste(specie,"csv",sep =".")), row.names = F) #writes the new csv file named after the name of the specie whose info is contained in the data frame
  return<-newfile
}
#Example of use: Creating a comma-delimited file named virginica.csv that contains the data from all the observations corresponding to this specie.
speciedata(flower,"virginica")


