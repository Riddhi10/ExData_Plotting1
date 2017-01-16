
## read the file
householdfile <- read.table("D:/R Data/exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=";", na.strings="?")

## fetch the data according to given time period
timeData <- householdfile[householdfile$Date %in% c("1/2/2007","2/2/2007"),]
Timeclass <-strptime(paste(timeData$Date, timeData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(Timeclass, timeData)
## Generating Plot 3
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(finalData$Timeclass, finalData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(finalData$Timeclass, finalData$Sub_metering_2, col=columnlines[2])
lines(finalData$Timeclass, finalData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")

