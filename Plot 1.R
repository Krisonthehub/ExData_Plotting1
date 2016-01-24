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
png(file="plot1.png")
hist(mergedElecdata$Global_active_power, col="red", 
     xlab= "Global Active Power (kilowatts)",
     ylab="Frequency", main="Global Active Power")
dev.off()

