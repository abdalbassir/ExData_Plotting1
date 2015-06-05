# Code for Plot1

# load the data
dat = read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Convert the Date to as.Date()
dat$Date = as.Date(dat$Date, "%d/%m/%Y")

# select subset of the data (dates 2007-02-01 and 2007-02-02)
date1 = as.Date("2007-02-01")
date2 = as.Date("2007-02-02")
sub_dat = subset(dat, Date == date1 | Date == date2)

# histogram of Global_active_power
png(filename = "Plot1.png") # default value width = 480, height = 480)
hist(as.numeric(as.character(sub_dat$Global_active_power)), xlab = "Global active power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()
