# Worksheet
# Introduction to R - Part 2


#### Data manipulation with dplyr ####

library(dplyr)

# Import the Kejimkujik dataset
kejim <- 
    

# Pick rows for red maple (ACRU)

acru <- ...
    

# Exercise 1
# 
# Produce a table of observations for the year 2014, 
# excluding the individuals of the species *TSCA* (eastern hemlock).




# Sort rows of acru by ascending DBH

acru_tri_dhp <- ...

# Sort by year (increasing) and DBH (decreasing)

acru_tri_an_dhp <- ...


# Select the variables for the site, year and DBH

acru_select <- select(acru_tri_dhp, ...)


# Execute a chain of operations with %>%

acru <- kejim %>%
    filter(...) ...


# Exercise 2

# Using `%>%`, produce a table of balsam fir (ABBA) observations
# with DBH > 15 cm, sorted in chronological order.
    



# Add a column for the DBH in mm

kejim_dhp_mm <- ...(kejim, DHP_mm = ...)


# Mean and standard deviation by species

group_by(kejim, ...) %>%
    summarize(...)

# Count trees by site and year

compte_site_annee <- kejim %>%
    group_by(...) %>%
    summarize(...)


# Exercise 3

# Sort the species in kejim in descending order of maximum diameter.




# Join two data frames

codes_esp <- read.csv("codes_especes.csv", stringsAsFactors = FALSE,
                      encoding = "UTF-8")

kejim_esp <- ...



#### Data visualization with ggplot2 ####

library(ggplot2)


# msleep dataset
head(msleep)


# Create a scatter plot 

ggplot(data = ..., mapping = ...) +
    ...


# Exercise 4

# From the `kejim` data frame, produce a scatter plot of the DBH (`DHP`, on the y axis)
# according to the species (`Espece`, on the x axis).





# Boxplot of DBH by species

ggplot(kejim, aes(...)) +
    geom_boxplot()


# Histogram of DBH

ggplot(kejim, aes(...)) +
    ...(binwidth = 5, color = "white", fill = "blue")


# Exercise 5

# With `geom_bar`, create a bar graph of the number of individuals per species 
# (different species on the x-axis). 
# Use a color code to identify individuals from different sites. 




# Divide a graph in facets

ggplot(kejim, aes(x = Espece)) +
    geom_bar() +
    facet_wrap(...)


# Histogram of DBH by site and year

ggplot(kejim, aes(x = DHP)) +
    geom_histogram(binwidth = 5) +
    facet_grid(...)


# Exercise 6

# From the `msleep` dataset, create a scatter plot of total sleep (`sleep_total`) 
# and REM sleep (`sleep_rem`) with one facet for each type of diet (`vore`).




# Customize the appearance of graphs

# Density plot of DBH for three species

trois_esp <- ...(kejim, Espece %in% c("TSCA", "ACRU", "BEPA"))

dens <- ggplot(trois_esp, aes(x = DHP, fill = Espece)) +
    ...(alpha = 0.3)


# Change axis titles

dens <- dens +
    ...(title = "Distribution du diamètre de trois espèces au Parc national de Kejimkujik", 
         x = "Diamètre à hauteur de poitrine (cm)", y = "Densité", ...)


# Change scales

dens <- dens +
    scale_x_continuous(breaks = ...) +
    scale_fill_manual(... = c("orange", "purple", "green"),
                      ... = c("Acer rubrum", "Betula papyrifera", "Tsuga canadensis"))


# Themes

dens +
    theme_...

