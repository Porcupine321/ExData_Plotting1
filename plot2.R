
getwd()

datos <- read.table("~/exdata_data_household_power_consumption/household_power_consumption.txt",skip=1,sep=";")

names(datos) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

subdatos <- subset(datos,datos$Date=="1/2/2007" | datos$Date =="2/2/2007")

subdatos$Date <- as.Date(subdatos$Date, format="%d/%m/%Y")
subdatos$Time <- strptime(subdatos$Time, format="%H:%M:%S")
subdatos[1:1440,"Time"] <- format(subdatos[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdatos[1441:2880,"Time"] <- format(subdatos[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


plot(subdatos$Time,as.numeric(as.character(subdatos$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

title(main="Global Active Power Vs Time")

dev.copy(png, file="plot2.png")
dev.off()