# Load required library
library(lubridate)

# Load the data file with path or set the working directory and load without path
epc<-read.delim("E:/EDA_COURSERA/trunk/household_power_consumption.txt",
    sep = ";",stringsAsFactors = FALSE)

# Conver the date from character to R Date format
epc$Date<-parse_date_time(epc$Date,"%d-%m-%Y")

# Create the subset for 2 dates
epcsub<-subset(epc,epc$Date==as.Date("2007-02-01") | epc$Date==as.Date("2007-02-02") )

# Convert the required values to numeric
epcsub$Global_active_power<-as.numeric(epcsub$Global_active_power)
epcsub$Global_reactive_power <-as.numeric(epcsub$Global_reactive_power)
epcsub$Sub_metering_1 <-as.numeric(epcsub$Sub_metering_1)
epcsub$Sub_metering_2 <-as.numeric(epcsub$Sub_metering_2)
epcsub$Voltage <-as.numeric(epcsub$Voltage)


# Create Plot4
png(filename = paste0(getwd(),"/plot4.png"),
    width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(epcsub$DateTime,epcsub$Global_active_power,type="l",
    ylab="Globa Active Power (kilowatts)",xlab="")
plot(epcsub$DateTime,epcsub$Voltage,,type="l",ylab="Voltage",xlab="datetime")
plot(epcsub$DateTime,epcsub$Sub_metering_1,type="l",
    ylab="Energy Sub Metering",xlab="")
lines(epcsub$DateTime,epcsub$Sub_metering_2,type="l",col="red")
lines(epcsub$DateTime,epcsub$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),
    col=c('black','red','blue'),lty=1)
plot(epcsub$DateTime,epcsub$Global_reactive_power,type="l",xlab="datetime")
dev.off()
 