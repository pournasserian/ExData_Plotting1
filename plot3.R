column_indexes <- c(1, 2, 7, 8, 9)
output_filename <- "plot3.png"

## defining file full path 
file <- paste(getwd(), "household_power_consumption.txt", sep = "\\")

## reading file
file_handler <- file(description = file, open = "r");
raw_set <- read.table(text = grep("^[1,2]/2/2007", readLines(file_handler), value=TRUE), na.strings = c("?"),dec = ".",sep = ";", header = TRUE)

## selecting only the column which is needed to show in histogram
## and conveting factor/string columns to date-time
raw_set <- raw_set[, column_indexes]
colnames(raw_set)[1] <- "Date"
colnames(raw_set)[2] <- "Time"
raw_set$Date <- strptime(paste(raw_set[, 1], raw_set[, 2]), "%d/%m/%Y %H:%M:%S")

## deleting time column
raw_set$Time <- NULL

## removing NA values
raw_set <- raw_set[!is.na(raw_set[1]) & 
                       !is.na(raw_set[2]) & 
                       !is.na(raw_set[3]) & 
                       !is.na(raw_set[4]), ]


## preparing output PNG file
## exporting histogram as PNG file
png(filename = output_filename, width = 480, height = 480)

## rendering chart
plot(x = raw_set[, 1], y = raw_set[, 2], main = "", xlab="", ylab="Energy sub metering", type = "l")
lines(raw_set[,1], raw_set[,3], col = "red")
lines(raw_set[,1], raw_set[,4], col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_4"), col = c("black", "red", "blue"), cex = 0.8, lty = 1)
dev.off()

close(file_handler)
