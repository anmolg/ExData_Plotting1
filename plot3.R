data <- read.csv("./Data/household_power_consumption.txt", 
                 header = TRUE, 
                 sep = ";", 
                 na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data <- subset(data,  (format.Date(Date, "%d/%m/%Y") == "01/02/2007") 
               | (format.Date(Date, "%d/%m/%Y") == "02/02/2007"))

data$Date <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")


png(filename = "plot3.png", width = 480, height = 480, units = "px")

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
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()