# Loading the data
# When loading the dataset into R, please consider the following:
#   
# The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory the dataset 
# will require in memory before reading into R. Make sure your computer has enough memory (most modern computers should be fine).
# We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just 
# those dates rather than reading in the entire dataset and subsetting to those dates.
# You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime()  and as.Date() functions.
# Note that in this dataset missing values are coded as ?.
# Making Plots 
# Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007.
# Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.
# 
# First you will need to fork and clone the following GitHub repository: https://github.com/rdpeng/ExData_Plotting1
# 
# For each plot you should
# 
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# Name each of the plot files as plot1.png, plot2.png, etc.
# Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, 
# i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. 
# You must also include the code that creates the PNG file.
# Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)
# When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your repository is up to date. 
# There should be four PNG files and four R code files, a total of eight files in the top-level folder of the repo.
# 

library(tibble)
# library(grid)
# library(gridExtra)

# Read in file
elec_pow_cons <- read.table("E:/Vebash - RMB/Vebash RMB Personal Docs/coursera courses/Data Science Specialisation/Exploring data/household_power_consumption.txt",
                            header = TRUE, sep = ";")

# Tidy data into correct format for the processing
elec_pow_cons$Date <- as.Date(elec_pow_cons$Date, format="%d/%m/%Y")
elec_pow_cons_df <- tbl_df(elec_pow_cons[(elec_pow_cons$Date=="2007-02-01") | (elec_pow_cons$Date=="2007-02-02"),])
elec_pow_cons_df$Global_active_power <- as.numeric(as.character(elec_pow_cons_df$Global_active_power))
# elec_pow_cons_df$Global_reactive_power <- as.numeric(as.character(elec_pow_cons_df$Global_reactive_power))
# elec_pow_cons_df$Voltage <- as.numeric(as.character(elec_pow_cons_df$Voltage))
# elec_pow_cons_df$Sub_metering_1 <- as.numeric(as.character(elec_pow_cons_df$Sub_metering_1))
# elec_pow_cons_df$Sub_metering_2 <- as.numeric(as.character(elec_pow_cons_df$Sub_metering_2))
# elec_pow_cons_df$Sub_metering_3 <- as.numeric(as.character(elec_pow_cons_df$Sub_metering_3))
# Column `DateTime` is of unsupported class POSIXlt/POSIXt -> make a date time field as follows to
# get around the error
# elec_pow_cons_df <- transform(elec_pow_cons_df,  DateTime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

hist(elec_pow_cons_df$Global_active_power, main = paste("Global Active Power"), col="red", 
     xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
cat("Plot1.png has been saved in", getwd())

