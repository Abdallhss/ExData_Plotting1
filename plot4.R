data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),
                   header=T, sep=";",na.strings = "?")
library(lubridate)
data$DateTime <- as.POSIXct(paste(data$Date, data$Time),
                            format="%d/%m/%Y %H:%M:%S")
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
data_reduced <- subset(data, Date == "2007-02-02" | Date == "2007-02-01" )

png(filename = "Plot4.png", width = 480, height = 480, units = "px")
par(mfcol=c(2,2))

with(data_reduced,{
    #1
    plot(DateTime, Global_active_power,type = "l",
                       ylab = "Global Active Power",
                       xlab="")
    #2
    plot(DateTime,Sub_metering_1,type = "n",
                       ylab = "Energy sub metering",
                       xlab="")
    lines(DateTime,Sub_metering_1, col = "black")
    lines(DateTime,Sub_metering_2, col = "red")
    lines(DateTime,Sub_metering_3, col = "blue")
    legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col = c("black","red","blue"))
    #3
    plot(DateTime, Voltage,type = "l",
                       ylab = "Voltage",
                       xlab="datetime")
    #4
    plot(DateTime, Global_reactive_power,type = "l",
                       ylab = "Global_reactive_power",
                       xlab="datetime")
     })
dev.off()

