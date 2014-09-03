y_column_index <- 3
output_filename <- "plot1.png"

## defining file full path 
file <- paste(getwd(), "household_power_consumption.txt", sep = "\\")

## reading file
raw_set <- read.csv2(file, na.strings = c("?"),dec = ".")

## filtering by particular dates
raw_set <- raw_set[raw_set$Date == "1/2/2007" | raw_set$Date == "2/2/2007", ]

## selecting only the column which is needed to show in histogram
raw_set <- as.numeric(raw_set[, y_column_index])

## removing NA values
raw_set <- raw_set[!is.na(raw_set)]

## preparing output PNG file
## exporting histogram as PNG file
png(filename = output_filename, width = 480, height = 480)

## rendering histogram
hist(raw_set, col = "red", breaks = 12, 
     main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency")

dev.off()
