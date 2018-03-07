# LOAD DATA
hPowerCon <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na="?",colClasses=c(rep("character",2),rep("numeric",7)))

# GET DATA FOR 2 DAYS: FEBRUARY 1-2, 2007
selectedData <- hPowerCon[hPowerCon$Date %in% c("1/2/2007","2/2/2007"),]
Date_time <- strptime(paste(selectedData$Date, selectedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
selectedData <- cbind(Date_time,selectedData[,3:9])

Sub_metering_1 <- as.numeric(selectedData$Sub_metering_1)
Sub_metering_2 <- as.numeric(selectedData$Sub_metering_2)
Sub_metering_3 <- as.numeric(selectedData$Sub_metering_3)

# PLOT 3
png(filename = "Plot3.png", width = 480, height = 480)
plot(Date_time, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(Date_time, Sub_metering_1, col = "black")
lines(Date_time, Sub_metering_2, col = "red")
lines(Date_time, Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
axis(side = 1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()