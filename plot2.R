# Load File reader
source("readFile.R");

# Read the file
df <- readFile();

# Plot the line graph
dateTime <- strptime(paste(df$Date, df$Time),"%d/%m/%Y %H:%M:%S");
png(file="plot2.png", width=480, height=480)
colnInNumber <-as.numeric(as.character(df$Global_active_power[!is.na(df$Global_active_power)]));

plot(dateTime, 
     colnInNumber, 
     pch=NA, 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(dateTime, colnInNumber);

# Close the graphic device
dev.off();