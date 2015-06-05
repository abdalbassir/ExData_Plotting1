# Code for Plot2

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

# Here, the code to create the figure Plot2.png
png(filename = "Plot2.png") # default value width = 480, height = 480)
plot(date_time, sub_dat$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "" , type = "l")
dev.off()