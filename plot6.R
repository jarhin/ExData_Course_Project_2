library("ggplot2")
library("reshape2")

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



question6_df_la <- aggregate(Emissions ~ year, data = NEI[NEI$SCC %in% on_road_codes & NEI$fips == "06037",c("Emissions", "year")], sum)
question6_df_la[["year"]] <- as.factor(question6_df_la[["year"]])
question6_df_la$location <- "Los Angeles County"

question6_df <- question5_df
question6_df$location <- "Baltimore City"

question6_df <- rbind(question6_df, question6_df_la)
question6_df$location <- as.factor(question6_df$location )



plot_q6 <- ggplot(data = question6_df, aes(x = year, y= Emissions, fill = location)) + geom_bar(stat = "identity", position = "dodge")
plot_q6 <- plot_q6 + labs(title = expression(paste("Total ",PM[2.5] ," Emissions From Motor Vechiles")))
plot_q6 <- plot_q6 + scale_x_discrete("\nYear") + scale_y_continuous("Emissions (tonnes)\n")
plot_q6




png(filename = "plot6.png", width = 480, height = 680)
plot_q6
dev.off()