# Plot4 script for Exploratory Data Analysis - Project 1
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

# set up the 2x2 plot window and the margins
par(mfcol=c(2,2))
par(mar=c(4,2,4,1))

# do the top left plot
plot(datetimes,subsetdata[,3],type="l",xlab="",ylab="Global Active Power")

# do the bottom left plot
plot(datetimes,subsetdata[,7],col="black",type="l",xlab="",ylab="Energy sub metering")
lines(datetimes,subsetdata[,8],col="red")
lines(datetimes,subsetdata[,9],col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# do the top right plot
plot(datetimes,subsetdata[,5],type="l",ylab="Voltage")

# do the bottom right plot
plot(datetimes,subsetdata[,4],type="l",ylab="Global_reactive_power")


# copy the nice graph to a png file
dev.copy(png,file="plot4.png")

# close the png file object
dev.off()
