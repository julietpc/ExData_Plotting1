# LOAD DATA
hPowerCon <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na="?",colClasses = c(rep("character", 2), rep("numeric", 7)))

# GET DATA FOR 2 DAYS: FEBRUARY 1-2, 2007
selectedData <- hPowerCon[hPowerCon$Date %in% c("1/2/2007","2/2/2007"),]

# PLOT 1
png("plot1.png", width=480, height=480)
hist(selectedData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
