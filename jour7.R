#NETTOYAGE DE L'ENVIRONNEMENT
rm(list = ls())
#LIBRAIRIE
library(DBI)
library(RSQLite)
library(dplyr)
library(gapminder)
library(tidyr)
library(datasets)
#DIRECTION REPERTOIRE
setwd("C:/Users/FIDEL KPOGHOMOU/Documents/Language R/Analyse des données avec R/Session2")
#CREATION DE LA BASE DE DONNEE
con <- dbConnect(drv = RSQLite::SQLite(),dbname="databaser.sqlite")
dbListTables(con)


#CREATION DE TABLE
dbExecute(conn = con,statement = "CREATE TABLE clients(
id INTEGER PRIMARY KEY,
          nom TEXT,
          age INTEGER,
          ville TEXT
          )
          ")

dbListTables(con)
#SUPPRESSSION DE LA TABLE


#INSERTION DE DONNEES
dbExecute(conn = con,
          statement = "INSERT INTO clients(nom, age, ville)
          VALUES('Moussa',30,'Parie'),
          ('Fidel',29,'Kankan'),
          ('Fode',19,'Labe')
          ")
dbListTables(con)



clients <- data.frame(nom=c("Moussa","Fidel","Fode","Divine",
                             "Arnaud","Justin","Teindan","Joseph","Pelagie"),
                      age=c(12,10,18,15,18,11,15.50,17),
                      ville=c("Lagos","Le Caire", "Kinshasa", "Johannesburg", 
                              "Nairobi", "Addis-Abeba", "Dakar", "Abidjan", "Casablanca")

#INSERTION DE 

#INSERTION DE 

#INSERTION DE 