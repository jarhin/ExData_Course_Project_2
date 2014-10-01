
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI[["fips"]] <- as.factor(NEI[["fips"]])
NEI[["SCC"]] <- as.factor(NEI[["SCC"]])
NEI[["Pollutant"]] <- as.factor(NEI[["Pollutant"]])
NEI[["type"]] <- as.factor(NEI[["type"]])


question2_df <- aggregate(Emissions ~ year, data = subset(NEI, fips == "24510"), sum)

#question2_df[["year"]] <- as.factor(question1_df[["year"]])

png(filename = "plot2.png", width = 480, height = 680)
barplot(question2_df[["Emissions"]], names.arg = question2_df[["year"]])
title(xlab="Year", ylab = "Emissions (tonnes)", main =  expression(paste("Total ",PM[2.5] ," Emissions From All Sources in Baltimore")))
dev.off()