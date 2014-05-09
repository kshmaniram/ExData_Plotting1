# Load File reader
source("readFile.R");

# Read from the file
df <- readFile();

# Plot the histogram
colnInNumber <-as.numeric(as.character(df$"Global_active_power"))
png(file="plot1.png", width=480, height=480)
hist(colnInNumber[!is.na(colnInNumber)],main="Global Active Power",xlab="Global Active Power(kilowatts)",col="red");
dev.off();

