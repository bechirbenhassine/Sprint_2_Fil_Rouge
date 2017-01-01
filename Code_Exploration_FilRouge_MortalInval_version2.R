# Importation des fichiers
require(data.table)
Mort_inval_1 <- read.table("C:/Users/Pierre HERIAUT/Desktop/Suite_FilRouge/MortaInval V3bis_1.csv", sep=";", header = TRUE)

#Exploration des données
head(Mort_inval_1)
str(Mort_inval_1)
dim(Mort_inval_1)
summary(Mort_inval_1)

# Visualisation des données
# Histogrammes
attach(Mort_inval_1)
par(mfrow = c(3, 2))
hist(x = Age , col = "lightblue",main = "AGE", xlab = "", ylab = "")
hist(x = N_0 , col = "orange"   ,main = "t0" , xlab = "", ylab = "")
hist(x = N_1 , col = "red"      ,main = "t1" , xlab = "", ylab = "")
hist(x = N_2 , col = "violet"   ,main = "t2" , xlab = "", ylab = "")
hist(x = N_3 , col = "green2"   ,main = "t3" , xlab = "", ylab = "")
hist(x = N_4 , col = "slategray",main = "t4" , xlab = "", ylab = "")
detach(Mort_inval_1)

# Nuage de points
par(mfrow = c(1, 3))
pairs(Mort_inval_1[,1 : 5])
pairs(Mort_inval_1[,6 :10])
pairs(Mort_inval_1[,11:15])
# Histogrammes
# Visualisation sous la forme mort_inval.1_t
par(mfrow = c(3, 2))
hist(x = V1 , col = "lightblue",main = "V1_AGE_25" , xlab = "", ylab = "")
hist(x = V2 , col = "orange"   ,main = "V2_AGE_26" , xlab = "", ylab = "")
hist(x = V3 , col = "red"      ,main = "V3_AGE_27" , xlab = "", ylab = "")
hist(x = V4 , col = "violet"   ,main = "V4_AGE_28" , xlab = "", ylab = "")
hist(x = V5 , col = "green2"   ,main = "V5_AGE_29" , xlab = "", ylab = "")
hist(x = V6 , col = "slategray",main = "V6_AGE_30" , xlab = "", ylab = "")


# Traitement des données brutes
M.1 <- data.frame(Mort_inval_1, row.names = c("Lx25","Lx26","Lx27","Lx28","Lx29","Lx30","Lx31","Lx32","Lx33",
                                                "Lx34","Lx35","Lx36","Lx37","Lx38","Lx39","Lx40","Lx41","Lx42",
                                                "Lx43","Lx44","Lx45","Lx46","Lx47","Lx48","Lx49","Lx50","Lx51",
                                                "Lx52","Lx53","Lx54","Lx55","Lx56","Lx57","Lx58","Lx59","Lx60",
                                                "Lx61","Lx62","Lx63","Lx64"))
head(M.1)                          
M.1_t <- t(data.frame(M.1))
M.1_t <- data.table(M.1_t)
head(M.1_t)
M.1_t <- data.frame(M.1_t, row.names = c("Age","N_0","N_1","N_2","N_3","N_4","N_5",
                                                         "N_6","N_7","N_8","N_9","N_10","N_11","N_12",
                                                      "N_13","N_14","N_15","N_16","N_17","N_18","N_19",
                                                      "N_20","N_21","N_22","N_23","N_24","N_25","N_26",
                                                      "N_27","N_28","N_29","N_30","N_31","N_32","N_33",
                                                      "N_34","N_35"))

head(M.1_t)
summary(M.1_t)

M.2 <- M.1_t[-1,]
head(M.2)
head(Mort_inval_1)
#T <- c(25:60)
T <- c(0:35)
M.3 <- data.frame(M.2,T)
head(M.3)

# Data visualisation des données M.2
# Nuage de points
par(mfrow = c(1, 3))
pairs(M.2[,1 :5] , col = M.2$Lx25)
pairs(M.2[,6 :12], col = M.2$Lx25)
pairs(M.2[,15:20], col = M.2$Lx25)
pairs(M.2[,35:40], col = M.2$Lx25)

# Corrélation des variables: Représentation sous forme d'histogrames
attach(M.2)
par(mfrow = c(3, 2))
hist(x = Lx25 , col = "lightblue",main = "To 25 ans" , xlab = "", ylab = "")
hist(x = Lx26 , col = "orange"   ,main = "T1 26 ans" , xlab = "", ylab = "")
hist(x = Lx27 , col = "red"      ,main = "T2 27 ans" , xlab = "", ylab = "")
hist(x = Lx28 , col = "violet"   ,main = "T3 28 ans" , xlab = "", ylab = "")
hist(x = Lx29 , col = "green2"   ,main = "T4 29 ans" , xlab = "", ylab = "")
hist(x = Lx30 , col = "slategray",main = "T5 30 ans" , xlab = "", ylab = "")
detach(M.2) 


# Représentation des courbes d'évolution
require(ggplot2)

# Superposition des graphes d'évolution de la dynamique
require(reshape2)
courbe <- melt(M.3[, c("T","Lx25","Lx26","Lx27","Lx28","Lx29","Lx30","Lx31","Lx32","Lx33","Lx34","Lx35","Lx36","Lx37","Lx38","Lx39","Lx40","Lx41","Lx42","Lx43","Lx44","Lx45","Lx46","Lx47","Lx48","Lx49","Lx50","Lx51","Lx52","Lx53","Lx54","Lx55","Lx56","Lx57","Lx58","Lx59","Lx60","Lx61","Lx62","Lx63","Lx64")], id="T")
ggplot(courbe, aes(x = T, y = value)) + geom_line(aes(color = variable),size=1)+
theme_minimal()
head(M.3)
# Cela semble montrer 4 classes d'évolution [25,30] ; [31 ,45] ; [46,53] ; [53,64] 
# Représentons les
courbe_a <- melt(M.3[, c("T","Lx25","Lx26","Lx27","Lx28","Lx29","Lx30","Lx31","Lx32","Lx33","Lx34","Lx35")], id="T")
ggplot(courbe_a, aes(x = T, y = value)) + geom_line(aes(color = variable),size=1)+
  theme_minimal()
head(M.3)

# 
courbe_b <- melt(M.3[, c("T","Lx36","Lx37","Lx38","Lx39","Lx40","Lx41","Lx42","Lx43","Lx44")], id="T")
ggplot(courbe_b, aes(x = T, y = value)) + geom_line(aes(color = variable),size=1)+
  theme_minimal()
head(M.3)

#
courbe_c <- melt(M.3[, c("T","Lx45","Lx46","Lx47","Lx48","Lx49","Lx50","Lx51","Lx52","Lx53","Lx54")], id="T")
ggplot(courbe_c, aes(x = T, y = value)) + geom_line(aes(color = variable),size=1)+
  theme_minimal()
head(M.3)

#
courbe_d <- melt(M.3[, c("T","Lx55","Lx56","Lx57","Lx58","Lx59","Lx60","Lx61","Lx62","Lx63","Lx64")], id="T")
ggplot(courbe_d, aes(x = T, y = value)) + geom_line(aes(color = variable),size=1)+
  theme_minimal()
head(M.3)

# Analyse des classes d'age les plus pertinentes 
modele.glm <- glm(Lx25 ~., data = M.3, family = "poisson")
summary(modele.glm)
require(MASS)
modele.stepwise <- stepAIC(modele.glm , direction = "both")
summary(modele.stepwise)

# L'analyse de la survie semble etre pertinent sur les individus d'age 25, 26 et 37
# Tracer de la courbe de survie
# require(reshape2)
courbe.1 <- melt(M.3[, c("T","Lx25","Lx26","Lx37")], id="T")
ggplot(courbe.1, aes(x = T, y = value)) + geom_line(aes(color = variable),size=1) + theme_minimal()



# Tentative de modélisation et d'analyse descriptive
# Focus sur des groupes d'individus d'age 25ans 
# Courbe d'évolution de la population
ggplot(data = M.3, aes(x = T, y = Lx25)) + geom_line()

qplot(T, Lx25, data = M.3)
# Ajustement avec la fonction smooth
qplot(T, Lx25, data = M.3, geom = "smooth")
#
qplot(T, Lx25, data = M.3, geom = "bin2d")

ggplot(data = M.3, aes(x= T ,y = Lx32)) + geom_line() + geom_point()

# Calcul des probalités de survie et de décès [25 ; 60]
Lx_25 <- M.3$Lx25
m <- length(Lx_25)
p <- matrix(0,m,m); d <- p
for(i in 1:(m-1)){
   p[1:(m-i),i] <-  Lx_25[1+(i+1):m]/Lx_25[i+1]
   d[1:(m-i),i] <- (Lx_25[(1+i):(m)]-Lx_25[(1+i):(m)+1])/Lx_25[i+1]}
diag(d[(m-1):1,]) <- 0
diag(p[(m-1):1,]) <- 0
q <- 1-p
apply(d,2,sum)[1:10]
# Calculons la proba 1P1 proba qu'un individu d'age 25 vivve jusqu'à 26ans
p[1,1]
M.3

# Verification de la proba kPx  x=1 > AGE+1 ; + k=10     1 à 35
# si on se focalise sur lx25: evolution de la population sur un groupe d'individus d'age 25ans 
# la proba qu'un individu de cette echantillon vive 5ans et soit donc agé de 30ans 5P0 
x<-1
h<-1
M.3$Lx25[M.3$T==x+h]/M.3$Lx25[M.3$T==x]  
M.3$Lx25[x+h+1]/M.3$Lx25[x+1] 

# Fonction de vie résiduelle et espérance de vie ( par exemple à 26ans : esp.vie(1))
esp.vie=function(x){sum(p[1:nrow(p),x])} 
esp.vie(1) 




# Tentative de la création d'un modéle d'analyse de la dynamique de la pop sur les individus d'age 25
TABLE_mortalité_25 <- data.frame(M.3$Lx25,T)
# 

# Calcul des probabilités et espérance de vie à l'aide de la librairie "lifecontingencies"
library(lifecontingencies)
TM_25 <- new("lifetable",x=M.3$T,lx=M.3$Lx25,name="TM_25")

#Extraction de 1P1
pxt(TM_25,x=1,t=1) 
qxt(TM_25, x = 1, t=1)
# Tracer de la loi de survie
TABLE_mortalité_25 <- data.frame(M.3$Lx25,T)
