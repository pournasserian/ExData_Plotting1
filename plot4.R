output_filename <- "plot4.png"

## defining file full path 
file <- paste(getwd(), "household_power_consumption.txt", sep = "\\")

## reading file
raw_set <- read.csv2(file, na.strings = c("?"),dec = ".")

## filtering by particular dates
raw_set <- raw_set[raw_set$Date == "1/2/2007" | raw_set$Date == "2/2/2007", ]

## selecting only the column which is needed to show in histogram
## and conveting factor/string columns to date-time
raw_set$Date <- strptime(paste(raw_set[, 1], raw_set[, 2]), "%d/%m/%Y %H:%M:%S")

## preparing output PNG file
## exporting histogram as PNG file
png(filename = output_filename, width = 480, height = 480)

## rendering chart
par(mfrow=c(2,2))
plot(x = raw_set[, 1], y = raw_set[, 3], main = "", xlab="", ylab="Global Active Power", type = "l")
plot(x = raw_set[, 1], y = raw_set[, 5], main = "", xlab="datetime", ylab="Voltage", type = "l")
plot(x = raw_set[, 1], y = raw_set[, 7], main = "", xlab="", ylab="Energy sub metering", type = "l")
lines(raw_set[,1], raw_set[,8], col = "red")
lines(raw_set[,1], raw_set[,9], col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_4"), col = c("black", "red", "blue"), cex = 0.8, lty = 1, bty = "n")
plot(x = raw_set[, 1], y = raw_set[, 4], main = "", xlab="datetime", ylab="Global_reactive_power", type = "l")

dev.off()
