# Read file and build DF
filepath = "Documents/datascience_spercialization/exploratory_data_analysis/ExData_Plotting1/household_power_consumption_short.txt"
df <- read.table(file = filepath, sep = ";", na.strings = "?")
names(df) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
datetime = strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
df$datetime <- datetime
df$Date <- as.Date(df$Date)


# Plot 4
par(mfrow=c(2,2))

plot(df$datetime, df$Global_active_power, xlab = "", ylab = "Globle Active Power (kilowatts)", type = "l")

plot(df$datetime, df$Voltage, xlab ="datetime",ylab = "Voltage", type = "l")


plot(df$datetime, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(df$datetime, df$Sub_metering_2, col = "red")
lines(df$datetime, df$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), cex=0.6)

plot(df$datetime, df$Global_reactive_power, xlab = "datetime", ylab = "Globle Reactive Power", type = "l")

