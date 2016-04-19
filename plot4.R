#read data
data <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", sep=';', skip = 66636, nrows = 2880)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

dev.copy(png, "plot4.png", width=480, height=480)

par(mfrow=c(2,2))

#plot 1
plot(data$datetime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

#plot 2
plot(data$datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#plot 3
plot(data$datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = c(1, 1, 1), bty = "n")

#plot 4
plot(data$datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power")
dev.off()