# LOAD DATA
hPowerCon <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na="?",colClasses=c(rep("character",2),rep("numeric",7)))

# GET DATA FOR 2 DAYS: FEBRUARY 1-2, 2007
selectedData <- hPowerCon[hPowerCon$Date %in% c("1/2/2007","2/2/2007"),]
Date_time <- strptime(paste(selectedData$Date, selectedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
selectedData <- cbind(Date_time,selectedData[,3:9])

Global_active_power <- as.numeric(selectedData$Global_active_power)
Global_reactive_power <- as.numeric(selectedData$Global_reactive_power)
Voltage <- as.numeric(selectedData$Voltage)
Sub_metering_1 <- as.numeric(selectedData$Sub_metering_1)
Sub_metering_2 <- as.numeric(selectedData$Sub_metering_2)
Sub_metering_3 <- as.numeric(selectedData$Sub_metering_3)

# PLOT 4
png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
# Top - Left
plot(Date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
lines(Date_time, Global_active_power, col = "black")
axis(side = 1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
# Top - Right
plot(Date_time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
lines(Date_time, Voltage, col = "black")
axis(side = 1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
# Bottom - Left
plot(Date_time, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(Date_time, Sub_metering_1, col = "black")
lines(Date_time, Sub_metering_2, col = "red")
lines(Date_time, Sub_metering_3, col = "blue")
legend("topright", bty = "n", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
axis(side = 1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
# Bottom - Right
plot(Date_time, Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = colnames(data)[3])
lines(Date_time, Global_reactive_power, col = "black")
axis(side = 1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()