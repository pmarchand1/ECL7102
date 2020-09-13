# Feuille de travail
# Introduction à R - Partie 2



#### Visualisation des données avec ggplot2 ####

library(ggplot2)


# Jeu de données msleep
head(msleep)


# Créer un nuage de points 

ggplot(data = msleep, mapping = aes(x=sleep_total, y=sleep_rem)) +
    geom_point()



# Charger les données de Kejimkujik
kejim <- read.csv("cours1_kejimkujik.csv")
    

# Exercice 1

# À partir du tableau de données `kejim`, produisez un nuage de points 
# du DHP (axe des *y*) selon l'espèce (axe des *x*).

ggplot(kejim,  aes(x = espece, y = dhp)) +
  geom_point()



# Boîte à moustaches du DHP par espèce

ggplot(kejim, aes(x = espece, y = dhp)) + 
  geom_boxplot() + 
  geom_point(color="red", stat="summary", fun="mean")


# Histogramme du DHP

ggplot(kejim, aes(x=dhp)) +
    geom_histogram(binwidth = 10, color = "white", fill = "blue")

ggplot(kejim, aes(x=dhp, fill= espece)) +
  geom_histogram(binwidth = 5, color = "white")

# Exercice 2

# Avec `geom_bar`, créez un diagramme à barres du nombre d'individus par espèce
# (différentes espèces sur l'axe des x). 
# Utilisez un code de couleur pour identifier les individus de différents sites. 

ggplot(kejim, aes(x = espece, fill = site)) +
  geom_bar()



# Diviser un graphique en facettes

ggplot(kejim, aes(x = espece)) +
    geom_bar() +
    facet_wrap(~site)+
  coord_flip()


# Histogramme du DHP par site et année

ggplot(kejim, aes(x = dhp)) +
    geom_histogram(binwidth = 5) +
    facet_grid( annee ~ site)


# Exercice 3

# À partir du jeu de données `msleep`, créez un nuage de points représentant 
# le nombre d'heures de sommeil totales (`sleep_total`) et en phase REM (`sleep_rem`) 
# avec une facette pour chaque type de régime alimentaire (`vore`).

ggplot(data=msleep, mapping=aes(x=sleep_total, y=sleep_rem))+
  geom_point()+
  facet_wrap(~vore)


# Personnaliser l'apparence des graphiques

# Graphique de densité le DHP de trois espèces

trois_esp <- kejim[kejim$espece %in% c("TSCA", "ACRU", "BEPA"), ]

dens <- ggplot(trois_esp, aes(x = dhp, fill = espece)) +
    geom_density(alpha = 0.6)
dens

# Changer le titre des axes

dens <- dens +
    labs(title = "Distribution du diamètre de trois espèces au Parc national de Kejimkujik", 
        x = "Diamètre à hauteur de poitrine (cm)", y = "Densité", fill="Espèce")
dens

# Changer les échelles

dens <- dens +
    scale_x_continuous(breaks = seq(10, 80, 10)) +
    scale_fill_manual(values = c("orange", "purple", "green"),
                      labels = c("Acer rubrum", "Betula papyrifera", "Tsuga canadensis"))
dens

# Thèmes

dens +
    theme_bw() +
  theme(legend.position = c(0.7, 0.5))



#### Remaniement des données avec dplyr ####

library(dplyr)


# Choisir les rangées correspondant à l'érable rouge (ACRU)

acru <- kejim[kejim$espece=="ACRU",]
 head(acru)   
acru <- filter(kejim,espece=="ACRU")

acru30 <- filter(kejim,espece=="ACRU", dhp > 30)
 head(acru30)


# Exercice 4
# 
# Produisez un tableau des observations de l'année 2014, 
# excluant les individu de l'espèce TSCA (pruche du Canada).

 acru2014<- filter (kejim, espece != "TSCA", annee== 2014)
 head(acru2014)


# Trier les rangées du tableau acru par DHP croissant 

acru_tri_dhp <- arrange(acru, dhp)
head(acru_tri_dhp)

# Trier par année (croissante) et DHP (décroissant)

acru_tri_an_dhp <- arrange(acru, annee, desc (dhp))
head(acru_tri_an_dhp)

# Extraire les variables Site, Annee et DHP

acru_select <- select(acru_tri_dhp, site, annee, dhp)
head(acru_select)


# Exécuter une séquence d'opérations avec %>%

acru <- kejim %>%
    filter(espece=="ACRU") %>%
  arrange(dhp) %>%
  select(site, annee, dhp)

head(acru)

# Exercice 5

# En utilisant %>%, produisez un tableau des observations de sapin baumier (ABBA) 
# de plus de 15 cm de DHP, triées en ordre chronologique (jour, mois et annee).
abba <- kejim %>% 
  filter(espece=="ABBA", dhp>15) %>% 
  arrange(annee, mois, jour )
head(abba)


# Ajouter une colonne pour le DHP en mm

kejim_dhp_mm <- mutate(kejim, dhp_mm = dhp*10)
head(kejim_dhp_mm)

# Moyenne et écart-type du DHP par espèce

group_by(kejim, espece) %>%
    summarize(moyDHP= mean(dhp), etDHP= sd(dhp))

# Nombre d'arbres par site et année

compte_site_annee <- count(kejim, site, annee)
head(compte_site_annee)

# Exercice 6

# Classez les espèces du jeu de données `kejim` en ordre décroissant de leur diamètre maximal.
#group, diam max, arrange decroissant de diam max 

group_by(kejim, espece) %>% 
  summarise(maxdhp = max(dhp)) %>%
arrange(desc(maxdhp))


# Joindre deux tableaux de données

codes_esp <- read.csv("codes_especes.csv", encoding = "UTF-8")

kejim_esp <- inner_join(kejim, codes_esp)

head(kejim_esp)

