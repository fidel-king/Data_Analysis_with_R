##Packages et Manipulation de Données avec R

rm(list = ls())
#PACKAGES
library(tidyr)
library(dplyr)
library(lubridate)
#Importation des donnees
setwd("C:/Users/FIDEL KPOGHOMOU/Documents/Language R/Analyse des données avec R/Session2/data")
##Donnees de type excel de format xlsx
nasa_data <- readxl::read_excel(path = "C:/Users/FIDEL KPOGHOMOU/Documents/Language R/Analyse des données avec R/Session2/data/nasa_data3.xlsx",
                                sheet = "nasa_data3",na = "NA")
#MANIPULATION DES DONNEES
##MANIPULATION DES COLONNES
summary(nasa_data)
#Extraire certaine colonnes
select_data <- select(nasa_data,-c(WS2M,RH2M))
#Changer l'ordre des colonnes

select_data <- select(nasa_data,NAMES,YEAR,MM,DD,PRECTOTCORR,T2M_MIN,T2M_MAX)
#RENOMMER LES COLONNES
rename_data <- rename(select_data,PCP=PRECTOTCORR,
                      TMIN=T2M_MIN,
                      TMAX=T2M_MAX)
summary(rename_data)
#MODIFIER LES COLONNES

mutate_data <- mutate(rename_data,
       TMAX=as.numeric(TMAX),
       TMIN=as.numeric(TMIN),
       PCP=as.numeric(PCP))
mutate_data
#CONVERSION DES TEMPERATURES
mutate_data <- mutate(mutate_data,
                      TMAX=TMAX-273.15,
                      TMIN=TMIN-273.15)
#AJOUTER UNE COLONNE
mutate_data <- mutate(mutate_data,
                      TMEAN=(TMAX+TMIN)/2)
mutate_data <- mutate(mutate_data,
                      DATES=paste(YEAR,MM,DD, sep = "-"))

#MANIPULATION DES LIGNES

##FILTER LES LIGNES
filter_data <- filter(mutate_data,YEAR>2005,YEAR<=2020)
#Extraire le nom d'une station
bobo_data <- filter(filter_data,NAMES=="Bobo")
#Extraire plusieurs station
filter_data2 <- filter(filter_data,NAMES%in%c("Bobo","Dori","Ouagadougou"))
#Extraire donnees manquante
filter_data3 <- filter(filter_data,is.na(TMAX))
#Filtrer sans les donnee manquante
filter_data_NA <- filter(filter_data,
                       !is.na(TMAX),
                       !is.na(TMIN),
                       !is.na(PCP))
summary(filter_data_NA)
#SUPPRIMER TOUTES LES LIGNES DES DONNES MANQUANTES
filter_data5 <- drop_na(filter_data)
##ORDONNER LES DONNES
arrange_data <- arrange(filter_data_NA,TMIN)
tail(arrange_data)
#REGROUPER LES DONNEES
summarise_data <- summarise(arrange_data,
          TMAX=mean(TMAX),
          TMIN=mean(TMIN),
          PCP=mean(PCP))
#REGROUPER PAR ANNEES
group_by_data <- group_by(arrange_data,YEAR)
summarise_data2 <- summarise(group_by_data,
                             TMAX=mean(TMAX),
                             TMIN=mean(TMIN),
                             PCP=mean(PCP))
##REGROUPER PAR ANNEE ET STATION
group_by_data2 <- group_by(arrange_data,NAMES,YEAR)
summarise_data3 <- summarise(group_by_data2,
                             TMAX=mean(TMAX),
                             TMIN=mean(TMIN),
                             PCP=mean(PCP))
##L'OPERATEUR PIP %>%
group_by_data3 <- group_by(arrange_data,NAMES,YEAR) %>% 
  summarise()


