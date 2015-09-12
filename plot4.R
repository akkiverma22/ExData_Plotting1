## READ THE DATASET WITH SAPERATOR AS ";" AND NA AS "?"     
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F)

## CONVERT TYPE OF DATE VARIABLE FROM CHAR TO DATE  
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## GET THE REQUIRED DATA FROM FULL DATA 
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## DELETE FULL DATA
rm(data_full)

## CREATING DATETIME VARIABLE 
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## CREATE PLOT 4
with(data, { plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
             plot(Voltage~Datetime, type="l",  ylab="Voltage", xlab="datetime")
             plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
             lines(Sub_metering_2~Datetime,col='Red')
             lines(Sub_metering_3~Datetime,col='Blue')
             legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.4)
             plot(Global_reactive_power~Datetime, type="l", ylab="Global_rective_power",xlab="datetime")
})

## COPY PLOT TO PNG FORMAT FILE WITH WIDTH = 480 AND HEIGHT = 480
dev.copy(png, file="plot4.png", height=480, width=480)

## CLOSE THE PNG DEVICE
dev.off()