# Read file and build DF
filepath = "Documents/datascience_spercialization/exploratory_data_analysis/ExData_Plotting1/household_power_consumption_short.txt"
df <- read.table(file = filepath, sep = ";", na.strings = "?")
names(df) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
datetime = strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
df$datetime <- datetime
df$Date <- as.Date(df$Date)

# Plot 2
plot(df$datetime, df$Global_active_power, xlab = "", ylab = "Globle Active Power (kilowatts)", type = "l")
