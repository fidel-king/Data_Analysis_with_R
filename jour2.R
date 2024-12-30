rm(list = ls())
#Creation des vecteurs
Chimie <- c(12,10,18,15,18,11,15.50,17,12)
Physique <- c(19,10,14,12.70,15,11,14,16,12)
Maths <- c(10,16,18,14.50,14,16,18,19,15)

##Indexing

Maths[5]
Chimie[8] #Extraire l'element 8
Physique[length(Physique)] #Dernier element

#Slicing
Maths[3:7] #de l'element 3 a 8
#Extraction conditionnelle
Maths[Maths>14] # Note superieur a 14
Chimie[Chimie<=18 & Chimie>=14]
Physique[c(3,8)]
#MATRICE
matrice <- matrix(data = Maths,nrow = 3,ncol = 3)
matrice

notes <- matrix(c(Maths,Chimie,Physique),ncol = 3)
notes
colnames(notes) <- c("Maths","Chimie","Physique")
notes

#Indexing
notes[,2] #Notes de la colonne 2
notes[8,] #notes de la ligne 1

#Scicing
notes[3:8,] #De la ligne 3 a 8
notes[notes[,2]>15,] #note chimie sup a 15
notes[2:7,2:3] #de la ligne 2 a 7 et de la colonne 1 a 2
moyenne <- rowMeans(notes)
moyenne <- round(moyenne,2)
#DATAFRAMe

noms <- c("Moussa","Fidel","Fode","Divine",
          "Arnaud","Justin","Teindan","Joseph","Pelagie")
df_noms <- data.frame(Noms=c("Moussa","Fidel","Fode","Divine",
                             "Arnaud","Justin","Teindan","Joseph","Pelagie"),
                      age=c(12,10,18,15,18,11,15.50,17,12),
                        ville=Physique,
                        N_math=Maths)
attach(df_noms)

df_noms$Moyenne <- moyenne

#STRUCTURE DE CONTROLE

x <- moyenne[2]
if (x>14) {
  print("Admis")
  
}else{
  print("Reprise")
}

#BOUCLE
for (i in moyenne){
  if (i >= 12) {
    print(paste0(i, ":", "Admis"))
    
  }else{
    print(paste0(i, ":", "Reprise"))
  }
  
}



