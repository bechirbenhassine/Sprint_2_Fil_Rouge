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

# Tracer de courbes
require(ggplot2)
M.1 <- data.frame(Mort_inval_1, row.names = c("Age25","Age26","Age27","Age28","Age29","Age30","Age31","Age32","Age33",
                                                "Age34","Age35","Age36","Age37","Age38","Age39","Age40","Age41","Age42",
                                                "Age43","Age44","Age45","Age46","Age47","Age48","Age49","Age50","Age51",
                                                "Age52","Age53","Age54","Age55","Age56","Age57","Age58","Age59","Age60",
                                                "Age61","Age62","Age63","Age64"))
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

# Visualisation sous la forme mort_inval.1_t
par(mfrow = c(3, 2))
hist(x = V1 , col = "lightblue",main = "V1_AGE_25" , xlab = "", ylab = "")
hist(x = V2 , col = "orange"   ,main = "V2_AGE_26" , xlab = "", ylab = "")
hist(x = V3 , col = "red"      ,main = "V3_AGE_27" , xlab = "", ylab = "")
hist(x = V4 , col = "violet"   ,main = "V4_AGE_28" , xlab = "", ylab = "")
hist(x = V5 , col = "green2"   ,main = "V5_AGE_29" , xlab = "", ylab = "")
hist(x = V6 , col = "slategray",main = "V6_AGE_30" , xlab = "", ylab = "")

M.2 <- M.1_t[-1,]
head(M.2)
head(Mort_inval_1)
t <- c(0:1:35)
M.3 <- data.frame(M.2,t)
head(M.3)

par(mfrow = c(1, 1))
ggplot(data = M.3, aes(x = t, y = Age25)) + geom_line()

par(mfrow = c(3, 1))
# nuage de points
qplot(t, Age25, data = M.3)
# Ajustement avec la fonction smooth
qplot(t, Age25, data = M.3, geom = "smooth")
#
qplot(t, Age25, data = M.3, geom = "bin2d")

# Superposition des graphes
require(reshape2)
courbe <- melt(M.3[, c("t","Age25","Age26","Age27","Age28","Age29","Age30","Age31","Age32","Age33","Age34","Age35","Age36","Age37","Age38","Age39","Age40","Age41","Age42","Age43","Age44","Age45","Age46","Age47","Age48","Age49","Age50","Age51","Age52","Age53","Age54","Age55","Age56","Age57","Age58","Age59","Age60","Age61","Age62","Age63","Age64")], id="t")
ggplot(courbe, aes(x = t, y = value)) + geom_line(aes(color = variable),size=1)+
theme_minimal()
head(M.3)

# Tentative de modélisation et d'analyse descriptive
# Focus sur des groupes d'individus d'age 25ans 
# Courbe d'évolution de la population
ggplot(data = M.3, aes(x= t ,y = Age25)) + geom_line() + geom_point()

# Calcul des probalités de survie et de décès [25 ; 60]
Lx_25 <- M.3$Age25
m <- length(Lx_25)
p <- matrix(0,m,m); d <- p
for(i in 1:(m-1)){
   p[1:(m-i),i] <-  Lx_25[1+(i+1):m]/Lx_25[i+1]
   d[1:(m-i),i] <- (Lx_25[(1+i):(m)]-Lx_25[(1+i):(m)+1])/Lx_25[i+1]}
diag(d[(m-1):1,]) <- 0
diag(p[(m-1):1,]) <- 0
q <- 1-p
apply(d,2,sum)[1:5]
# Calculons la proba 10P25
p[25,25]
M.3
