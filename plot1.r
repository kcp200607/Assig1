setClass("myDate")

setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings ="?", colClasses=c('myDate', 'factor','numeric', 'numeric','numeric','numeric','numeric','numeric','numeric'))
mydate <- as.Date("2007-2-1")
mydate2 <- as.Date("2007-2-2")
subdata <- data[data$Date >= mydate & data$Date <= mydate2, ]
newDate <- paste(as.Date(subdata$Date), subdata$Time)
subdata$NewDate <- as.POSIXct(newDate)
hist(subdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
