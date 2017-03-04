## Getting full dataset
householdFile <- "household_power_consumption.txt"
plotData <- read.table(householdFile, header=T, sep=";", na.strings="?")

## Subsetting the data
stopdate <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
startdate <-strptime(paste(stopdate$Date, stopdate$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
stopdate <- cbind(startdate, stopdate)

## Plot 1
hist(stopdate$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Saving to file
png("plot1.png", width = 480, height = 480)
dev.off()