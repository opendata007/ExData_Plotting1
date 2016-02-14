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

png(filename="plot1.png")
hist(df2$Global_active_power, col="red",xlab="Duration Active Power (KiloWatts)",main="Global Active Power" )
dev.off()
