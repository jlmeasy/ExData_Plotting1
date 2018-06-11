setwd("C:\temp\")

library(sqldf)
qry <- 'select * from file where "Date" = "1/2/2007" OR "Date" = "2/2/2007"'
dat <- read.csv.sql("./household_power_consumption.txt",qry,sep = ";",eol = "\n")
dat$datetime <- strptime(paste(dat$Date,dat$Time,sep = " "),"%d/%m/%Y %H:%M:%S")

png(filename="plot4.png")
par(mfrow=c(2,2), mar=c(4,4,2,1), oma = c(0,0,2,0))
hist(dat$Global_active_power,xlab = "Global Active Power(kilowatts)",main = "Global Active Power",border = "black",col="red")
with(dat,plot(dat$datetime,dat$Sub_metering_1,type="n",ylab="Energy sub metering"))
with(subset(dat), {
points(dat$datetime,dat$Sub_metering_1,type = "l",col="black")
points(dat$datetime,dat$Sub_metering_2,type = "l",col="red")
points(dat$datetime,dat$Sub_metering_3,type = "l",col="blue")})
legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(dat,plot(dat$datetime,dat$Voltage,type="l",ylab="Voltage"))
with(dat,plot(dat$datetime,dat$Global_reactive_power,type="l",ylab="Global_reactive_power"))
dev.off()