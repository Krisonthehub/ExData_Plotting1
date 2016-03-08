
Elecdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
Elecdata$Time <- strptime(Elecdata$Time,format="%H:%M:%S")
Elecdata$Date <- as.Date(Elecdata$Date, format="%d/%m/%Y")

Elecdata2<-subset(Elecdata, Date == as.Date("2007-02-01"))
Elecdata3<-subset(Elecdata, Date == as.Date("2007-02-02"))
mergedElecdata<-rbind(Elecdata2, Elecdata3)

mergedElecdata$DateTime <- paste(mergedElecdata$Date,strftime(mergedElecdata$Time, format="%H:%M:%S"))
mergedElecdata$DateTime <- as.POSIXct(mergedElecdata$DateTime)

mergedElecdata$Global_active_power <- as.numeric(mergedElecdata$Global_active_power)
png(filename="plot2.png")
with(mergedElecdata, plot(DateTime, Global_active_power/500, type = "l", ylab = "Global Active Power (kilowatts)",xlab = ""))
dev.off()
