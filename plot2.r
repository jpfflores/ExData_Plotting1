plot2 <- function(){
png( file = "plot2.png",width=480, height=480)
data <- read.table("household_power_consumption.txt",header=TRUE, sep = ';')
data3 <- subset ( data, as.Date(data$Date,"%d/%m/%Y") >= as.Date('2007/02/01') & as.Date(data$Date,"%d/%m/%Y") < as.Date('2007/02/03') )
rm(data)

plot(strptime(paste(data3[,"Date"],data3[,"Time"]), format="%d/%m/%Y %H:%M:%S"),(as.numeric(data3[,"Global_active_power"])/1000),type="l", ylab= "Global Active Power (kilowatts)",xlab= "")

dev.off()
}