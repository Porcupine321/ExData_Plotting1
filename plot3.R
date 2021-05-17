getwd()

datos <- read.table("~/exdata_data_household_power_consumption/household_power_consumption.txt",skip=1,sep=";")
names(datos) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subdatos <- subset(datos,datos$Date=="1/2/2007" | power$Date =="2/2/2007")

subdatos$Date <- as.Date(subdatos$Date, format="%d/%m/%Y")
subdatos$Time <- strptime(subdatos$Time, format="%H:%M:%S")
subdatos[1:1440,"Time"] <- format(subdatos[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdatos[1441:2880,"Time"] <- format(subdatos[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


plot(subdatos$Time,subdatos$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subdatos,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subdatos,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subdatos,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

title(main="Energy sub-metering")

dev.copy(png, file="plot3.png")
dev.off()