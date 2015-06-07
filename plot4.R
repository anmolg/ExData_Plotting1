data <- read.csv("./Data/household_power_consumption.txt", 
                 header = TRUE, 
                 sep = ";", 
                 na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data <- subset(data,  (format.Date(Date, "%d/%m/%Y") == "01/02/2007") 
               | (format.Date(Date, "%d/%m/%Y") == "02/02/2007"))

data$Date <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,2))
#Graph 1


plot(data$Date, 
     data$Global_active_power, 
     ylab = "Global Active Power",
     xlab = "",
     type = "l")

#Graph 2

plot(data$Date, 
     data$Voltage, 
     ylab = "Voltage",
     xlab = "datetime",
     type = "l")

#Graph 3

plot(data$Date, 
     data$Sub_metering_1,
     ylab = "Energy sub metering",
     xlab = "",
     type = "S")

lines(data$Date, 
      data$Sub_metering_2,
      col = "red")

lines(data$Date, 
      data$Sub_metering_3,
      col = "blue")

legend("topright",
       lty = c(1,1),
       lwd = c(2,2),
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

#Graph 4
plot(data$Date, 
     data$Global_reactive_power, 
     ylab = "Global_reactive_power",
     xlab = "datetime",
     type = "l")

dev.off()