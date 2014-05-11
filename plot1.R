#After dowload from browser and extract, filename is household_power_consumption.txt
library('sqldf')
myfile <- "household_power_consumption.txt"
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv2.sql(myfile,mySql)
myData$DateTime <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")

#plot 1
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(myData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()