housePower<-read.table("household_power_consumption.txt", sep = ";", strip.white=TRUE, stringsAsFactors=FALSE, dec = ".", header = TRUE)
housePower$Date<-as.Date(housePower$Date, "%d/%m/%Y")
requiredData<-subset(housePower, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
dateTime<-paste(requiredData$Date,requiredData$Time)
dateTime<-as.POSIXlt(dateTime)
gap<-as.numeric(requiredData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dateTime, gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()