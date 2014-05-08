## LOAD the data 
setwd("~/Downloads")
data <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data$Datetime<-strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
## Focus on two days
focus<-data[data$Datetime >= strptime("01/02/2007 00:00:00","%d/%m/%Y %H:%M:%S") & data$Datetime <= strptime("02/02/2007 23:59:59","%d/%m/%Y %H:%M:%S"),]
plot(focus$Datetime, focus$Global_active_power, xlab= "", ylab="Global active power (kilowatts)", type="l")
dev.copy(png,"Plot2.png")
dev.off()
