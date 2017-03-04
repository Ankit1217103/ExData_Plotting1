## Getting full dataset
householdFile <- "household_power_consumption.txt"
plotData <- read.table(householdFile, header=T, sep=";", na.strings="?")

## Subsetting the data
stopdate <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
startdate <-strptime(paste(stopdate$Date, stopdate$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
stopdate <- cbind(startdate, stopdate)

## Plot 3
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(stopdate$startdate, stopdate$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(stopdate$startdate, stopdate$Sub_metering_2, col=columnlines[2])
lines(stopdate$startdate, stopdate$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")

## Saving to file
png("plot3.png", width = 480, height = 480)
dev.off()