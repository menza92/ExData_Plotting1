#====================================================================
# 2016-01-22,  A.C.Dennerley
#====================================================================

# Read in all the data.
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

# Subset only the 1st and 2nd of February, 2007.
data <- subset(data, (Date=="1/2/2007" | Date=="2/2/2007") )

# Add a column of date-times that are POSIX objects.
data$fulltime <- strptime( paste(data$Date,data$Time,sep="-"), format="%d/%m/%Y-%T" )

# Create a png file to write to.
png(filename="plot3.png",width=480,height=480,units="px")

# Drawing the 1st data set to the plot.
my.ylab <- "Energy sub metering"
with( data, plot(fulltime,Sub_metering_1,type="l",ylab=my.ylab,xlab="") )
# Drawing the 2nd and 3rd data sets to the plot
with( data, points(fulltime,Sub_metering_2,type="l",col="red") )
with( data, points(fulltime,Sub_metering_3,type="l",col="blue") )
# Draw a descriptive legend.
legend("topright",
       c("Sub-metering 1","Sub-metering 2","Sub-metering 3"),
       lty=c(1,1),
       col=c("black","red","blue")
)

# Close the png.
dev.off()

