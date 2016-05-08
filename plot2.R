library(dplyr)
setwd("~/rdata")
git.dir <- "~/git/ExData_Plotting1/"
a1.data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)
par(mfrow = c(1,1))

#// Subset the data //
a1.data.sub <- subset(a1.data, Date %in% c("1/2/2007","2/2/2007"))
a1.data.sub$DateTime <- strptime(paste(a1.data.sub$Date, a1.data.sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
a1.data.sub$Global_active_power <-  as.numeric(a1.data.sub$Global_active_power)

#// Plot //#
with(a1.data.sub, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

#// Save as PNG //#
dev.copy(png, paste0(git.dir, "plot2.png"))
dev.off()
