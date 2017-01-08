data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datos <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(datos$Date), datos$Time)
datos$Datetime <- as.POSIXct(datetime)

plot(datos$Global_active_power ~ datos$Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="graf2.png", height=480, width=480)
dev.off()