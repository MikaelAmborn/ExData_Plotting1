library(data.table)
data <- fread("household_power_consumption.txt", sep=";", na.strings="?", colClasses="character")
data$Date <- as.Date(data$Date , "%d/%m/%Y")
subset <- data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

png(filename = "plot2.png")
Sys.setlocale("LC_TIME", "en_US")
with(subset, plot(strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"), Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()