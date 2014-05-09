# Load File reader
source("readFile.R");

# Read the file
df <- readFile();

# PNG graphic Device
png("plot4.png", height=480, width=480)

# Plot 2*2 matrix for plotting
par(mfrow=c(2,2))
dateTime <- strptime(paste(df$Date, df$Time),"%d/%m/%Y %H:%M:%S");

# Filter NA values
subMeter_1 <- as.numeric(as.character(df$Sub_metering_1[!is.na(df$Sub_metering_1)]));
subMeter_2 <- as.numeric(as.character(df$Sub_metering_2[!is.na(df$Sub_metering_2)]));
subMeter_3 <- as.numeric(as.character(df$Sub_metering_3[!is.na(df$Sub_metering_3)]));
Global_active_power <- as.numeric(as.character(df$Global_active_power[!is.na(df$Global_active_power)]));
Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power[!is.na(df$Global_reactive_power)]));
Voltage <- as.numeric(as.character(df$Voltage[!is.na(df$Voltage)]));

# Global Active Power plot
plot(dateTime, 
     Global_active_power, 
     pch=NA, 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(dateTime, Global_active_power)

# Voltage plot
plot(dateTime, Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(dateTime, Voltage)

# Submetering plot
plot(dateTime, 
     subMeter_1, 
     pch=NA, 
     xlab="", 
     ylab="Energy sub metering")
lines(dateTime, subMeter_1, col="black")
lines(dateTime, subMeter_2, col="red")
lines(dateTime, subMeter_3, col="blue")
legend('topright', 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c("black", "red", "blue"))

# Global reactive power plot
with(df, plot(dateTime, Global_reactive_power, xlab='datetime',ylab="Global_reactive_power",pch=NA))
with(df, lines(dateTime, Global_reactive_power))

# Close device
dev.off()