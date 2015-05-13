ousehold_power_consumption <- read.csv("../household_power_consumption.txt", sep=";", na.strings="?", colClasses = c("character","character", rep("numeric",7)))
household_power_consumption$dateTime <-with(household_power_consumption, as.POSIXlt(paste(Date, Time), format="%d/%m/%Y %H:%M:%S", tz='UTC'))
hpcSub <-household_power_consumption[household_power_consumption$dateTime >= as.POSIXlt('2007-02-01', '%Y-%m-%d', tz='UTC') & household_power_consumption$dateTime < as.POSIXlt('2007-02-03', '%Y-%m-%d', tz='UTC'),]
png(file="figure3.png",width=480,height=480)
plot(range(hpcSub$dateTime), range(c(hpcSub$Sub_metering_1,hpcSub$Sub_metering_2,hpcSub$Sub_metering_3)), type="n", ylab="Energy sub metering", xlab="")
lines(hpcSub$dateTime, hpcSub$Sub_metering_1, col = "black")
lines(hpcSub$dateTime, hpcSub$Sub_metering_2, col = "red")
lines(hpcSub$dateTime, hpcSub$Sub_metering_3, col = "blue")
legend("topright", c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=c(1,1,1),  col = c("black", "red", "blue"))

dev.off()