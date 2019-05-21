# Exploratory Data Analysis Week 1 Course Project
# Author: Antti Merisalo
# Date 2019-5-20

## PLEASE NOTE THAT IN ORDER FOR THIS CODE TO WORK YOU HAVE TO HAVE THE REQUIRED DATASET "household_power_consumption.txt" already in your working directory!

# Load in the required libraries for data manipulation
library(lubridate)
library(dplyr)

# Read in the data and assign variable names.
# Obs! This only includes the required rows for the dates 2007-02-01 and 2007-02-02.
data <- read.table("household_power_consumption.txt", skip = 66637, nrows = 2880, sep = ";", na.strings = "?")
colnames(data) <- unlist(read.table("household_power_consumption.txt", nrows = 1, sep = ";"))

# Unify Date and Time separators
data$Time <- gsub(":", "/", data$Time)

# Create 'DateTime' column for time series graphs
data$DateTime <- dmy_hms(paste(data$Date, data$Time))


#Create Plot4, 'combined diagram of four' and save it to .png file
png("plot4.png", width = 480, height =  480)
par(mfcol = c(2,2))

plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

plot(data$DateTime, data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

plot(data$DateTime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(data$DateTime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()