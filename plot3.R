library(dplyr)
setwd("~/rdata")
git.dir <- "~/git/ExData_Plotting1/"
a1.data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)
par(mfrow = c(1,1))

#// Subset the data //
a1.data.sub <- subset(a1.data, Date %in% c("1/2/2007","2/2/2007"))
a1.data.sub$DateTime <- strptime(paste(a1.data.sub$Date, a1.data.sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
a1.data.sub$Global_active_power <-  as.numeric(a1.data.sub$Global_active_power)
a1.data.sub$Sub_metering_1 <- as.numeric(a1.data.sub$Sub_metering_1)
a1.data.sub$Sub_metering_2 <- as.numeric(a1.data.sub$Sub_metering_2)
a1.data.sub$Sub_metering_3 <- as.numeric(a1.data.sub$Sub_metering_3)

#// Plot //#
with(a1.data.sub, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
lines(a1.data.sub$DateTime, a1.data.sub$Sub_metering_2, type="l", col="red")
lines(a1.data.sub$DateTime, a1.data.sub$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, col = c("black", "red", "blue"))

#// Save as PNG //#
dev.copy(png, paste0(git.dir, "plot3.png"))
dev.off()
