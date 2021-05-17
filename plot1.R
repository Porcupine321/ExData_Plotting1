
getwd()

datos <- read.table("~/exdata_data_household_power_consumption/household_power_consumption.txt",skip=1,sep=";")

names(datos) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

subdatos <- subset(datos,datos$Date=="1/2/2007" | datos$Date =="2/2/2007")

hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

dev.copy(png, file="plot1.png")
dev.off()