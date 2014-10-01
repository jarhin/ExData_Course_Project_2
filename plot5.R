library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI[["fips"]] <- as.factor(NEI[["fips"]])
NEI[["SCC"]] <- as.factor(NEI[["SCC"]])
NEI[["Pollutant"]] <- as.factor(NEI[["Pollutant"]])
NEI[["type"]] <- as.factor(NEI[["type"]])



#
#we use coal & comb (combusion) as search terms
#vector_mobile_sector <- grep(pattern = "Mobile - On-Road", ignore.case = TRUE, SCC[["EI.Sector"]])
#codes_mobile <- SCC[vector_mobile_sector, "SCC", drop = TRUE]
on_road_codes <- NEI[NEI[["type"]] == "ON-ROAD", "SCC", drop = TRUE]
question5_df <- aggregate(Emissions ~ year, data = NEI[NEI$SCC %in% on_road_codes & NEI$fips == "24510",c("Emissions", "year")], sum)

question5_df[["year"]] <- as.factor(question5_df[["year"]])


plot_q5 <- ggplot(data = question5_df, aes(x = year, y= Emissions)) + geom_bar(stat = "identity")
plot_q5 <- plot_q5 + labs(title = expression(paste("Total ",PM[2.5] ," Emissions From Motor Vechiles in Baltimore City")))
plot_q5 <- plot_q5 + scale_x_discrete("\nYear") + scale_y_continuous("Emissions (tonnes)\n")
plot_q5

png(filename = "plot5.png", width = 480, height = 680)
plot_q5
dev.off()