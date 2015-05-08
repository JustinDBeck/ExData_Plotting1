# Plot1 script for Exploratory Data Analysis - Project 1
#
# Justin Beck - 8 May 2015
#


# load the data if it doesn't already exist in the workspace
if (!exists("houseData")) {

  houseData <- read.table(file = "household_power_consumption.txt",
                          header=TRUE,na.strings = "?", sep = ";",
                          colClasses = c("character","character","double",
                                         "double","double","double",
                                         "double","double","double"))

  #subset the data as instructed
  subsetdata <- houseData[houseData[,1]=="1/2/2007" | houseData[,1]=="2/2/2007",]
  
  # create datetimes with the 1st and 2nd converted to date-time format of the subset data
  datetimes <- strptime(paste(subsetdata[,1],subsetdata[,2]),format = "%d/%m/%Y %H:%M:%S")
  
}


# generate the plot
hist(subsetdata[,3],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

# copy the nice graph to a png file
dev.copy(png,file="plot1.png")

# close the png file object
dev.off()
