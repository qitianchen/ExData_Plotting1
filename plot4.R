df <- read.csv('household_power_consumption.txt', sep=';')
df$Date <- as.Date(df$Date, "%d/%m/%Y")
dfx <- df[df$Date >= as.Date("2007/02/01", "%Y/%m/%d") & 
            df$Date <= as.Date("2007/02/02", "%Y/%m/%d"), ]
dfx$Sub_metering_1 <- as.numeric(as.character(dfx$Sub_metering_1))
dfx$Sub_metering_2 <- as.numeric(as.character(dfx$Sub_metering_2))
dfx$Sub_metering_3 <- as.numeric(as.character(dfx$Sub_metering_3))
dfx$Date <- as.character(dfx$Date)
dfx$dt <- as.POSIXlt(paste(dfx$Date, dfx$Time))

png('plot4.png', width=480, height=480)
with(dfx, {
  par(mfrow=c(2,2))
  plot(dt, Global_active_power, 'l',
       xlab="", ylab="Global Active Power")
  plot(dt, Voltage, 'l',
       xlab="", ylab="Voltage")
  plot(dt, Sub_metering_1, 'l', xlab="",
       ylab="Energy sub metering")
  lines(dt, Sub_metering_2, col='red')
  lines(dt, Sub_metering_3, col='blue')
  legend('topright', box.lwd=0, lty=1, col=c('black', 'red', 'blue'),
         legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
  plot(dt, Global_reactive_power, 'l',
       xlab="datetime")
})
dev.off()