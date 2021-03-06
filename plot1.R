y_column_index <- 3
output_filename <- "plot1.png"

## defining file full path 
file <- paste(getwd(), "household_power_consumption.txt", sep = "\\")

## reading file
file_handler <- file(description = file, open = "r");
raw_set <- read.table(text = grep("^[1,2]/2/2007", readLines(file_handler), value=TRUE), na.strings = c("?"),dec = ".",sep = ";", header = TRUE)


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
close(file_handler)
