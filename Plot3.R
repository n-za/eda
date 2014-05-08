## LOAD the data 
setwd("~/Downloads")
data <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data$Datetime<-strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
## Focus on two days
focus<-data[data$Datetime >= strptime("01/02/2007 00:00:00","%d/%m/%Y %H:%M:%S") & data$Datetime <= strptime("02/02/2007 23:59:59","%d/%m/%Y %H:%M:%S"),]
## Plot an empty graphics
plot(focus$Datetime, focus$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
## Fill the graphic
with(focus, lines(Datetime, Sub_metering_1, col="black"))
with(focus, lines(Datetime, Sub_metering_2, col="red"))
with(focus, lines(Datetime, Sub_metering_3, col="blue"))
legend("top", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black", "red", "blue"))
dev.copy(png,"Plot3.png")
dev.off()
