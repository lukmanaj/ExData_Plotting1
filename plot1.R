# Download and unzip the file
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "data.zip", method = "curl")
unzip("data.zip", exdir = "./")

# Read data
data_full <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

# Filter data
date_filter <- data_full$Date %in% c("1/2/2007", "2/2/2007")
data <- data_full[date_filter, ]

# Plot 1
hist(data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "Red",
     cex.sub = 0.8)

# Export plot to file
png("plot1.png", height = 480, width = 480)
hist(data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "Red",
     cex.sub = 0.8)
dev.off()
