Elecdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
Elecdata$Time <- strptime(Elecdata$Time,format="%H:%M:%S")
Elecdata$Date <- as.Date(Elecdata$Date, format="%d/%m/%Y")

Elecdata2<-subset(Elecdata, Date == as.Date("2007-02-01"))
Elecdata3<-subset(Elecdata, Date == as.Date("2007-02-02"))
mergedElecdata<-rbind(Elecdata2, Elecdata3)

mergedElecdata$DateTime <- paste(mergedElecdata$Date,strftime(mergedElecdata$Time, format="%H:%M:%S"))
mergedElecdata$DateTime <- as.POSIXct(mergedElecdata$DateTime)

png(filename="plot3.png")
with(mergedElecdata, plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy Sub Metering",xlab = ""))
points(mergedElecdata$DateTime, mergedElecdata$Sub_metering_2, col="red", type="l")
points(mergedElecdata$DateTime, mergedElecdata$Sub_metering_3, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                            lty=c(1,1,1), col=c("black", "red", "blue"))
dev.off()