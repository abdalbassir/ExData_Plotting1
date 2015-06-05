# Code for Plot3

# load the data
dat = read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Convert the Date to as.Date()
dat$Date = as.Date(dat$Date, "%d/%m/%Y")

# select subset of the data (dates 2007-02-01 and 2007-02-02)
date1 = as.Date("2007-02-01")
date2 = as.Date("2007-02-02")
sub_dat = subset(dat, Date == date1 | Date == date2)

# combine date with time
date_time = strptime(paste(sub_dat$Date, sub_dat$Time), format = "%Y-%m-%d %H:%M:%S")
sub_dat$Global_active_power = as.numeric(as.character(sub_dat$Global_active_power))


# Plot 4
png(filename = "Plot4.png") # default value width = 480, height = 480
sub_dat$Sub_metering_1 = as.numeric(as.character(sub_dat$Sub_metering_1))
sub_dat$Sub_metering_2 = as.numeric(as.character(sub_dat$Sub_metering_2))
sub_dat$Sub_metering_3 = as.numeric(as.character(sub_dat$Sub_metering_3))
sub_dat$Voltage = as.numeric(as.character(sub_dat$Voltage))
sub_dat$Global_reactive_power = as.numeric(as.character(sub_dat$Global_reactive_power))
par(mfrow = c(2,2))
# sub plot 1
plot(date_time, sub_dat$Global_active_power, ylab = "Global Active Power", xlab = "" , type = "l")
# sub plot 2
plot(date_time, sub_dat$Voltage,  ylab = "Voltage", type = "l")
# sub plot 3
plot(date_time, sub_dat$Sub_metering_1, ylab = "Energy sub matering", xlab = "" , type = "l", col = "black")
lines(date_time, sub_dat$Sub_metering_2, ylab = "Energy sub matering", col = "red")
lines(date_time, sub_dat$Sub_metering_3, ylab = "Energy sub matering", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
legend("topright", col = c("black", "red", "blue"), lty=c(1,1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# sub plot 4
plot(date_time, sub_dat$Global_reactive_power, ylab = "Global_reactive_power", type = "l")
dev.off()