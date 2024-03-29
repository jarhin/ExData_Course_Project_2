#Introduction

Fine particulate matter (PM<sub>2.5</sub>) is an ambient air pollutant
for which there is strong evidence that it is harmful to human
health. In the United States, the Environmental Protection Agency
(EPA) is tasked with setting national ambient air quality standards
for fine PM and for tracking the emissions of this pollutant into the
atmosphere. Approximatly every 3 years, the EPA releases its database
on emissions of PM<sub>2.5</sub>. This database is known as the
National Emissions Inventory (NEI). You can read more information
about the NEI at the <a href="http://www.epa.gov/ttn/chief/eiinformation.html">EPA National Emissions Inventory web
site</a>.</p>

For each year and for each type of PM source, the NEI records how many
tons of PM<sub>2.5</sub> were emitted from that source over the course
of the entire year. The data that you will use for this assignment are
for 1999, 2002, 2005, and 2008.</p>

##Data

The data for this assignment are available from the course web site as
a single zip file:</p>

<ul><li><a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip">Data for Peer Assessment</a> [29Mb]</li>
</ul>The zip file contains two files:</p>

PM<sub>2.5</sub> Emissions Data (<code>summarySCC_PM25.rds</code>):
This file contains a data frame with all of the PM<sub>2.5</sub>
emissions data for 1999, 2002, 2005, and 2008. For each year, the
table contains number of <strong>tons</strong> of PM<sub>2.5</sub> emitted from a
specific type of source for the entire year. Here are the first few
rows.</p>

<pre><code>##     fips      SCC Pollutant Emissions  type year
## 4  09001 10100401  PM25-PRI    15.714 POINT 1999
## 8  09001 10100404  PM25-PRI   234.178 POINT 1999
## 12 09001 10100501  PM25-PRI     0.128 POINT 1999
## 16 09001 10200401  PM25-PRI     2.036 POINT 1999
## 20 09001 10200504  PM25-PRI     0.388 POINT 1999
## 24 09001 10200602  PM25-PRI     1.490 POINT 1999
</code></pre>

<ul><li><code>fips</code>: A five-digit number (represented as a string)
indicating the U.S. county </p></li>
<li><code>SCC</code>: The name of the source as indicated by a digit
string (see source code classification table)</p></li>
<li><code>Pollutant</code>: A string indicating the pollutant</p></li>
<li><code>Emissions</code>: Amount of PM<sub>2.5</sub> emitted, in tons</p></li>
<li><code>type</code>: The type of source (point, non-point, on-road, or
non-road)</p></li>
<li><code>year</code>: The year of emissions recorded</p></li>
</ul>Source Classification Code Table
(<code>Source_Classification_Code.rds</code>): This table provides a
mapping from the SCC digit strings int he Emissions table to the
actual name of the PM<sub>2.5</sub> source. The sources are
categorized in a few different ways from more general to more specific
and you may choose to explore whatever categories you think are most
useful. For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.</p>

You can read each of the two files using the <code>readRDS()</code> function in R. For example, reading in each file can be done with the following code:</p>

<pre><code class="r">## This first line will likely take a few seconds. Be patient!
NEI &lt;- readRDS("summarySCC_PM25.rds")
SCC &lt;- readRDS("Source_Classification_Code.rds")
</code></pre>

as long as each of those files is in your current working directory
(check by calling <code>dir()</code> and see if those files are in the
listing).</p>

##Assignment

The overall goal of this assignment is to explore the National
Emissions Inventory database and see what it say about fine
particulate matter pollution in the United states over the 10-year
period 1999–2008. You may use any R package you want to support your
analysis.</p>

###Questions

You must address the following questions and tasks in your exploratory
analysis. For each question/task you will need to make a single
plot. Unless specified, you can use any plotting system in R to make
your plot.</p>

<ol><li>Have total emissions from PM<sub>2.5</sub> decreased in the United
States from 1999 to 2008? Using the <strong>base</strong> plotting system, make a
plot showing the <em>total</em> PM<sub>2.5</sub> emission from all sources
for each of the years 1999, 2002, 2005, and 2008.</p></li>
<li>Have total emissions from PM<sub>2.5</sub> decreased in the
<strong>Baltimore City</strong>, Maryland (<code>fips == "24510"</code>) from 1999 to
2008? Use the <strong>base</strong> plotting system to make a plot answering this
question.</p></li>
<li>Of the four types of sources indicated by the <code>type</code>
(point, nonpoint, onroad, nonroad) variable, which of these four
sources have seen decreases in emissions from 1999–2008 for
<strong>Baltimore City</strong>? Which have seen increases in emissions from
1999–2008? Use the <strong>ggplot2</strong> plotting system to make a plot answer
this question.</p></li>
<li>Across the United States, how have emissions from coal
combustion-related sources changed from 1999–2008?</p></li>
<li>How have emissions from motor vehicle sources changed from
1999–2008 in <strong>Baltimore City</strong>? </p></li>
<li>Compare emissions from motor vehicle sources in Baltimore City with
emissions from motor vehicle sources in <strong>Los Angeles County</strong>,
California (<code>fips == "06037"</code>). Which city has seen greater
changes over time in motor vehicle emissions?</p></li>
</ol>
