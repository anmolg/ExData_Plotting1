data <- read.csv("./Data/household_power_consumption.txt", 
                 header = TRUE, 
                 sep = ";", 
                 na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data <- subset(data,  (format.Date(Date, "%d/%m/%Y") == "01/02/2007") 
                    | (format.Date(Date, "%d/%m/%Y") == "02/02/2007"))

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts")
dev.off()