library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI[["fips"]] <- as.factor(NEI[["fips"]])
NEI[["SCC"]] <- as.factor(NEI[["SCC"]])
NEI[["Pollutant"]] <- as.factor(NEI[["Pollutant"]])
NEI[["type"]] <- as.factor(NEI[["type"]])

question1_df <- aggregate(Emissions ~ year, data = NEI, sum)

question1_df[["year"]] <- as.factor(question1_df[["year"]])


png(filename = "plot1.png", width = 480, height = 680)
barplot(question1_df[["Emissions"]], names.arg = question1_df[["year"]])
dev.off()