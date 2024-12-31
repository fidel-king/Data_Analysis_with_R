rm(list = ls())
#Exercice 1 : Création de variables et manipulation de types de données

## 1: Crée une variable x avec la valeur numérique 10.
x <- 10
## 2: Crée une variable y avec la chaîne de caractères "Bonjour".
y <- "Bonjour"
## 3: Crée une variable z avec un vecteur de nombres allant de 1 à 5.
z <- 1:5
## 4: Utilise la fonction class() pour afficher le type de données de chaque variable.
class(x)
class(y)
class(z)
## 5: Convertis le vecteur z en une chaîne de caractères.
z <- as.character(z)

#Exercice 2 : Vecteurs et opérations sur vecteurs

## 1: Crée un vecteur a contenant les nombres 2, 4, 6, 8, 10.
a <- c(2,4,6,8,10)
a1 <- seq(2,10,2)
## 2: Crée un vecteur b contenant les nombres 1, 3, 5, 7, 9.
b <- c(1,3,5,7,9)
b1 <- seq(1,10,2)
## 3: Effectue les opérations suivantes sur les deux vecteurs : addition,soustraction, multiplication, division.
### addition
a+b
### soustraction
a-b
### multiplication
a*b
### division.
a/b
## 4: Trouve la somme des éléments du vecteur a en utilisant la fonction sum().
sum(a)
## 5: Applique la fonction mean() pour trouver la moyenne des éléments de b.
mean(b)

#Exercice 3 : Matrices en R

## 1 Crée une matrice M de dimensions 3x3 avec les valeurs de 1 à 9

M <- matrix(1:9, nrow=3, byrow=TRUE)

## 2 Multiplie chaque élément de la matrice par 2.
M <- M*2

## 3 Sélectionne le premier élément de la deuxième colonne.

M[1,2]

##4Calcule la somme de chaque ligne de la matrice en utilisant apply().

apply(M, 1, sum)

#Exercice 4 : Travailler avec les DataFrames

### 1 Crée un DataFrame students avec deux colonnes : Nom (vecteur de chaînes)
##et Note (vecteur numérique).

students <- data.frame(Nom = c("Alice", "Bob", "Charlie"),
                       Note = c(85, 90, 78))

## 2:Affiche la structure du DataFrame avec str().
str(students)
## 3: Sélectionne la colonne des ‘notes et calcule la moyenne.

students$Moyenne <- mean(students$Note)
#apply(students$Note,2,mean)
##4Ajoute une nouvelle colonne Age au DataFrame.
students$Age <- c(18,24,32)
## 5:Sélectionne les lignes où la note est supérieure à 80.
students[students$Note>80,]

#Exercice 4 : Listes en R

## 1 Crée une liste contenant un vecteur de nombres, une chaîne de caractères, et une matrice.
my_list <- list(numbers = c(1, 2, 3),
                name = "Analyse de Données",
                matrix = matrix(1:4, nrow=2))
## 2:Affiche les éléments de la liste individuellement.

## 3: Modifie la valeur du deuxième élément dans le vecteur contenu dans la liste.

## 4: Ajoute un nouvel élément à la liste : un facteur de 3 niveaux.

#Exercice 5 : Facteurs en R
##1:Crée un vecteur de caractères contenant trois fruits : "pomme", "banane","orange".
fruits <- c("pomme", "banane","orange")
##2:Convertis ce vecteur en facteur.
fruits_fac <- as.factor(fruits)
##3:Change le niveau "banane" en "kiwi".
fruits_fac1$ <- fruits_fac$
##4:Affiche les niveaux du facteur et vérifie le résultat.




