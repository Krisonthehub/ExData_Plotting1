setwd("C:\\Users\\Kris\\Documents\\R")
Elecdata<-read.table("household_power_consumption.txt", 
                     header=TRUE, sep=";", fill=FALSE, na.strings = "?")
Elecdata2<-as.Date(Elecdata[,1], "%d/%m/%Y")
Elecdata<-cbind(Elecdata2, Elecdata)
Elecdata<-select(Elecdata, Elecdata2, Time:Sub_metering_3)
Elecdata<-rename(Elecdata, Date=Elecdata2)
Myelecdata<-filter(Elecdata, Date=="2007-02-01")
Myelecdata2<-filter(Elecdata, Date=="2007-02-02")
mergedElecdata<-rbind(Myelecdata, Myelecdata2)

png(file="plot4.png")
par(mfrow=c(2,2))
plot(mergedElecdata$Time, mergedElecdata$Global_active_power, 
     ylab= "Global Active Power (kilowatts)",
     xaxt="n",
     axis(1, 1:3, labels="Thu, Fri, Sat"))
plot(mergedElecdata$Time, mergedElecdata$Voltage, 
     ylab= "Voltage", xlab="datetime",
     xaxt="n",
     axis(1, 1:3, labels="Thu, Fri, Sat"))
plot(mergedElecdata$Time, mergedElecdata$Sub_metering_1, 
     ylab= "Global Active Power (kilowatts)",
     xaxt="n",
     axis(1, 1:3, labels="Thu, Fri, Sat"))
points(mergedElecdata$Time, mergedElecdata$Sub_metering_2, col="red", type="l")
points(mergedElecdata$Time, mergedElecdata$Sub_metering_3, col="blue", type="l")
legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), 
       col=c("black", "red", "blue"), lty=1, xjust=1)
plot(mergedElecdata$Time, mergedElecdata$Global_active_power, ylim=c(0, 0.5),
     xlab="datetime", ylab= "Global Active Power (kilowatts)",
     xaxt="n",
     axis(1, 1:3, labels="Thu, Fri, Sat"))
dev.off()
