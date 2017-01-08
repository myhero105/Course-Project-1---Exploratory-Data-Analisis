data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datos <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

hist(as.numeric(datos$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="graf1.png", height=480, width=480)
dev.off()