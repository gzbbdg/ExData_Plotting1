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
png("plot3.png",width=480,height=480)
plot(data$Sub_metering_1,typ='l',cex.lab=0.9,xaxt="n",yaxt="n",xlab="",ylab="Energy sub metering")
lines(data$Sub_metering_2,type="l",col=2)
lines(data$Sub_metering_3,type="l",col=4)
axis(1, at=c(1,1441,2881), labels=c("Thu","Fri","Sat"), lwd=1,cex.axis=1)
axis(2,lwd = 2,cex.axis=0.9)
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_1"), lty=1, col=c('black', 'red', 'blue'), cex=1)
dev.off()