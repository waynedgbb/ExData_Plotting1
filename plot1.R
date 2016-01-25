# quesiton 1
data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
str(data)
data$Date <- strptime(data$Date, "%d/%m/%Y")
data_target<-data[which(data$Date>="2007-02-01" & data$Date <= "2007-02-02"),]
sum(is.na(data_target))
str(data_target)
par(mfrow = c(1, 1), mar = c(4, 4, 2, 1))
data_target$Global_active_power<-as.numeric(as.character(data_target$Global_active_power))
hist(data_target$Global_active_power, col="red",xlab = "Global Active Power(kilowatts)",main="Global Active Power")
dev.copy(png,"plot1.png",width = 480, height = 480, units = "px")
dev.off()