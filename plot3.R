#read in data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./power.zip")
powerData <- read.csv2("Katrina's Files/household_power_consumption.txt", skip = 66637, nrows = 2880, header = FALSE, na.strings = "?")
colnames(powerData) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#change into appropriate formats
powerData$Date <- as.Date(powerData$Date, format = ("%d/%m/%Y"))
powerData$Global_active_power <- as.numeric(as.vector(powerData$Global_active_power))
powerData$Sub_metering_1 <- as.numeric(as.vector(powerData$Sub_metering_1))
powerData$Sub_metering_2 <- as.numeric(as.vector(powerData$Sub_metering_2))
powerData$Sub_metering_3 <- as.numeric(as.vector(powerData$Sub_metering_3))
dateTime <- paste(powerData$Date, powerData$Time)
dateTime <- strptime(dateTime, format = "%Y-%m-%d %H:%M:%S")
#open file device
png(filename = "plot3.png")
#make graph
plot(dateTime, powerData$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(dateTime, powerData$Sub_metering_2, col = "red")
lines(dateTime, powerData$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2)
#close file device
dev.off()