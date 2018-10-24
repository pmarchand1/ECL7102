---
title: "Introduction to R Markdown"
output: html_document
---

## Create a R Markdown document

The R Markdown format allows you to combine text, chunks of R code, and results in one document. This tutorial is a very brief introduction to R Markdown. A more complete tutorial can be found at <https://rmarkdown.rstudio.com/lesson-1.html>.

In RStudio, create a new R Markdown document with the menu commands *File -> New File -> R Markdown...*. Choose the Word (.docx) output format. You can also choose PDF or HTML, but PDF creation requires installing additional software, as noted in RStudio. Also, thee Word format has the advantage that you can edit the document in Word later.

The file created already contains sample R Markdown text. Save the file (give it the name `example.Rmd`) and press the **Knit** button to produce the .docx file.

<img src = "../images/knit_cap.png" width=300>

When reading the description of the different parts of the document, compare the .Rmd file and the result in Word.

## Header

The header of the file contains information such as title, date, and output format. It begins and ends with a block of three dashes `---`.

## R code chunks

The R code chunks have a gray background when displayed in RStudio. They start and end with three backticks ```.

The shortcut **Ctrl + Alt + I** automatically inserts a new code chunk into the document.

The first code chunk (which contains `knitr::opts_chunk$set(echo = TRUE)`) is used to specify certain parameters. You can ignore it for now.

Look at the second chunk that contains `summary(cars)`. To the right of the three backticks on the first line, you find the chunk header surrounded by braces: `{r cars}`. It starts with `r` to indicate that it is code R, while` cars` is the name of the chunk. (It is optional to name the chunks.) The green arrow on the far right is used to execute the code and display the result.

Now look at the Word file. There you will find the code chunk followed by the result.

The second code chunk `plot(pressure)` produces the graph that you see in the Word document. The chunk header contains the option `echo = FALSE` which means that the code is invisible, only the result appears in Word.

## Markdown text

The rest of the document is composed of text with some Markdown language markers for the layout.

Here are some examples of layout markers and their output.

`# Level 1 Header`

# Level 1 Header

`## Level 2 Header`

## Level 2 Header

`### Level 3 Header`

### Level 3 Header

`Text in *italic*`

Text in *italic*

`Text in **bold**`

Text in **bold**

`- List Item` <br>
`- List Item` <br>

- List item
- List item

`Math formula: $y = x^2$ `

Math formula: $y = x^2$


## Another example

Here is the R Markdown code for the solutions of the last lab: [7R-Linear_regression.Rmd](7R-Linear_regression.Rmd).

