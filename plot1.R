library(dplyr)
setwd("~/rdata")
git.dir <- "~/git/ExData_Plotting1/"
par(mfrow = c(1, 1)) 

a1.data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)

a1.data$Date <- as.Date(a1.data$Date, "%d/%m/%Y")
a1.data <- a1.data %>% filter(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

a1.data$DateTime <- strptime(paste(a1.data$Date,a1.data$Time), "%Y-%m-%d %S:%M:%S")
a1.data$Global_active_power <-  as.numeric(a1.data$Global_active_power)

hist(a1.data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, paste0(git.dir,"plot1.png"))
dev.off()
