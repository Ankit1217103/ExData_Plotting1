## Getting full dataset
householdFile <- "household_power_consumption.txt"
plotData <- read.table(householdFile, header=T, sep=";", na.strings="?")

## Subsetting the data
stopdate <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
startdate <-strptime(paste(stopdate$Date, stopdate$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
stopdate <- cbind(startdate, stopdate)


## Plot 4
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(stopdate$startdate, stopdate$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(stopdate$startdate, stopdate$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(stopdate$startdate, stopdate$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(stopdate$startdate, stopdate$Sub_metering_2, type="l", col="red")
lines(stopdate$startdate, stopdate$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(stopdate$startdate, stopdate$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")

## Saving to file
png("plot4.png", width = 480, height = 480)
dev.off()