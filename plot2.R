#question 2
data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
str(data)
data$Date <- strptime(data$Date, "%d/%m/%Y")
data_target<-data[which(data$Date>="2007-02-01" & data$Date <= "2007-02-02"),]
sum(is.na(data_target))
str(data_target)
data_target$Global_active_power<-as.numeric(as.character(data_target$Global_active_power))


data_target$realtime <-strptime(paste(data_target$Date,data_target$Time,sep=" "),format ="%Y-%m-%d %H:%M:%S")
str(data_target)
data_target$weekday <- weekdays(data_target$Date)

plot(data_target$realtime,data_target$Global_active_power, type="l",ylab = "Global Active Power(kilowatts)",xlab="")
dev.copy(png,"plot2.png",width = 480, height = 480, units = "px")
dev.off()