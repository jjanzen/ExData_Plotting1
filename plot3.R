setwd("/Users/a149174/CourseraExploratory")

# read it data and subset for 2/1/07 and 2/2/07
power_consumption_data <- read.table("data/household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F)
pd <- power_consumption_data[which(power_consumption_data[,1] == "1/2/2007" | power_consumption_data[,1] == "2/2/2007"),]

# add in new date/time field
pd$DateTime <- strptime(paste(pd$Date,pd$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# plot 3
png(filename = 'plot3.png', width = 480, height = 480, units = 'px')
plot(pd$DateTime, pd$Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering", main ="")
lines(pd$DateTime, pd$Sub_metering_2, col = "red")
lines(pd$DateTime, pd$Sub_metering_3, col = "blue")
legend("topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"))
dev.off()
