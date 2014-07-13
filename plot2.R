df <- read.csv('household_power_consumption.txt', sep=';')
df$Date <- as.Date(df$Date, "%d/%m/%Y")
dfx <- df[df$Date >= as.Date("2007/02/01", "%Y/%m/%d") & 
            df$Date <= as.Date("2007/02/02", "%Y/%m/%d"), ]
dfx$Global_active_power <- as.numeric(as.character(dfx$Global_active_power))
dfx$Date <- as.character(dfx$Date)
dfx$dt <- as.POSIXlt(paste(dfx$Date, dfx$Time))

png('plot2.png', width=480, height=480)
with(dfx, plot(dt, Global_active_power, 'l',
               main="Global Active Power", xlab="",
               ylab="Global Active Power (kilowatts)"))
dev.off()