library(readr)
library(dplyr)

# À partir des données originales, on conserve les arbres vivants debouts (Etat AS) 
# ou penchés (Etat AL), et on enlève les rangées avec des valeurs manquantes.

kejim <- read_csv("donnees_originales/Kejimkujik_NP_Forest_Trees_2004-2014_data_1.csv", 
                  skip = 1, na = c("", "NA", "na"))
colnames(kejim) <- c("Site", "Parcelle", "Jour", "Mois", "Annee", 
                     "Arbre", "Nb_Tiges", "Espece", "DHP", "Etat")
kejim <- filter(kejim, Etat %in% c("AS", "AL")) %>%
    select(-Etat)
kejim <- kejim[complete.cases(kejim),]

write_csv(kejim, "donnees/cours1_kejimkujik.csv")
