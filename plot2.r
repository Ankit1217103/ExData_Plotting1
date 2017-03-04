## To push data into the R.
householdFile <- "household_power_consumption.txt"
## printing the output to the image.
png("plot2.png", width = 480, height = 480)
plot(finalData$SetTime, finalData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()