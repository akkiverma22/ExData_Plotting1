## READ THE DATASET WITH SAPERATOR AS ";" AND NA AS "?"     
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F)

## CONVERT TYPE OF DATE VARIABLE FROM CHAR TO DATE  
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## GET THE REQUIRED DATA FROM FULL DATA 
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## DELETE FULL DATA
rm(data_full)

## CREATE PLOT 1
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## COPY PLOT TO PNG FORMAT FILE WITH WIDTH = 480 AND HEIGHT = 480
dev.copy(png, file="plot1.png", height=480, width=480)

## CLOSE THE PNG DEVICE
dev.off()