setwd("C:/Users/qrajkum/Documents/RK/Training/Coursera/4-Exploratory Data Analysis/Assignment")

library(sqldf)

Sys.setlocale(locale = "USA")


df1 <- read.csv.sql("household_power_consumption.txt", sql = "select * from file", header = TRUE, sep = ";", nrows=2)

df2 <- df1[df1$Date %in% c("1/2/2007","2/2/2007"),]

df2$Date <- as.Date(df2$Date , format="%d/%m/%Y")



## read in date/time info in format 'm/d/y h:m:s'
df2$timestamp <- paste(df2$Date, df2$Time)

df2$timestamp <- strptime(df2$Date, format="%a")

strptime(as.Date("2007-02-01 00:00:00"),format="%A",tz="")

x <- df2$timestamp
y1 <- df2$Sub_metering_1
y2 <- df2$Sub_metering_2
y3 <- df2$Sub_metering_3


png(filename="plot3.png")

par(mfrow=c(1,1))
plot(y1, type="l",xaxt="n",ylab="Energy sub metering")
lines(y2,col="red")
lines(y3,col="blue")
axis(1,at=1,c("Thu"))
axis(1,at=1440,c("Fri"))
axis(1,at=2880,c("Sat"))


dev.off()
