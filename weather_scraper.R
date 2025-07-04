# -------------------------------------------
# SFU Weather Forecast Scraper
# STAT 260 Final Project - Samaira Sachdeva
# -------------------------------------------

# Load required packages
library(rvest)
library(xml2)
library(dplyr)

# Step 1: Define the URL
url <- "http://www.sfu.ca/~haoluns/forecast.html"

# Step 2: Read the HTML content of the page
page <- read_html(url)

# Step 3: Extract elements
periods <- page %>% html_nodes(".period-name") %>% html_text()
descriptions <- page %>% html_nodes(".short-desc") %>% html_text()
temperatures <- page %>% html_nodes(".temp") %>% html_text()

# Step 4: Combine into a data frame
weather_data <- data.frame(
  Period = periods,
  Description = descriptions,
  Temperature = temperatures
)

# Step 5: Export the data to a CSV file
write.table(weather_data, "301592227.csv", sep = ",", row.names = FALSE, col.names = TRUE)

# (Optional) View the data
print(weather_data)

