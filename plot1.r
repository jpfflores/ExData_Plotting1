plot1 <- function(){
png( file = "plot1.png",width=480, height=480)
data <- read.table("household_power_consumption.txt",header=TRUE, sep = ';')
data3 <- data[which( as.Date(data$Date,"%d/%m/%Y") >= as.Date('2007/02/01') & as.Date(data$Date,"%d/%m/%Y") <= as.Date('2007/02/02') ),]
hist((as.double(data3$Global_active_power)/1000),main = "Global Active Power", col = "red", xlab= "Global Active Power (kilowatts)")

dev.off()
}