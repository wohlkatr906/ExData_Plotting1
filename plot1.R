#read in data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./power.zip")
powerData <- read.csv2("Katrina's Files/household_power_consumption.txt", skip = 66637, nrows = 2880, header = FALSE, na.strings = "?")
colnames(powerData) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#change to appropriate formats
powerData$Date <- as.Date(powerData$Date, format = ("%d/%m/%Y"))
powerData$Global_active_power <- as.numeric(as.vector(powerData$Global_active_power))
#open file device
png(filename = "plot1.png")
#create plot
hist(powerData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
#close file device
dev.off()
