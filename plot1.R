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
png("plot1.png",width=480,height=480)
hist(as.numeric(data$Global_active_power),freq = TRUE, col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power",cex.lab=0.9,cex.main=1)
dev.off()