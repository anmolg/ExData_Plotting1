data <- read.csv("./Data/household_power_consumption.txt", 
                 header = TRUE, 
                 sep = ";", 
                 na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data <- subset(data,  (format.Date(Date, "%d/%m/%Y") == "01/02/2007") 
               | (format.Date(Date, "%d/%m/%Y") == "02/02/2007"))

data$Date <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")


png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(data$Date, 
     data$Global_active_power, 
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "l")


dev.off()