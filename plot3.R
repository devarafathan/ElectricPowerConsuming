library(dplyr)
library(tidyverse)
## Read the data
getwd()
data <- read.table('E:/BELAJAR CODING/R/COURSERA/ElectricPowerConsuming/household_power_consumption.txt',header = TRUE, sep =";")
data1 <- data %>% filter(Date %in% c('1/2/2007', '2/2/2007'))
paste_date_time <- paste(data1$Date, data1$Time)
data1$Date_Time <- strptime(paste_date_time,'%d/%m/%Y %H:%M:%S')
data1$Date <- as.Date(data1$Date, '%d/%m/%Y')


data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))
data1$Global_reactive_power <- as.numeric(as.character(data1$Global_reactive_power))
data1$Voltage <- as.numeric(as.character(data1$Voltage))
data1$Global_intensity <- as.numeric(as.character(data1$Global_intensity))
data1$Sub_metering_1 <- as.numeric(as.character(data1$Sub_metering_1))
data1$Sub_metering_2 <- as.numeric(as.character(data1$Sub_metering_2))
str(data1)


##plot the graph

png(filename="plot3.png", width=480, height=480, units="px")
plot(data1$Date_Time, data1$Sub_metering_1, type='l', xlab="", ylab='Energy Sub Metering')
points(data1$Date_Time, data1$Sub_metering_2, type='l', col='red')
points(data1$Date_Time, data1$Sub_metering_3, type='l', col='blue')
legend('topright', legend= c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1)
dev.off()

