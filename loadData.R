file<-"./getdata/household_power_consumption.txt"
my_data<-read.table(file, header=TRUE,sep=";",
                    colClasses=c("character","character",rep("numeric",7)),
                    na="?")
subset_data<-my_data[my_data$Date=="1/2/2007"|my_data$Date=="2/2/2007",]
remove("my_data")
subset_data$newDate<-strptime(paste(subset_data$Date,subset_data$Time), "%d/%m/%Y %H:%M:%S")
dim(subset_data)
subset_data