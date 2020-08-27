# Exploratory Data Analysis - Johns Hopkins University, Coursera
# Course Project 1
# Author: Khaled Mahmud


# Loading data and handling missing values.
# Dataset can be downloaded from the link mentioned in README file.
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
df <- na.omit(df)

# Subsetting data by Date according to requirement
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")

# Converting to numeric datatype
df$Global_active_power <- as.numeric(df$Global_active_power)

# creating device, construct and export graph
png(filename = "plot1.png", 480, 480)
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()