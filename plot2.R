data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),
                   header=T, sep=";",na.strings = "?")
library(lubridate)
data$DateTime <- as.POSIXct(paste(data$Date, data$Time),
                            format="%d/%m/%Y %H:%M:%S")
data$Date <- dmy(data$Date)
data_reduced <- subset(data, Date == "2007-02-02" | Date == "2007-02-01" )

png(filename = "Plot2.png", width = 480, height = 480, units = "px")
with(data_reduced,plot(DateTime, Global_active_power,type = "l",
                       ylab = "Global Active Power (kilowatts)",
                       xlab=""))
dev.off()

