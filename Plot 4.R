
Elecdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
Elecdata$Time <- strptime(Elecdata$Time,format="%H:%M:%S")
Elecdata$Date <- as.Date(Elecdata$Date, format="%d/%m/%Y")

Elecdata2<-subset(Elecdata, Date == as.Date("2007-02-01"))
Elecdata3<-subset(Elecdata, Date == as.Date("2007-02-02"))
mergedElecdata<-rbind(Elecdata2, Elecdata3)

mergedElecdata$DateTime <- paste(mergedElecdata$Date,strftime(mergedElecdata$Time, format="%H:%M:%S"))
mergedElecdata$DateTime <- as.POSIXct(mergedElecdata$DateTime)

mergedElecdata$Global_active_power <- as.numeric(mergedElecdata$Global_active_power)

png(file="plot4.png")
par(mfrow=c(2,2))
plot(mergedElecdata$DateTime, mergedElecdata$Global_active_power, type="l",
     ylab= "Global Active Power (kilowatts)",xlab="")
plot(mergedElecdata$DateTime, mergedElecdata$Voltage, type="l",
     ylab= "Voltage", xlab="datetime")
plot(mergedElecdata$DateTime, mergedElecdata$Sub_metering_1, type="l",
     ylab= "Energy Sub Metering",xlab="")
points(mergedElecdata$DateTime, mergedElecdata$Sub_metering_2, col="red", type="l")
points(mergedElecdata$DateTime, mergedElecdata$Sub_metering_3, col="blue", type="l")
legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), 
       col=c("black", "red", "blue"), lty=1, xjust=1)
plot(mergedElecdata$DateTime, mergedElecdata$Global_active_power, type="l", 
   ##  ylim=c(0, 0.5),
     xlab="datetime", ylab= "Global Active Power (kilowatts)")
dev.off()