#question 4
data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
str(data)
data$Date <- strptime(data$Date, "%d/%m/%Y")
data_target<-data[which(data$Date>="2007-02-01" & data$Date <= "2007-02-02"),]
sum(is.na(data_target))
str(data_target)
data_target$Global_active_power<-as.numeric(as.character(data_target$Global_active_power))
data_target$realtime <-strptime(paste(data_target$Date,data_target$Time,sep=" "),format ="%Y-%m-%d %H:%M:%S")


data_target$Sub_metering_1<-as.numeric(as.character(data_target$Sub_metering_1))
data_target$Sub_metering_2<-as.numeric(as.character(data_target$Sub_metering_2))
data_target$Sub_metering_3<-as.numeric(as.character(data_target$Sub_metering_3))
str(data_target)
class(data_target$Sub_metering_2)


data_target$Voltage<-as.numeric(as.character(data_target$Voltage))
data_target$Global_reactive_power<-as.numeric(as.character(data_target$Global_reactive_power))
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
plot(data_target$realtime,data_target$Global_active_power, type="l",ylab = "Global Active Power(kilowatts)",xlab="")
plot(data_target$realtime,data_target$Voltage,xlab ="datetime",ylab="Voltage",type="l")
plot(data_target$realtime,data_target$Sub_metering_1, type="l",xlab = "", ylab = "Energy sub metering")
lines(data_target$realtime,data_target$Sub_metering_2,col="blue")
lines(data_target$realtime,data_target$Sub_metering_3,col="red")
legend("topright",lty=c(1,1,1),col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(data_target$realtime,data_target$Global_reactive_power,xlab ="datetime",ylab="Global_reactive_power",type="l")
dev.copy(png,"plot4.png",width = 480, height = 480, units = "px")
dev.off()