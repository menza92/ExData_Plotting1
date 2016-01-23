require(data.table)
library(data.table)
#====================================================================
# 2016-01-22,  A.C.Dennerley
#====================================================================

# Read in all the data.
allData <- fread("./household_power_consumption.txt")
# Subset only the 1st and 2nd of February, 2007.
data <- subset(allData, (Date=="1/2/2007" | Date=="2/2/2007") )
# Create a png file to write to.
png(filename="plot1.png",width=480,height=480,units="px")
# Generate histogram.
hist(as.numeric(data$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kiloWatts)")
# Close the png
dev.off()