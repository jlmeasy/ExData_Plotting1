setwd("C:\temp\")

library(sqldf)
qry <- 'select * from file where "Date" = "1/2/2007" OR "Date" = "2/2/2007"'
dat <- read.csv.sql("./household_power_consumption.txt",qry,sep = ";",eol = "\n")
dat$datetime <- strptime(paste(dat$Date,dat$Time,sep = " "),"%d/%m/%Y %H:%M:%S")


png(filename = "plot1.png")
hist(dat$Global_active_power,xlab = "Global Active Power(kilowatts)",main = "Global Active Power",border = "black",col="red")
dev.off()

