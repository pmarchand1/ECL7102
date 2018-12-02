

x <- c(12, 17, 16, 18, 11, 26)
n <- sum(x) # total

# Probabilités théoriques
p <- rep(1/6, 6)

# Calcul du khi2
khi2 <- sum((x - n*p)^2 / (n*p))
khi2
pchisq(khi2, df = 5)

chisq.test(x, p = p)

####

# rbind crée une matrice en rattachant des vecteurs par rangée
survie <- rbind(c(29, 11, 12), c(31, 29, 38)) 
rownames(survie) <- c("mort", "vivant")
colnames(survie) <- c("ABBA", "PIGL", "PIMA")
survie

khi2 <- chisq.test(survie)
khi2$expected
khi2$residuals

####

tab <- matrix(c(4, 6, 8, 2), nrow = 2)
tab
chisq.test(tab)
fisher.test(tab)



####

iris_ech <- iris[c(1:10, 51:60, 101:110), ]
ggplot(iris_ech, aes(x = Species, y = Sepal.Width)) +
    geom_boxplot()

anova1 <- aov(Sepal.Width ~ Species, data = iris_ech) 
summary(anova1)
plot(anova1)
coef(anova1)

library(dplyr)
iris_2sp <- filter(iris_ech, Species != "setosa")
anova2 <- aov(Sepal.Width ~ Species, data = iris_2sp)
summary(anova2)
coef(anova2)

t.test(Sepal.Width ~ Species, data = iris_2sp, var.equal = TRUE)

####

ggplot(InsectSprays, aes(x = spray, y = count)) + 
    geom_boxplot()

anova3 <- aov(count ~ spray, InsectSprays)
plot(anova3, which = 1:2)

anova3_racine <- aov(sqrt(count) ~ spray, InsectSprays)
plot(anova3_racine, which = 1:2)

summary(anova3_racine)

####

anova1 <- aov(Sepal.Width ~ Species, data = iris_ech) 
tukey1 <- TukeyHSD(anova1)
tukey1

plot(tukey1)







