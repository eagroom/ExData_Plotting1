setwd("~/Data science specialization/Exploratory Data Analysis/Base Plots Project/ExData_Plotting1")
#install the sqldf package if not already installed.  Used for selecting data from the file
if (!require("sqldf")) {
    install.packages("sqldf")
    require("sqldf")
}

#select data from Feb. 1st and 2nd 2007 from the file
data<-read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")

hist(data$Global_active_power,col='red',xlab='Global Active Power (kilowatts)', main = 'Global Active Power')
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")  ## Copy plot to PNG file 
dev.off()  #close the PNG device