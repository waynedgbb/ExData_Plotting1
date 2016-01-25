#question 3
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
plot(data_target$realtime,data_target$Sub_metering_1, type="l",xlab = "", ylab = "Energy sub metering")
lines(data_target$realtime,data_target$Sub_metering_2,col="blue")
lines(data_target$realtime,data_target$Sub_metering_3,col="red")
legend("topright",lty=c(1,1,1),col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,"plot3.png",width = 480, height = 480, units = "px")
dev.off()