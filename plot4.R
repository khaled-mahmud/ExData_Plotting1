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

## concatenate, format Date and Time column
df$Date_Time <- paste(df$Date, df$Time)
df$Date_Time <- strptime(df$Date_Time, format = "%Y-%m-%d %H:%M:%S")

# creating device
png(filename = "plot4.png", 480, 480)

# Setting up plotting canvas by (2 row x 2 column)
par(mfrow = c(2, 2))

# Creating 4 plots graph
with(df, {
  
  # Plotting (1 row x 1 column)
  plot(Date_Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  
  # Plotting (1 row x 2 column)
  plot(Date_Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  
  # Plotting (2 row x 1 column)
  plot(Date_Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(Date_Time, Sub_metering_2, col="red")
  lines(Date_Time, Sub_metering_3, col="blue")
  legend("topright", bty = "n", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  
  # Plotting (2 row x 2 column)
  plot(Date_Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

dev.off()