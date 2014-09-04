column_indexes <- c(1, 2, 3)
output_filename <- "plot2.png"

## defining file full path 
file <- paste(getwd(), "household_power_consumption.txt", sep = "\\")

## reading file
file_handler <- file(description = file, open = "r");
raw_set <- read.table(text = grep("^[1,2]/2/2007", readLines(file_handler), value=TRUE), na.strings = c("?"),dec = ".",sep = ";", header = TRUE)

## selecting only the column which is needed to show in histogram
## and conveting factor/string columns to date-time
raw_set <- raw_set[, column_indexes]
colnames(raw_set) <- c("Date", "Time", "GAP")
raw_set$Date <- strptime(paste(raw_set[, 1], raw_set[, 2]), "%d/%m/%Y %H:%M:%S")

## deleting time column
raw_set$Time <- NULL

## removing NA values
raw_set <- raw_set[!is.na(raw_set[1]) & !is.na(raw_set[2]), ]

## preparing output PNG file
## exporting histogram as PNG file
png(filename = output_filename, width = 480, height = 480)

## rendering chart
plot(raw_set, main = "", xlab="", ylab="Global Active Power (kilowatts)", type = "l")

dev.off()
close(file_handler)
