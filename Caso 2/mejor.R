mejor <- function(estado,resultado){
        #lectura de datos
         setwd("C:/Users/omar/Desktop/Programacion_Actuarial_III/Caso 2")
         outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
         
             if(!((resultado =="ataque") | (resultado =="falla") | (resultado =="neumonia"))){
                     stop ("Error en padecimiento, probar nuevamente")
                     break
                 }
         
             state <- as.character(outcome$State)
             if(!(estado %in% state)){
                     stop("Error en el estado, probar nuevamente")
                     break
                 }
             ## Regresa el nombre del hospital con la tasa más baja de mortalidad de 30 días
                 if(resultado=="ataque"){
                        causa <- outcome[,11]
                     } else if(resultado=="falla"){
                             causa <- outcome[,17]
                         } else if(resultado=="neumonia"){
                                 causa <- outcome[,23]
                             }
             causa <- suppressWarnings(as.numeric(causa))
             tabla <- data.frame(outcome$Hospital.Name,outcome$State,causa)
             tabla1 <- as.data.frame.numeric(tabla)
             prueba1 <- subset(tabla,outcome$State==estado)
             prueba2 <- prueba1[order(prueba1$causa),]
           
                 hospital <- as.character(prueba2$outcome.Hospital.Name[1])
                 print(hospital)
            }

 mejor("TX", "ataque")
 mejor("TX", "falla")
 mejor("MD", "ataque") 
 mejor("MD", "neumonia")
 mejor("BB", "ataque") 
 mejor("NY", "atakue")
