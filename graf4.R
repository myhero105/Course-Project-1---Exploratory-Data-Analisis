data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datos <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(datos$Date), datos$Time)
datos$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(datos, {
    plot(Global_active_power~Datetime, type="l", xlab="", ylab="Global Active Power")
    plot(Voltage~Datetime, type="l", xlab="datetime", ylab="Voltage")
    plot(Sub_metering_1 ~ Datetime, type="l", xlab="", ylab="Energy sub metering")
      lines(Sub_metering_2 ~ Datetime,col='Red')
      lines(Sub_metering_3 ~ Datetime,col='Blue')
      legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", xlab="datetime", ylab="Global_reactive_power")
  })

dev.copy(png, file="graf4.png", height=480, width=480)
dev.off()