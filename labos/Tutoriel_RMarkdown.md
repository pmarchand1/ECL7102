---
title: "Introduction à R Markdown"
output: html_document
---

## Créer un document R Markdown

Le format R Markdown permettent de combiner du texte, des bouts de code R et leurs résultats dans un même document. Ce tutoriel est une très brève introduction à R Markdown. Des tutoriels plus complets se retrouvent sur les pages suivantes:

- <https://rmarkdown.rstudio.com/lesson-1.html> (site officiel, en anglais)
- <http://larmarange.github.io/analyse-R/rmarkdown-les-rapports-automatises.html> (en français)

À partir de RStudio, créez un nouveau document R Markdown avec le menu *File -> New File -> R Markdown...*. Choisissez le format de sortie PDF.

Le fichier créé contient déjà un exemple de texte R Markdown. Sauvegardez le fichier (donnons-lui le nom `exemple.Rmd`) et appuyez sur le bouton **Knit** pour produire le document PDF. 

<img src="../images/knit_cap.png" width=300>

En lisant la description des différentes parties du document, comparez le fichier .Rmd et le résultat en PDF.

## En-tête

L'en-tête du fichier contient des informations comme le titre, la date et le format de sortie. Elle commence et se termine par un bloc de trois tirets `---`.

## Blocs de code R

Les sections de code R ont un arrière-plan gris dans le document affiché dans RStudio. Elles commencent et se terminent avec trois accents graves ```.

Le raccourci **Ctrl+Alt+I** insère automatiquement un nouveau bloc de code dans le document.

Le premier bloc de code (qui contient `knitr::opts_chunk$set(echo = TRUE)`) sert à spécifier certains paramètres. Vous pouvez l'ignorer pour l'instant. 

Regardez le deuxième bloc qui contient `summary(cars)`. À droite des trois accents graves sur la première ligne, vous trouvez l'en-tête du bloc entre accolades: `{r cars}`. Elle commence avec `r` pour indiquer qu'il s'agit de code R, tandis que `cars` est le nom du bloc. (Il est optionnel de nommer les blocs.) La flèche verte tout à fait à droite permet d'exécuter le code et d'afficher le résultat. 

Regardez maintenant le fichier PDF. Vous y trouverez le bloc de code suivi du résultat.

Le deuxième bloc de code `plot(pressure)` produit le graphique que vous voyez dans le document PDF. L'en-tête du bloc contient l'option `echo = FALSE` ce qui signifie que le code est invisible, seul le résultat apparaît dans le PDF.

## Texte Markdown

Le reste du document est composé de texte avec quelques indications du langage Markdown pour la mise en page. 

Voici quelques exemples d'indications de mise en page et le résultat.

`# En-tête de niveau 1`

# En-tête de niveau 1

`## En-tête de niveau 2`

## En-tête de niveau 2

`### En-tête de niveau 3`

### En-tête de niveau 3

`Texte en *italique*`

Texte en *italique*

`Texte en **gras**`

Texte en **gras**

`- Élément de liste`<br>
`- Élément de liste`<br>

- Élément de liste
- Élément de liste

`Formule mathématique: $y = x^2$`

Formule mathématique: $y = x^2$


## Autre exemple

Voici le code R Markdown pour les solutions du dernier laboratoire: [7R-Régression_linéaire.Rmd](7R-Régression_linéaire.Rmd).

