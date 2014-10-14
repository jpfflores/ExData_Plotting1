plot3 <- function(){
png( file = "plot3.png",width=480, height=480)
data <- read.table("household_power_consumption.txt",header=TRUE, sep = ';')
data3 <- subset ( data, as.Date(data$Date,"%d/%m/%Y") >= as.Date('2007/02/01') & as.Date(data$Date,"%d/%m/%Y") < as.Date('2007/02/03') )
rm(data)

plot(strptime(paste(data3[,"Date"],data3[,"Time"]), format="%d/%m/%Y %H:%M:%S"), data3[,"Sub_metering_1"] ,type="l", ylab= "Energy sub metering",xlab= "")
points(strptime(paste(data3[,"Date"],data3[,"Time"]), format="%d/%m/%Y %H:%M:%S"), data3[,"Sub_metering_2"] ,type="l", col="red")
points(strptime(paste(data3[,"Date"],data3[,"Time"]), format="%d/%m/%Y %H:%M:%S"), data3[,"Sub_metering_3"] ,type="l", col="blue")

legend("topright", pch = "-", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.off()
}