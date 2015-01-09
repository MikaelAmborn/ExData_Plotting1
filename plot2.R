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

png(filename = "plot2.png")
Sys.setlocale("LC_TIME", "en_US")
with(subset, plot(strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"), Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()