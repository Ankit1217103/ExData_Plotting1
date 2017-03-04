## Getting full dataset
householdFile <- "household_power_consumption.txt"
plotData <- read.table(householdFile, header=T, sep=";", na.strings="?")

## Subsetting the data
SetDate <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(SetDate$Date, SetDate$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
SetDate <- cbind(SetTime, SetDate)


## Plot 4
png("plot4.png", width = 480, height = 480)
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(SetDate$SetTime, SetDate$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(SetDate$SetTime, SetDate$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(SetDate$SetTime, SetDate$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(SetDate$SetTime, SetDate$Sub_metering_2, type="l", col="red")
lines(SetDate$SetTime, SetDate$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(SetDate$SetTime, SetDate$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
