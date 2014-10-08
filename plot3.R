## Reading dataset
setwd("C:/Users/ouelletva/Documents/DataAnalysis")
dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

## Subsetting the for February 1 and 2 2007
dataFeb <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataset)

## Converting dates
datetime <- paste(as.Date(dataFeb$Date), dataFeb$Time)
dataFeb$Datetime <- as.POSIXct(datetime)

## Plot 3
with(dataFeb, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", lty=1, col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file according to specification
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()