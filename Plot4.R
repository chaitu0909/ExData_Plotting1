housePower<-read.table("household_power_consumption.txt", sep = ";", strip.white=TRUE, stringsAsFactors=FALSE, dec = ".", header = TRUE)
housePower$Date<-as.Date(housePower$Date, "%d/%m/%Y")
requiredData<-subset(housePower, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
dateTime<-paste(requiredData$Date,requiredData$Time)
dateTime<-as.POSIXlt(dateTime)
sm1<-as.numeric(requiredData$Sub_metering_1)
sm2<-as.numeric(requiredData$Sub_metering_2)
sm3<-as.numeric(requiredData$Sub_metering_3)
gap<-as.numeric(requiredData$Global_active_power)
voltage<-as.numeric(requiredData$Voltage)
grp<-as.numeric(requiredData$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))

plot(dateTime, gap, type = "l", xlab = "", ylab = "Global Active Power")

plot(dateTime, sm1, type = "l", xlab = "", ylab = "Energy sub metering")
points(dateTime, sm2, type = "l", col="red")
points(dateTime, sm3, type = "l", col="blue")



plot(dateTime, voltage, type = "l", ylab = "Voltage")

plot(dateTime, grp, type = "l", ylab = "Global_ractive_power")

dev.off()