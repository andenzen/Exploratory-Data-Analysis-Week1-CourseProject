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


# Create Plot2, 'a line diagram' and save it to .png file
png("plot2.png", width = 480, height =  480)
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()