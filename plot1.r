## Getting full dataset
householdFile <- "household_power_consumption.txt"
plotData <- read.table(householdFile, header=T, sep=";", na.strings="?")

## Subsetting the data
SetDate <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(SetDate$Date, SetDate$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
SetDate <- cbind(SetTime,SetDate)

## Plot 1
png("plot1.png", width = 480, height = 480)
hist(SetDate$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
