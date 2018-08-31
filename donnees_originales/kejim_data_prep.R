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


kejim_dict <- read_csv("donnees_originales/Kejimkujik_NP_Forest_Trees_2004-2014_data_dictionary.csv",
                       locale = locale(encoding = "ISO-8859-1"))
colnames(kejim_dict) <- c("champ_en", "champ_fr", "valeur", "desc_en", "desc_fr")

kejim_dict <- filter(kejim_dict, champ_fr == "Espèce") %>%
    select(Espece = valeur, Nom_Espece = desc_fr, Species_Name = desc_en)

write_csv(kejim_dict, "donnees/codes_especes.csv")
