library(ggplot2)

data <- read.csv(file = 'path of database')


# TABLA ANÁLISIS POR EDAD 
max_edad <- as.numeric(max(data[,4]))
min_edad <- as.numeric(min(data[,4]))
media <- mean(data[,4])
mediana <- median(data[,4])
dev_est <- sd(data[,4])
varianza <- var(data[,4], na.rm = FALSE)

sum(data[,7])


# GRÁFICA ANÁLISIS POR EL GÉNERO
M <- 0
Fem <- 0

for(i in data[,3])
  if(i == "Masculino")
    M <- M+1

for(i in data[,3])
  if(i == "Femenino")
    Fem <- Fem+1

daTa <- data.frame(
  Género=c("Masculino","Femenino") ,
  Cantidad=c(M,Fem)
)

ggplot(daTa,aes(x=Género, y=Cantidad)) + 
  geom_bar(stat = "identity",color="blue",fill="blue")


# GRÁFICA ANÁLISIS POR RANGOS DE EDAD
Edad <- data[,4] 
hist(Edad,main="Histograma de edad",col="lightblue",border="black",xlab = "Edad",ylab="Cantidad")


boxplot(data[,4],
        main = "Boxplot de edad",
        xlab = "Edad",
        ylab = "",
        col = "orange",
        border = "brown",
        horizontal = TRUE,
        notch = TRUE
)


# GRÁFICA ANÁLISIS POR EL TIPO DE ACCIDENTE
Caida <- 0  
Ciclista <- 0
Colision <- 0
ColisionFija <- 0
ColisionAnimales <- 0
ColisionMovil <- 0
PeatonAtro <- 0
SinDatos <- 0
Volcamiento <- 0

for (i in data[,2])
  if (i == "Caída de Ocupante" ){
    Caida <- Caida + 1
  }else if(i == "Ciclista Atropellado"){
    Ciclista <- Ciclista + 1 
  }else if (i == "Colisión"){
    Colision <- Colision + 1
  }else if (i == "Colisión con Objeto Fijo" || i == "Colisión"){
    ColisionFija <- ColisionFija + 1
  }else if (i == "Colisión con animales"){
    ColisionAnimales <- ColisionAnimales + 1
  }else if (i == "Colisión con objeto movil" ||i == "Colisión con Objeto Móvil"){
    ColisionMovil <- ColisionMovil + 1
  }else if (i == "Peatón Atropellado"){
    PeatonAtro <- PeatonAtro + 1
  }else if(i == "Sin Dato"){
    SinDatos <- SinDatos + 1    
  }else{
    Volcamiento <- Volcamiento + 1
  }

library(ggplot2)
graficoCausa <- data.frame(
  Causa=c("Caída Ocupante","Ciclista Atropellado","Colisión","Colisión con Objeto fijo","Colisión con animales","Colisión con objeto móvil",
          "Peatón Atropellado","Sin Datos","Volcamiento") ,  
  val=c(Caida,Ciclista,Colision,ColisionFija,ColisionAnimales,ColisionMovil,PeatonAtro,SinDatos,Volcamiento)
)

ggplot(graficoCausa, aes(x=Causa, y=val)) + 
  geom_bar(stat = "identity",color="green",fill="lightgreen") + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


# GRAFICA ANÁLISIS DE LAS CARACTERÍSTICAS DE LA VÍCTIMA
ConVehiculo <- 0 # Conductores de auto 
Ciclista <- 0
Motociclista <- 0
Peatones <- 0
Pasajeros <- 0 # Pasajeros ya sean de un auto o moto 
sinDatos <- 0
otro <- 0 # Datos no considerados/otros 



for (i in data[,5])
  if (i == "Conductor Veh?culo" || i == "Conductor Vehículo" ){
    ConVehiculo <- ConVehiculo + 1
  }else if(i == "Ciclista"){
    Ciclista <- Ciclista + 1 
  }else if (i == "Conductor Moto"){
    Motociclista <- Motociclista + 1
  }else if (i == "Peat?n"||i == "Peaton"||i == "Peatón"){
    Peatones <- Peatones + 1
  }else if (i == "Pasajero Moto" ||i == "Pasajero Vehiculo" ||i == "Pasajero Vehículo"){
    Pasajeros <- Pasajeros + 1
  }else if(i == "Sin Dato"){
    sinDatos <- sinDatos + 1    
  }else{
    otro <- otro + 1
  }

library(ggplot2)
graficoVictimas <- data.frame(
  Victimas=c("Conductor","Ciclistas","Motociclistas","Peatones","Pasajeros","Sin Datos","Otros") ,  
  val=c(ConVehiculo,Ciclista,Motociclista,Peatones,Pasajeros,sinDatos,otro)
)

ggplot(graficoVictimas,aes(x=Victimas, y=val)) + 
  geom_bar(stat = "identity",color="green",fill="lightgreen")

library(chron)

hours <- chron(times=data[,2])

hours
table(hours(hours))
hours[1]

data[,"franja"] <- ifelse(hours(hours)<=5,"Madrugada",
                          ifelse(hours(hours)<=12,"Mañana",
                                 ifelse(hours(hours)<=18,"Tarde","Noche")))


table(data[,"franja"])
barplot(table(data[,"franja"]))
boxplot(hours(hours))

data[,"Hora_de_hora"] <- ifelse(hours(hours)<=0,0,
                               ifelse(hours(hours)<=1,1,
                                      ifelse(hours(hours)<=2,2,
                                             ifelse(hours(hours)<=3,3,
                                                    ifelse(hours(hours)<=4,4,
                                                           ifelse(hours(hours)<=5,5,
                                                                  ifelse(hours(hours)<=6,6,
                                                                         ifelse(hours(hours)<=7,7,
                                                                                ifelse(hours(hours)<=8,8,
                                                                                       ifelse(hours(hours)<=9,9,
                                                                                              ifelse(hours(hours)<=10,10,
                                                                                                     ifelse(hours(hours)<=11,11,
                                                                                                            ifelse(hours(hours)<=12,12,
                                                                                                                   ifelse(hours(hours)<=13,13,
                                                                                                                          ifelse(hours(hours)<=14,14,
                                                                                                                                 ifelse(hours(hours)<=15,15,
                                                                                                                                        ifelse(hours(hours)<=16,16,
                                                                                                                                               ifelse(hours(hours)<=17,17,
                                                                                                                                                      ifelse(hours(hours)<=18,18,
                                                                                                                                                             ifelse(hours(hours)<=19,19,
                                                                                                                                                                    ifelse(hours(hours)<=20,20,
                                                                                                                                                                           ifelse(hours(hours)<=21,21,
                                                                                                                                                                                  ifelse(hours(hours)<=22,22,
                                                                                                                                                                                         ifelse(hours(hours)<=23,23,24))))))))))))))))))))))))


media_hora <- mean(as.integer(hours(hours)),na.rm = TRUE)
mediana_hora <- median(as.numeric(hours(hours)),na.rm = TRUE)
dev_est_hora <- sd(as.numeric(hours(hours)),na.rm = TRUE)
varianza_hora <- var(data[,5], na.rm = FALSE)

area_t<-function(x=0,gl){
  t<-seq(-4,4,0.01)
  fdp<-dt(t,gl)
  plot(t,fdp,type="l")
  polygon(c(t[t>=x],x),c(fdp[t>=x],fdp[t==4]),col="blue")
}

t.test(data[,"Edad"],alternative = "less",mu=40)

area_t(1.3807,472)

t.test(data[,"Hora_de_hora"],alternative = "less",mu=12)

t.test(data[,"id_del_vehiculo"])

area_t(-8.15,472)


regresion <- lm(data[,"Hora_de_hora"]~data[,"Edad"])
summary(regresion)
plot(data[,"Edad"],data[,"Hora_de_hora"],xlab="Edad",ylab="Hora")
abline(regresion)


table(data[,3])
data[,"id_de_accidente"] <- ifelse(data[,3] == "CaÃ­da de Ocupante",1,
                              ifelse(data[,3] == "Ciclista Atropellado",2,
                                 ifelse(data[,3] == "ColisiÃ³n ",3,
                                        ifelse(data[,3]=="ColisiÃ³n con animales",4,
                                               ifelse(data[,3] == "ColisiÃ³n con objeto fijo",5,
                                                      ifelse(data[,3] == "ColisiÃ³n con Objeto Fijo",5,
                                                             ifelse(data[,3] == "ColisiÃ³n con objeto mÃ³vil",6,
                                                                    ifelse(data[,3] == "ColisiÃ³n con Objeto MÃ³vil",6,
                                                                           ifelse(data[,3] == "ColisiÃ³n con objeto movil",6,
                                                                                  ifelse(data[,3] == "Otra Clase de Accidente",7,
                                                                                         ifelse(data[,3] == "PeatÃ³n Atropellado",8,
                                                                                                ifelse(data[,3] == "Sin Dato",9,10))))))))))))
table(data[,7])
data[,"id_del_vehiculo"] <- ifelse(data[,7] == "AutÃ³nomo (PeatÃ³n)",1,
                                   ifelse(data[,7] == "Bicicleta",2,
                                          ifelse(data[,7] == "CamiÃ³n/Camioneta",3,
                                                 ifelse(data[,7]=="Lancha/otro",4,
                                                        ifelse(data[,7] == "Microbus/BusetÃ³n",5,
                                                               ifelse(data[,7] == "Motocicleta",6,
                                                                      ifelse(data[,7] == "No aplica",7,
                                                                             ifelse(data[,7] == "Sin dato",8,
                                                                                    ifelse(data[,7] == "Taxi",9,10)))))))))

regresion <- lm(data[,"id_de_accidente"]~data[,"Edad"])
summary(regresion)
plot(data[,"Edad"],data[,"id_de_accidente"],xlab="Edad",ylab="id_accidente")
abline(regresion)

regresion <- lm(data[,"id_del_vehiculo"]~data[,"Edad"])
summary(regresion)
plot(data[,"Edad"],data[,"id_del_vehiculo"],xlab="Edad",ylab="id_vehiculo")
abline(regresion)

regresion <- lm(data[,"id_del_vehiculo"]~data[,"Hora_de_hora"])
summary(regresion)
plot(data[,"Hora_de_hora"],data[,"id_del_vehiculo"],xlab="Edad",ylab="id_vehiculo")
abline(regresion)

regresion <- lm(data[,"id_de_accidente"]~data[,"Hora_de_hora"])
summary(regresion)
plot(data[,"Hora_de_hora"],data[,"id_de_accidente"],xlab="Edad",ylab="id_vehiculo")
abline(regresion)

regresion <- lm(data[,"Hora_de_hora"]~data[,"Edad"])
summary(regresion)
plot(data[,"Edad"],data[,"Hora_de_hora"],xlab="Edad",ylab="id_vehiculo")
abline(regresion)



#################################esto de abajo esta choneto pero lo dejo 
#################################para que vean que en 11 lineas sale todo lo de abajo
# count <- 1
# cero <- 0
# una <- 0
# dos <- 0
# tres <- 0
# cuatro <- 0
# cinco <- 0
# seis <- 0
# siete <- 0
# ocho <- 0
# nueve <- 0
# diez <- 0
# once <- 0
# doce <- 0
# trece <- 0
# catorce <- 0
# quince <- 0
# dieciseis <- 0
# diecisiete <- 0
# dieciocho <- 0
# diecinueve <- 0
# veinte <- 0
# veintiuno <- 0
# veintidos <- 0
# veintitres <- 0 
# veinticuatro <- 0
# noaplica <- 0
# 
# for (i in 1:473)
#   if (hours(hours[count]) == 0){
#     cero <- cero+1
#     count <- count+1
#   }else if (hours(hours[count]) == 1){
#     una <- una+1
#     count <- count+1
#   }else if (hours(hours[count]) == 2){
#     dos <- dos+1
#     count <- count+1
#   }else if (hours(hours[count]) == 3){
#     tres <- tres+1
#     count <- count+1
#   }else if (hours(hours[count]) == 4){
#     cuatro <- cuatro+1
#     count <- count+1
#   }else if (hours(hours[count]) == 5){
#     cinco <- cinco+1
#     count <- count+1
#   }else if (hours(hours[count]) == 6){
#     seis <- seis+1
#     count <- count+1
#   }else if (hours(hours[count]) == 7){
#     siete <- siete+1
#     count <- count+1
#   }else if (hours(hours[count]) == 8){
#     ocho <- ocho+1
#     count <- count+1
#   }else if (hours(hours[count]) == 9){
#     nueve <- nueve+1
#     count <- count+1
#   }else if (hours(hours[count]) == 10){
#     diez <- diez+1
#     count <- count+1
#   }else if (hours(hours[count]) == 11){
#     once <- once+1
#     count <- count+1
#   }else if (hours(hours[count]) == 12){
#     doce <- doce+1
#     count <- count+1
#   }else if (hours(hours[count]) == 13){
#     trece <- trece+1
#     count <- count+1
#   }else if (hours(hours[count]) == 14){
#     catorce <- catorce+1
#     count <- count+1
#   }else if (hours(hours[count]) == 15){
#     quince <- quince+1
#     count <- count+1
#   }else if (hours(hours[count]) == 16){
#     dieciseis <- dieciseis+1
#     count <- count+1
#   }else if (hours(hours[count]) == 17){
#     diecisiete <- diecisiete+1
#     count <- count+1
#   }else if (hours(hours[count]) == 18){
#     dieciocho <- dieciocho+1
#     count <- count+1
#   }else if (hours(hours[count]) == 19){
#     diecinueve <- diecinueve+1
#     count <- count+1
#   }else if (hours(hours[count]) == 20){
#     veinte <- veinte+1
#     count <- count+1
#   }else if (hours(hours[count]) == 21){
#     veintiuno <- veintiuno+1
#     count <- count+1
#   }else if (hours(hours[count]) == 22){
#     veintidos <- veintidos+1
#     count <- count+1
#   }else if (hours(hours[count]) == 23){
#     veintitres <- veintitres+1
#     count <- count+1
#   }else if (hours(hours[count]) == 24){
#     veinticuatro <- veinticuatro+1
#     count <- count+1
#   }else{
#     noaplica<-noaplica+1
#     count <- count+1
#   }

