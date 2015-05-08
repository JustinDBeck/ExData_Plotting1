# Plot3 script for Exploratory Data Analysis - Project 1
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
plot(datetimes,subsetdata[,7],col="black",type="l",xlab="",ylab="Energy sub metering")
lines(datetimes,subsetdata[,8],col="red")
lines(datetimes,subsetdata[,9],col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# copy the nice graph to a png file
dev.copy(png,file="plot3.png")

# close the png file object
dev.off()
