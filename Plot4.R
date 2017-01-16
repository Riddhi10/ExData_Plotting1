

## read the file
householdfile <- read.table("D:/R Data/exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=";", na.strings="?")

## fetch the data according to given time period
timeData <- householdfile[householdfile$Date %in% c("1/2/2007","2/2/2007"),]
Timeclass <-strptime(paste(timeData$Date, timeData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(Timeclass, timeData)
## Generating Plot 4
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(finalData$Timeclass, finalData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(finalData$Timeclass, finalData$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(finalData$Timeclass, finalData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(finalData$Timeclass, finalData$Sub_metering_2, type="l", col="red")
lines(finalData$Timeclass, finalData$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(finalData$Timeclass, finalData$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
