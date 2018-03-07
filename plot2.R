# LOAD DATA
hPowerCon <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na="?",colClasses=c(rep("character",2),rep("numeric",7)))

# GET DATA FOR 2 DAYS: FEBRUARY 1-2, 2007
selectedData <- hPowerCon[hPowerCon$Date %in% c("1/2/2007","2/2/2007"),]
Date_time <- strptime(paste(selectedData$Date, selectedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
selectedData <- cbind(Date_time,selectedData[,3:9])

Global_active_power <- as.numeric(selectedData$Global_active_power)

# PLOT 2
png(filename = "Plot2.png", width = 480, height = 480)
plot(Date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
axis(1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
lines(Date_time, Global_active_power, col = "black")
dev.off()