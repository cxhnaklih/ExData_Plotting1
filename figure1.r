household_power_consumption <- read.csv("../household_power_consumption.txt", sep=";", na.strings="?", colClasses = c("character","character", rep("numeric",7)))
household_power_consumption$dateTime <-with(household_power_consumption, as.POSIXlt(paste(Date, Time), format="%d/%m/%Y %H:%M:%S", tz='UTC'))
hpcSub <-household_power_consumption[household_power_consumption$dateTime >= as.POSIXlt('2007-02-01', '%Y-%m-%d', tz='UTC') & household_power_consumption$dateTime < as.POSIXlt('2007-02-03', '%Y-%m-%d', tz='UTC'),]
png(file="figure1.png",width=480,height=480)

hist(hpcSub$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()