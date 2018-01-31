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

# Create Plot1
hist(epcsub$Global_active_power,col="red",
    xlab = "Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,paste0(getwd(),"/plot1.png"))
dev.off()

# Create Plot2
# Create a combined date and time column
epcsub$DateTime <-as.POSIXct(paste(epcsub$Date, epcsub$Time),
    format="%Y-%m-%d %H:%M:%S")
plot(epcsub$DateTime,epcsub$Global_active_power,type="l",
    ylab="Globa Active Power (kilowatts)",xlab="")
dev.copy(png,paste0(getwd(),"/plot2.png"))
dev.off()

# Create Plot3
plot(epcsub$DateTime,epcsub$Sub_metering_1,type="l",
    ylab="Energy Sub Metering",xlab="",ylim = c(0,30))
par(new=T)
plot(epcsub$DateTime,epcsub$Sub_metering_2,type="l",col="red",
    ylab="Energy Sub Metering",xlab="",ylim = c(0,30))
par(new=T)
plot(epcsub$DateTime,epcsub$Sub_metering_3,type="l",col="blue",
    ylab="Energy Sub Metering",xlab="",ylim = c(0,30))
legend("topright",c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),
    col=c('black','red','blue'),lty=1)
dev.copy(png,paste0(getwd(),"/plot3.png"))
dev.off()
par(new=F)

# Create Plot4
par(mfrow=c(2,2))
plot(epcsub$DateTime,epcsub$Global_active_power,type="l",
    ylab="Globa Active Power (kilowatts)",xlab="")
plot(epcsub$DateTime,epcsub$voltage,type="l",ylab="Voltage",xlab="DateTime")
plot(epcsub$DateTime,epcsub$Sub_metering_1,type="l",
    ylab="Energy Sub Metering",xlab="",ylim = c(0,30))
par(new=T)
plot(epcsub$DateTime,epcsub$Sub_metering_2,type="l",col="red",
    ylab="Energy Sub Metering",xlab="",ylim = c(0,30))
par(new=T)
plot(epcsub$DateTime,epcsub$Sub_metering_3,type="l",col="blue",
    ylab="Energy Sub Metering",xlab="",ylim = c(0,30))
legend("topright",c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),
    col=c('black','red','blue'),lty=1)
par(new=F)
plot(epcsub$DateTime,epcsub$Global_reactive_power,type="l",xlab="DateTime")
dev.copy(png,paste0(getwd(),"/plot4.png"))
dev.off()
 