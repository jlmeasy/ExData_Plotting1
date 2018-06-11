setwd("C:\temp\")

library(sqldf)
qry <- 'select * from file where "Date" = "1/2/2007" OR "Date" = "2/2/2007"'
dat <- read.csv.sql("./household_power_consumption.txt",qry,sep = ";",eol = "\n")
dat$datetime <- strptime(paste(dat$Date,dat$Time,sep = " "),"%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png")
with(dat,plot(dat$datetime,dat$Sub_metering_1,type="n"),ylab="Energy sub metering")
with(subset(dat), {
points(dat$datetime,dat$Sub_metering_1,type = "l",col="black")
points(dat$datetime,dat$Sub_metering_2,type = "l",col="red")
points(dat$datetime,dat$Sub_metering_3,type = "l",col="blue")})
legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()


