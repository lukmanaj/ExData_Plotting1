# Download and unzip the file
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "data.zip", method = "curl")
unzip("data.zip", exdir = "./")

# Read data
data_full <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

# Filter data
date_filter <- data_full$Date %in% c("1/2/2007", "2/2/2007")
data <- data_full[date_filter, ]

# Format date and time
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# Plot 3
with(data, {
  plot(DateTime, Sub_metering_1, type = "l",
       ylab = "Global Active Power (kilowatts)", xlab = "", cex = 0.8)
  lines(DateTime, Sub_metering_2, col = 'Red')
  lines(DateTime, Sub_metering_3, col = 'Blue')
})

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8)

# Export plot to file
dev.copy(png, file="plot3.png", height = 480, width = 480)
dev.off()
