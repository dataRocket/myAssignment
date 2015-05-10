file<-"./getdata/household_power_consumption.txt"

data<-read.csv.sql(file,
                   sql="select * from file where Date= '1/2/2007' or Date='2/2/2007' ",
                   sep=";")
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
View(data$DateTime)
data