setwd("/Users/a149174/CourseraExploratory")

# read it data and subset for 2/1/07 and 2/2/07
power_consumption_data <- read.table("data/household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F)
pd <- power_consumption_data[which(power_consumption_data[,1] == "1/2/2007" | power_consumption_data[,1] == "2/2/2007"),]

# add in new date/time field
pd$DateTime <- strptime(paste(pd$Date,pd$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# converts global_active_power to numeric
globalActivePower <- as.numeric(pd$Global_active_power)

# plot 1
png(filename = 'plot1.png', width = 480, height = 480, units = 'px')
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
