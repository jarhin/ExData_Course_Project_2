library("ggplot2")


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI[["fips"]] <- as.factor(NEI[["fips"]])
NEI[["SCC"]] <- as.factor(NEI[["SCC"]])
NEI[["Pollutant"]] <- as.factor(NEI[["Pollutant"]])
NEI[["type"]] <- as.factor(NEI[["type"]])

question3_df <- aggregate(Emissions ~ year + type, data = subset(NEI, fips == "24510"), sum)
question3_df[["year"]] <- as.factor(question3_df[["year"]])

plot_q3 <- ggplot(data = question3_df, aes(x = year, y = Emissions)) + geom_bar(stat = "identity")
plot_q3 <- plot_q3 + facet_grid( ~ type) + scale_x_discrete("\nYear") + scale_y_continuous("Emissions (tonnes)\n")
plot_q3 <- plot_q3 + labs(title = expression(paste("Total ",PM[2.5] ," Emissions From All Sources in Baltimore")))
plot_q3


png(filename = "plot3.png", width = 480, height = 680)
plot_q3
dev.off()