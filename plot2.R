#plot 2
#After dowload from browser and extract, filename is household_power_consumption.txt
library('sqldf')
myfile <- "household_power_consumption.txt"
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv2.sql(myfile,mySql)
myData$DateTime <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(myData$DateTime, myData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
