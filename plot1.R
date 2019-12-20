data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),
                   header=T, sep=";",na.strings = "?")
library(lubridate)
data$Date <- dmy(data$Date)
data_reduced <- subset(data, Date == "2007-02-02" | Date == "2007-02-01" )
png(filename = "Plot1.png", width = 480, height = 480, units = "px")
with(data_reduced,hist(Global_active_power,
                       main = "Global Active Power",
                       xlab = "Global Active Power (kilowatts)",
                       col = "red"))
dev.off()
