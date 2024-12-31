#NETTOYAGES DU REPERTOIRE
rm(list = ls())
#INSTALLATION DES PACKAGES
library(ggplot2)
library(dplyr)
library(readxl)

#FIXER LE REPERTOIRE
setwd("C:/Users/FIDEL KPOGHOMOU/Documents/Language R/Analyse des données avec R/Session2/data")
#IMPORTATION DES DONNEE
annual_clim_data <- readxl::read_excel(path = "annual_clim_data.xlsx")
summary(annual_clim_data)

##Nuange de point
ggplot(data = annual_clim_data,aes(x = YYYY,y = TMAX))+
  geom_point(color="blue",size=2.5,alpha=0.5)
##Varier les couleurs en fonction des stations
ggplot(data = annual_clim_data,aes(x = YYYY,y = TMAX,color=STATION))+
  geom_point(size=2.5,alpha=0.5)+
  xlab("ANNEES")+
  ylab("TEMPERATURE [°C]")+
  scale_x_continuous(breaks = 2000:2010)
##Courbe
ggplot(data = annual_clim_data,aes(x = YYYY,y = TMAX,color=STATION))+
  geom_line()+
  geom_point()+
  xlab("ANNEES")+
  ylab("TEMPERATURE [°C]")+
  scale_x_continuous(breaks = 2000:2010)
#Relation entre la temperature et la precipitation
ggplot(data = annual_clim_data,aes(x = PCP,y = TMAX,color=STATION))+
  geom_point(size=2.5,alpha=0.5,shape=8)+
  xlab("ANNEES")+
  ylab("TEMPERATURE [°C]")+
  scale_x_continuous(breaks = 2000:2010)
##Bar
annual_clim_data2 <- filter(annual_clim_data,
                            STATION%in% c("Bobo","Boromo","Ouagadougou"))

gplot(data = annual_clim_data2,aes(x = YYYY,y = TMAX,color=STATION))+
  geom_bar(stat = "identity",position = "dodge")+
  #geom_point()+
  xlab("ANNEES")+
  ylab("TEMPERATURE [°C]")+
  scale_x_continuous(breaks = 2000:2010)
##Boxplot
ggplot(data = annual_clim_data2,aes(x = YYYY,y = TMAX,color=STATION))+
  #geom_point(size=2.5,alpha=0.5)+
  geom_boxplot()+
  xlab("ANNEES")+
  ylab("TEMPERATURE [°C]")+
  scale_x_continuous(breaks = 2000:2010)
