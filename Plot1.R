## LOAD the data 
setwd("~/Downloads")
data <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data$Datetime<-strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
## Focus on two days
focus<-data[data$Datetime >= strptime("01/02/2007 00:00:00","%d/%m/%Y %H:%M:%S") & data$Datetime <= strptime("02/02/2007 23:59:59","%d/%m/%Y %H:%M:%S"),]
hist(focus$Global_active_power, col="red", xlab="Global active power (kilowatts)", main = "Global Active Power")
dev.copy(png,"Plot1.png")
dev.off()
