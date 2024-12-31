
rm(list = ls())
#LIBRAIRIE
library(rmarkdown)
library(ggplot2)
library(dplyr)
library(readxl)
library(tidyr)
#Importation des donnees
setwd("C:/Users/FIDEL KPOGHOMOU/Documents/Language R/Analyse des données avec R/Session2/data")
#IMPORTATION DES DONNEE
annual_clim_data <- readxl::read_excel(path = "nasa_data3.xlsx",
                                       na = "NA") %>% 
  mutate(across(T2M_MAX:PRECTOTCORR,~as.numeric(.x)))
summary(annual_clim_data)

annual_clim_data <- annual_clim_data %>% 
  mutate(T2M_MAX = T2M_MAX-273.15,
         T2M_MIN = T2M_MIN-273.15) %>% 
  rename(PCP = PRECTOTCORR,
         MOIS = MM,
         JOUR = DD,
         ANNEE = YEAR) %>%
  drop_na()
summary(annual_clim_data)
##Filterm Arranger
#Epargner les donnees manquantes

annual_clim_data1 <- select(annual_clim_data,-c("WS2M","RH2M")) 


filter_climate_data2 <- filter(annual_clim_data1,
                               NAMES%in% c("Bobo","Boromo","Dori","Ouagadougou"))

ggplot(data =filter_climate_data2,aes(x = NAMES,y = T2M_MAX,color=NAMES))+
  geom_boxplot()+
  labs(x="Stations",
       y="Temperature")
  theme_minimal()+
  theme(axis.text = element_text(face = "bold",
                                 size = 12,
                                 colour = "red",angle = 45),
        legend.position="right",
        legend.background = element_rect(fill = "gray"),
        panel.background = element_line())
##Les facettes
ggplot(data =filter_climate_data2,aes(x = MOIS,y = T2M_MAX,color=NAMES))+
  geom_boxplot()+
  labs(x="Stations",
        y="Temperature")+
  #scale_x_continuous(breaks = 2000:2010)+
  facet_wrap(facets = .~NAMES)+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 90))

filter_climate_data3 <- filter_climate_data2 %>% 
  mutate(MOIS=factor(x=MOIS,levels = 1:12,
                   labels=month.abb),
         NAMES=factor(NAMES))

ggplot(data = filter_climate_data3,aes(x=MOIS,y=T2M_MAX,color=MOIS))+
  geom_boxplot()+
  labs(x="Mois",y="Temperature [°C]",
       title="TEMPERATURE DES STATIONS PAR MOIS")+
  facet_wrap(facets = .~NAMES)+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 90))

group_climate_data <-group_by(filter_climate_data3,ANNEE,NAMES)
sum_climate_data <- summarise(group_climate_data,
                              T2M_MAX=mean(T2M_MAX),
                              T2M_MIN=mean(T2M_MIN),
                              PCP=mean(PCP))


ggplot(data = sum_climate_data,aes(x=ANNEE,y=T2M_MAX,color=NAMES))+
  geom_boxplot()+
  labs(x="Mois",y="Temperature [°C]",
       title="TEMPERATURE DES STATIONS PAR MOIS")+
  facet_wrap(facets = .~NAMES)+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 90))


ggplot(data = sum_climate_data,aes(x = ANNEE,y = T2M_MAX,colour = NAMES))+
  geom_line()+
  labs(y="Temperature max[°C]",title = "Temperature par annee des stations")

ggplot(data = sum_climate_data,aes(x = ANNEE,y = T2M_MAX,colour = NAMES))+
  geom_point()+
  geom_line()+
  labs(y="Temperature max[°C]",title = "Temperature par annee des stations")



