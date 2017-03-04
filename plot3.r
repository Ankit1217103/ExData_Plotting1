## Getting full dataset
householdFile <- "household_power_consumption.txt"
plotData <- read.table(householdFile, header=T, sep=";", na.strings="?")

## Subsetting the data
SetDate <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(SetDate$Date, SetDate$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
SetDate <- cbind(SetTime, SetDate)

## Plot 3
png("plot3.png", width = 480, height = 480)
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(SetDate$SetTime, SetDate$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(SetDate$SetTime, SetDate$Sub_metering_2, col=columnlines[2])
lines(SetDate$SetTime, SetDate$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")
dev.off()
