#load library
library(data.table)
library(dplyr)

#download file
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(url,temp)
data<-fread(unzip(temp,"household_power_consumption.txt"))

#convert to Date
data$Date<-as.Date(data$Date,"%d/%m/%Y")

#filter Dates
data<-filter(data,Date>="2007-02-01" & Date<="2007-02-02")

#create and save plot
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))

plot(data$Global_active_power,typ='l',cex.lab=1,xaxt="n",yaxt="n",xlab="",ylab="Global Active Power")
axis(1, at=c(1,1441,2881), labels=c("Thu","Fri","Sat"), lwd=2,lwd.tick=1,cex.axis=1)
axis(2,lwd = 2,cex.axis=1,lwd.tick=1)

plot(data$Voltage,typ='l',cex.lab=1,xaxt="n",yaxt="n",xlab="datetime",ylab="Voltage")
axis(1, at=c(1,1441,2881), labels=c("Thu","Fri","Sat"), lwd=2,lwd.tick=1,cex.axis=1)
axis(2,lwd = 2,cex.axis=1,lwd.tick=1)

plot(data$Sub_metering_1,typ='l',cex.lab=0.9,xaxt="n",yaxt="n",xlab="",ylab="Energy sub metering")
lines(data$Sub_metering_2,type="l",col=2)
lines(data$Sub_metering_3,type="l",col=4)
axis(1, at=c(1,1441,2881), labels=c("Thu","Fri","Sat"), lwd=2,lwd.tick=1,cex.axis=1)
axis(2,lwd = 2,cex.axis=1,lwd.tick=1)
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_1"), lty=1, col=c('black', 'red', 'blue'), cex=1,bty = "n")

plot(data$Global_reactive_power,typ='l',cex.lab=1,xaxt="n",yaxt="n",xlab="datetime",ylab="Global_reactive_power",lwd=1)
axis(1, at=c(1,1441,2881), labels=c("Thu","Fri","Sat"), lwd=2,lwd.tick=1,cex.axis=1)
axis(2,lwd = 2,cex.axis=1,lwd.tick=1)
dev.off()