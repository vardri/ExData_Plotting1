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

## Plot 2
## Saving to file according to specification
plot(dataFeb$Global_active_power~dataFeb$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()