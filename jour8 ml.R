##MACHINE LEARNING

##NETTOYAGE
rm(list = ls())

##PACKAGES
library(car)
library(dplyr) ##Manipulation
library(corrplot)
library(tidyr)
library(RSQLite)
library(Metrics)
library(caTools)
library(ranger)
library(hydroGOF)
library(ggplot2)
library(lattice)
library(caret)
##REPERTOIRE DE TRAVAIL
setwd("C:/Users/FIDEL KPOGHOMOU/Documents/Language R/Analyse des données avec R/Session2/data")

#IMPORTATION DES DONNEES
##Connexion a le base de donnee
#con <- dbConnect(drv = RSQLite::SQLite(),dbname="database.sqlite")
#dbListTables(con)
#dbGetQuery(con,statement = "SELECT * climate_data")
#EXploration des donnees
climate_data <- read.table(file = "climate_data.csv",header = TRUE,
                           sep = ",")

#Nettoyage
climate_data2 <- climate_data %>% 
  select(-Date,-Rg) %>% 
  drop_na()
summary(climate_data2)

matrix_corr <- cor(climate_data2)
corrplot(matrix_corr)

#Ajustement du modele de regression lineaire
##Separation des donnees en donnee d'entrainement et de test
###Donnee d'entrainement
set.seed(123)

line_num_train <- sample(x=1:17166, size = 13733)

line_num_test <- !(1:17166 %in% line_num_train)

train_data <- climate_data2[line_num_train,]
test_data <- climate_data2[line_num_test]

lm_model <- lm(formula = ETO~TMax+TMin+HMax+HMin+HMoy+Vt+Ins,
               data = train_data)
#Apercu du modele
summary(lm_model)

pred.data <- climate_data2 %>% 
  select(-ETO)
#Evaluation du modele

train_data$pred <- predict(lm_model,train_data)
test_data$pred <- predict(lm_model,test_data)
##METRICS

Metrics::rmse(actual =train_data$ETO,predicted = climate_data2$pred )
#Pourcentage de biais
Metrics::percent_bias(actual =climate_data2$ETO,predicted = climate_data2$pred)
cor(train_data$ETO,test_data$pred)
cor(test_data$ETO,train_data$pred)
##VISUALISATION

ggplot(data = train_data,aes(x = ETO,y = pred))+
  geom_point()+
  geom_abline(intercept = 0,slope = 1)

#SAUVEGARDER LE MODELE
saveRDS(object = lm_model,file = "linear_model.rds")

###########    REGRESSION LOGISTIQUE      ############

#Fixation du repertoire
setwd("C:/Users/FIDEL KPOGHOMOU/Documents/Language R")
#Importation du dataset
sante <- read.table(file = "data.csv",header = TRUE,sep = ",",dec = "." )

#TRAITEMENT DE DONNEES
##Changer les noms des colonnes
colnames(sante) <- c("Age","Sexe","Cp","Tresrbps","Chol","Fbs","Restecg","Thalach","Exang","Oldspeak",
                     "Slope","Ca","Thal","Target")
sante2 <- sante %>% 
  select(Age,Tresrbps,Chol,Thalach,Oldspeak,Target) %>% 
  mutate(across())






