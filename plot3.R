data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),
                   header=T, sep=";",na.strings = "?")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time),
                            format="%d/%m/%Y %H:%M:%S")
data$Date <- dmy(data$Date)
data_reduced <- subset(data, Date == "2007-02-02" | Date == "2007-02-01" )

par(mfcol=c(1,1))
png(filename = "Plot3.png", width = 480, height = 480, units = "px")
with(data_reduced,{
    plot(DateTime,Sub_metering_1,type = "n",
         ylab = "Energy sub metering",
         xlab="")
    lines(DateTime,Sub_metering_1, col = "black")
    lines(DateTime,Sub_metering_2, col = "red")
    lines(DateTime,Sub_metering_3, col = "blue")
    legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col = c("black","red","blue"))
})
dev.off()

