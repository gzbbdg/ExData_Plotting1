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
png("plot2.png",width=480,height=480)                      
plot(data$Global_active_power,typ='l',cex.lab=1,xaxt="n",yaxt="n",xlab="",ylab="Global Active Power (kilowatts)")
axis(1, at=c(1,1441,2881), labels=c("Thu","Fri","Sat"), lwd=1,cex.axis=1)
axis(2,lwd = 2,cex.axis=1)
dev.off()