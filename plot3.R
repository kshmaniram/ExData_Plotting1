# Load File reader
source("readFile.R");

# Read the file
df <- readFile();

# Plot the line graph
dateTime <- strptime(paste(df$Date, df$Time),"%d/%m/%Y %H:%M:%S");

# Filter NA values
subMeter_1 <- as.numeric(as.character(df$Sub_metering_1[!is.na(df$Sub_metering_1)]));
subMeter_2 <- as.numeric(as.character(df$Sub_metering_2[!is.na(df$Sub_metering_2)]));
subMeter_3 <- as.numeric(as.character(df$Sub_metering_3[!is.na(df$Sub_metering_3)]));

png(file="plot3.png", width=480, height=480)
plot(dateTime,as.numeric(as.character(df$Sub_metering_1)),      
     pch=NA,     
     xlab="", 
     ylab="Energy sub metering");
# Plot sub metering 1
lines(dateTime, subMeter_1,col="black");
# Plot sub metering 2
lines(dateTime, subMeter_2,col="red");
# Plot sub metering 3
lines(dateTime, subMeter_3,col="blue");
legend("topright",lty = c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"));    

# Close device
dev.off();