df <- read.csv('household_power_consumption.txt', sep=';')
df$Date <- as.Date(df$Date, "%d/%m/%Y")
dfx <- df[df$Date >= as.Date("2007/02/01", "%Y/%m/%d") & 
            df$Date <= as.Date("2007/02/02", "%Y/%m/%d"), ]
dfx$Global_active_power <- as.numeric(as.character(dfx$Global_active_power))
png('plot1.png', width=480, height=480)
with(dfx, hist(Global_active_power, 
               main="Global Active Power",
               xlab="Global Active Power (kilowatts)", col='red'))
dev.off()