# Feuille de travail
# Introduction à R - Partie 2



#### Visualisation des données avec ggplot2 ####

library(ggplot2)


# Jeu de données msleep
head(msleep)


# Créer un nuage de points 

ggplot(data = ..., mapping = ...) +
    ...



# Charger les données de Kejimkujik
kejim <- 
    

# Exercice 1

# À partir du tableau de données `kejim`, produisez un nuage de points 
# du DHP (axe des *y*) selon l'espèce (axe des *x*).




# Boîte à moustaches du DHP par espèce

ggplot(kejim, aes(...)) +
    geom_boxplot()


# Histogramme du DHP

ggplot(kejim, aes(...)) +
    ...(binwidth = 5, color = "white", fill = "blue")


# Exercice 2

# Avec `geom_bar`, créez un diagramme à barres du nombre d'individus par espèce
# (différentes espèces sur l'axe des x). 
# Utilisez un code de couleur pour identifier les individus de différents sites. 




# Diviser un graphique en facettes

ggplot(kejim, aes(x = espece)) +
    geom_bar() +
    facet_wrap(...)


# Histogramme du DHP par site et année

ggplot(kejim, aes(x = dhp)) +
    geom_histogram(binwidth = 5) +
    facet_grid(...)


# Exercice 3

# À partir du jeu de données `msleep`, créez un nuage de points représentant 
# le nombre d'heures de sommeil totales (`sleep_total`) et en phase REM (`sleep_rem`) 
# avec une facette pour chaque type de régime alimentaire (`vore`).




# Personnaliser l'apparence des graphiques

# Graphique de densité le DHP de trois espèces

trois_esp <- kejim[kejim$espece %in% c("TSCA", "ACRU", "BEPA"), ]

dens <- ggplot(trois_esp, aes(x = dhp, fill = espece)) +
    ...(alpha = 0.3)


# Changer le titre des axes

dens <- dens +
    ...(title = "Distribution du diamètre de trois espèces au Parc national de Kejimkujik", 
        x = "Diamètre à hauteur de poitrine (cm)", y = "Densité", ...)


# Changer les échelles

dens <- dens +
    scale_x_continuous(breaks = ...) +
    scale_fill_manual(... = c("orange", "purple", "green"),
                      ... = c("Acer rubrum", "Betula papyrifera", "Tsuga canadensis"))


# Thèmes

dens +
    theme_...



#### Remaniement des données avec dplyr ####

library(dplyr)


# Choisir les rangées correspondant à l'érable rouge (ACRU)

acru <- ...
    

# Exercice 4
# 
# Produisez un tableau des observations de l'année 2014, 
# excluant les individu de l'espèce TSCA (pruche du Canada).




# Trier les rangées du tableau acru par DHP croissant 

acru_tri_dhp <- ...

# Trier par année (croissante) et DHP (décroissant)

acru_tri_an_dhp <- ...


# Extraire les variables Site, Annee et DHP

acru_select <- select(acru_tri_dhp, ...)


# Exécuter une séquence d'opérations avec %>%

acru <- kejim %>%
    filter(...) ...


# Exercice 5

# En utilisant %>%, produisez un tableau des observations de sapin baumier (ABBA) 
# de plus de 15 cm de DHP, triées en ordre chronologique.
    



# Ajouter une colonne pour le DHP en mm

kejim_dhp_mm <- ...(kejim, dhp_mm = ...)


# Moyenne et écart-type du DHP par espèce

group_by(kejim, ...) %>%
    summarize(...)

# Nombre d'arbres par site et année

compte_site_annee <- kejim %>%
    group_by(...) %>%
    summarize(...)


# Exercice 6

# Classez les espèces du jeu de données `kejim` en ordre décroissant de leur diamètre maximal.




# Joindre deux tableaux de données

codes_esp <- read.csv("codes_especes.csv", stringsAsFactors = FALSE,
                      encoding = "UTF-8")

kejim_esp <- ...


