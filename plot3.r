setClass("myDate")

setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings ="?", colClasses=c('myDate', 'factor','numeric', 'numeric','numeric','numeric','numeric','numeric','numeric'))
mydate <- as.Date("2007-2-1")
mydate2 <- as.Date("2007-2-2")
subdata <- data[data$Date >= mydate & data$Date <= mydate2, ]
newDate <- paste(as.Date(subdata$Date), subdata$Time)
subdata$NewDate <- as.POSIXct(newDate)

plot(subdata$Sub_metering_1~subdata$NewDate, type="l", ylab="Global Active Power(kilowatts)", xlab="")
lines(subdata$Sub_metering_2~subdata$NewDate, col="Red")
lines(subdata$Sub_metering_3~subdata$NewDate, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1)
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()