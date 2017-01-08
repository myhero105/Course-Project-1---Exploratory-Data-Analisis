data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datos <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(datos$Date), datos$Time)
datos$Datetime <- as.POSIXct(datetime)

with(datos, {
    plot(Sub_metering_1 ~ Datetime, type="l",xlab="", ylab="Global Active Power (kilowatts)", lty=1, lwd=2)
    lines(Sub_metering_2 ~ Datetime,col='Red')
    lines(Sub_metering_3 ~ Datetime,col='Blue')
  })
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="graf3.png", height=480, width=480)
dev.off()