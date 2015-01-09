library(data.table)
data <- fread("household_power_consumption.txt", sep=";", na.strings="?", colClasses="character")
data$Date <- as.Date(data$Date , "%d/%m/%Y")
subset <- data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

png(filename = "plot3.png")
Sys.setlocale("LC_TIME", "en_US")
with(subset, plot(strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"), Sub_metering_1, ylab="Energy sub metering", xlab="", type="n"))
with(subset, lines(strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"), Sub_metering_1, col="black"))
with(subset, lines(strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"), Sub_metering_2, col="red"))
with(subset, lines(strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"), Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()