rm(list = ls())
#Importation des donnees
setwd("C:/Users/FIDEL KPOGHOMOU/Documents/Language R/Analyse des données avec R/Session2/data")
#Fichier txt
pcp_bobo <- read.table(file = "pcp_bobo.txt",header = TRUE,sep = "," )

#Fichier csv
tmp_bobo <- read.table(file = "tmp_bobo.csv",header = TRUE,sep = ",")

#Consulter le contenu du repertoire
dir()
#Automatiser l'importation
list_fichier <- dir()
#Afficher le fichier 4
list_fichier[4]
#Importation automatique
pcp_bobo1 <- read.table(file = list_fichier[4],header = TRUE,sep = "," )
#Filter l'importation
dir(pattern = "*.txt")
#Fusionner les 2 tableau par colonne
climate_data <- cbind(tmp_bobo,pcp_bobo)
#Supprimer les doublons
climate_data <- climate_data[,-c(6,7,8,9,11)]
#Exploration 
dim(climate_data) #Dimension
colnames(climate_data) #nom des colonnes
summary(climate_data)
##Filterm Arranger
#Epargner les donnees manquantes

climate_data2 <- climate_data[!is.na(climate_data$T2M_MAX),]
summary(climate_data2)

#Sauvegarger
write.table(x = climate_data2,file = "donnees_climatic.csv",
            sep = ",",dec = ".",row.names = FALSE)

