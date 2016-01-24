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
png(filename="plot2.png",width=480,height=480,units="px")

# Generate the line plot.
my.ylab <- "Global Active Power (kiloWatts)"
with( data, plot(fulltime,Global_active_power,type="l",ylab=my.ylab,xlab="") )

# Close the png.
dev.off()

