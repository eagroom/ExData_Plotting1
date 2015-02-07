setwd("~/Data science specialization/Exploratory Data Analysis/Base Plots Project/ExData_Plotting1")
#install the sqldf package if not already installed.  Used for selecting data from the file
if (!require("sqldf")) {
    install.packages("sqldf")
    require("sqldf")
}

#select data from Feb. 1st and 2nd 2007 from the file
data<-read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")
newDateTime<-paste(data$Date, data$Time, Sep = " ") #combine the date and time varibles
newDateTime<- sub("\\s+$", "", newDateTime) #trim the trailing spaces
newDateTime <- strptime(newDateTime, format = "%d/%m/%Y %H:%M:%S")#cast the new varible as DateTime
data$DateTime <- newDateTime #add the new varible to the data frame

plot(data$DateTime, data$Sub_metering_1, type="l", ylab='Energy sub meeting', xlab='') #intilize new plot and draw first line
lines(data$DateTime, data$Sub_metering_2, col="red") #draw second line
lines(data$DateTime, data$Sub_metering_3, col="blue") #draw third line
legend("topright", lty=1, cex=0.8, col= c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")  ## Copy plot to PNG file 
dev.off()  #close the PNG device