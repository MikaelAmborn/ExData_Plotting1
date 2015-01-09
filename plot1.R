zipfilename <- "household_power_consumption.zip"
filename <- "household_power_consumption.txt"
if(!file.exists(zipfilename)) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                zipfilename, method="curl")  
}
if(!file.exists(filename)) {
  unzip(zipfilename)
}

library(data.table)
data <- fread(filename, sep=";", na.strings="?", colClasses="character")
data$Date <- as.Date(data$Date , "%d/%m/%Y")
subset <- data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

png(filename = "plot1.png")
hist(as.numeric(subset$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()