# Worksheet
# Introduction to R - Part 2


#### Data visualization with ggplot2 ####

library(ggplot2)


# msleep dataset
head(msleep)


# Create a scatter plot 

ggplot(data = msleep, mapping = aes(x=sleep_total, y=sleep_rem)) +
    geom_point()



# Import the Kejimkujik dataset
kejim <- read.csv("cours1_kejimkujik.csv")
    

# Exercise 1

# From the `kejim` data frame, produce a scatter plot of the DBH (`dhp`, on the y axis)
# according to the species (`espece`, on the x axis).

ggplot(kejim,  aes(x = espece, y = dhp)) +
    geom_point()


# Boxplot of DBH by species

ggplot(kejim, aes(x = espece, y = dhp)) + 
    geom_boxplot() + 
    geom_point(color="red", stat="summary", fun="mean")


# Histogram of DBH

ggplot(kejim, aes(x=dhp)) +
    geom_histogram(binwidth = 10, color = "white", fill = "blue")

ggplot(kejim, aes(x=dhp, fill= espece)) +
    geom_histogram(binwidth = 5, color = "white")


# Exercise 2

# With `geom_bar`, create a bar graph of the number of individuals per species 
# (different species on the x-axis). 
# Use a color code to identify individuals from different sites. 

ggplot(kejim, aes(x = espece, fill = site)) +
    geom_bar()


# Divide a graph in facets

ggplot(kejim, aes(x = espece)) +
    geom_bar() +
    facet_wrap(~site)+
    coord_flip()


# Histogram of DBH by site and year

ggplot(kejim, aes(x = dhp)) +
    geom_histogram(binwidth = 5) +
    facet_grid( annee ~ site)


# Exercise 3

# From the `msleep` dataset, create a scatter plot of total sleep (`sleep_total`) 
# and REM sleep (`sleep_rem`) with one facet for each type of diet (`vore`).

ggplot(data=msleep, mapping=aes(x=sleep_total, y=sleep_rem))+
    geom_point()+
    facet_wrap(~vore)


# Customize the appearance of graphs

# Density plot of DBH for three species

trois_esp <- kejim[kejim$espece %in% c("TSCA", "ACRU", "BEPA"), ]

dens <- ggplot(trois_esp, aes(x = dhp, fill = espece)) +
    geom_density(alpha = 0.6)
dens


# Change axis titles

dens <- dens +
    labs(title = "Distribution du diamètre de trois espèces au Parc national de Kejimkujik", 
         x = "Diamètre à hauteur de poitrine (cm)", y = "Densité", fill="Espèce")
dens


# Change scales

dens <- dens +
    scale_x_continuous(breaks = seq(10, 80, 10)) +
    scale_fill_manual(values = c("orange", "purple", "green"),
                      labels = c("Acer rubrum", "Betula papyrifera", "Tsuga canadensis"))
dens


# Themes

dens +
    theme_bw() +
    theme(legend.position = c(0.7, 0.5))


#### Data manipulation with dplyr ####

library(dplyr)
    
    
# Pick rows for red maple (ACRU)
    
acru <- kejim[kejim$espece=="ACRU",]
head(acru)   
acru <- filter(kejim,espece=="ACRU")

acru30 <- filter(kejim,espece=="ACRU", dhp > 30)
head(acru30)



# Exercise 4
# 
# Produce a table of observations for the year 2014, 
# excluding the individuals of the species *TSCA* (eastern hemlock).

acru2014<- filter (kejim, espece != "TSCA", annee== 2014)
head(acru2014)


# Sort rows of acru by ascending DBH

acru_tri_dhp <- arrange(acru, dhp)
head(acru_tri_dhp)


# Sort by year (increasing) and DBH (decreasing)

acru_tri_an_dhp <- arrange(acru, annee, desc (dhp))
head(acru_tri_an_dhp)


# Select the variables for the site, year and DBH

acru_select <- select(acru_tri_dhp, site, annee, dhp)
head(acru_select)


# Execute a chain of operations with %>%

acru <- kejim %>%
    filter(espece=="ACRU") %>%
    arrange(dhp) %>%
    select(site, annee, dhp)

head(acru)


# Exercise 5

# Using `%>%`, produce a table of balsam fir (ABBA) observations
# with DBH > 15 cm, sorted in chronological order.

abba <- kejim %>% 
    filter(espece=="ABBA", dhp>15) %>% 
    arrange(annee, mois, jour )
head(abba)


# Add a column for the DBH in mm

kejim_dhp_mm <- mutate(kejim, dhp_mm = dhp*10)
head(kejim_dhp_mm)

# Mean and standard deviation by species

group_by(kejim, espece) %>%
    summarize(moyDHP= mean(dhp), etDHP= sd(dhp))

# Count trees by site and year

compte_site_annee <- count(kejim, site, annee)
head(compte_site_annee)


# Exercise 6

# Sort the species in kejim in descending order of maximum diameter.

group_by(kejim, espece) %>% 
    summarise(maxdhp = max(dhp)) %>%
    arrange(desc(maxdhp))


# Join two data frames

codes_esp <- read.csv("codes_especes.csv", encoding = "UTF-8")

kejim_esp <- inner_join(kejim, codes_esp)

head(kejim_esp)

