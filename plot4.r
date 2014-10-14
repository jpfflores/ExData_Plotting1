plot4 <- function(){
png( file = "plot4.png",width=480, height=480)
data <- read.table("household_power_consumption.txt",header=TRUE, sep = ';')
data3 <- subset ( data, as.Date(data$Date,"%d/%m/%Y") >= as.Date('2007/02/01') & as.Date(data$Date,"%d/%m/%Y") < as.Date('2007/02/03') )
rm(data)

par(mfrow = c(2, 2), mar = c(4, 4, 3, 1), oma = c(0, 0, 2, 0))
with(data3,{
plot(strptime(paste(data3[,"Date"],data3[,"Time"]), format="%d/%m/%Y %H:%M:%S"),(as.numeric(data3[,"Global_active_power"])/1000),type="l", ylab= "Global Active Power (kilowatts)",xlab= "")

plot(strptime(paste(data3[,"Date"],data3[,"Time"]), format="%d/%m/%Y %H:%M:%S"), data3[,"Voltage"],type="l", ylab= "Voltage",xlab= "datetime")

plot(strptime(paste(data3[,"Date"],data3[,"Time"]), format="%d/%m/%Y %H:%M:%S"), data3[,"Sub_metering_1"] ,type="l", ylab= "Energy sub metering",xlab= "")
points(strptime(paste(data3[,"Date"],data3[,"Time"]), format="%d/%m/%Y %H:%M:%S"), data3[,"Sub_metering_2"] ,type="l", col="red")
points(strptime(paste(data3[,"Date"],data3[,"Time"]), format="%d/%m/%Y %H:%M:%S"), data3[,"Sub_metering_3"] ,type="l", col="blue")
legend("topright", pch = "-", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

plot(strptime(paste(data3[,"Date"],data3[,"Time"]), format="%d/%m/%Y %H:%M:%S"),(as.numeric(data3[,"Global_reactive_power"])/1000),type="l", ylab= "Global_reactive_power",xlab= "datetime")
}
)

dev.off()
}

