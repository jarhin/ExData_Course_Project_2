library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI[["fips"]] <- as.factor(NEI[["fips"]])
NEI[["SCC"]] <- as.factor(NEI[["SCC"]])
NEI[["Pollutant"]] <- as.factor(NEI[["Pollutant"]])
NEI[["type"]] <- as.factor(NEI[["type"]])



#
#we use coal & comb (combusion) as search terms
vector_comb_and_coal <- grep(pattern = "(?=.*coal)(?=.*comb).*$", ignore.case = TRUE, SCC[["Short.Name"]], perl = TRUE)
codes <-  SCC[vector_comb_and_coal, "SCC", drop = TRUE]
question4_df <- aggregate(Emissions ~ year, data = subset(NEI, SCC %in% codes), sum)

question4_df[["year"]] <- as.factor(question4_df[["year"]])


plot_q4 <- ggplot(data = question4_df, aes(x = year, y= Emissions)) + geom_bar(stat = "identity")
plot_q4 <- plot_q4 + labs(title = expression(paste("Total ",PM[2.5] ," Emissions From Coal and combustion sources in the USA")))
plot_q4 <- plot_q4 + scale_x_discrete("\nYear") + scale_y_continuous("Emissions (tonnes)\n")
plot_q4

png(filename = "plot4.png", width = 480, height = 680)
plot_q4
dev.off()