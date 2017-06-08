##### Lectura de Datos
setwd("C:/Users/omar/Desktop/UCI HAR Dataset")
actividades<- as.character(read.table("activity_labels.txt", sep = "")[,2])
features <- as.character(read.table("features.txt", sep = "")[,2])

setwd("C:/Users/omar/Desktop/UCI HAR Dataset/train")
sujeto1 <- read.table("subject_train.txt", sep = "")
XTrain <- read.table("X_train.txt", sep = "")
YTrain <- read.table("Y_train.txt", sep = "")
YTrain$V1<-as.factor(YTrain$V1)
levels(YTrain$V1)<- actividades

setwd("C:/Users/omar/Desktop/UCI HAR Dataset/test")
sujeto2 <- read.table("subject_test.txt", sep = "")
XTest <- read.table("X_test.txt", sep = "")
YTest <- read.table("Y_test.txt", sep = "")
## 3.-Describir los nombres de las actividades en la base de datos.
YTest$V1<-as.factor(YTest$V1)
levels(YTest$V1)<- actividades

### 1.- Une los datos de test con los de training
train <- cbind.data.frame(sujeto1,YTrain,XTrain)
test <- cbind.data.frame(sujeto2,YTest,XTest)
Datos <- rbind.data.frame(train,test)

## 4.-Etiquetas apropiadas en la base de datos.
colnames(Datos)<-c("Personas","Actividad",features)
Datos <- Datos[order(Datos$`Personas`),]
Datos1 <- grep("meanFreq",colnames(Datos))
Datos <- Datos[,-Datos1]
## 2.-Extrae unicamente las medias y desviacion estandar
Datos2 <- grep("mean",colnames(Datos))
Datos3 <- grep("std",colnames(Datos))
datos4 <- sort(c(1,2,c(Datos2,Datos3)))
Datos <- Datos[,datos4]
#base de datos independiente con el promedio de cada variable para cada actividad y cada sujeto.
# http://rpubs.com/joser/dplyr/ liga de referencia
library(dplyr)
DatosProm <- Datos %>% group_by(Personas, Actividad) %>% summarise_each(funs(mean))
write.table(DatosProm, row.name = FALSE, file = "Promedio de Datos.txt")

