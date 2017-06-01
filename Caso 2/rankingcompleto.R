rankingcompleto <- function(resultado,num="mejor"){
        #lectura de datos
         setwd("C:/Users/omar/Desktop/Programacion_Actuarial_III/Caso 2")
        outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
            if(!((resultado =="ataque") | (resultado =="falla") | (resultado =="neumonia"))){
                    stop ("Resultado invalido probar nuevamente")
                    break
                }
            if(resultado=="ataque"){
                causa <- outcome[,11]
            } else if(resultado=="falla"){
                    causa <- outcome[,17]
                } else if(resultado=="neumonia"){
                        causa <- outcome[,23]
                    }
        Result <- c()
        state <- unique(as.character(outcome$State))
        causa <- suppressWarnings(as.numeric(causa))
        Hospital <- suppressWarnings(as.character(outcome$Hospital.Name))
        
            tabla <- data.frame(outcome$Hospital.Name,outcome$State,causa)
            tabla1 <- tabla[order(tabla$outcome.Hospital.Name),]
            tabla2 <- tabla1[order(tabla1$outcome.State),]
        
                for(est in 1:length(state)){
                    prueba1 <- subset(tabla2,tabla2$outcome.State == state[est])
                    prueba2 <- prueba1[order(prueba1$causa),]   
                    prueba3 <- prueba2[complete.cases(prueba2),]
                    
                        if(num == "mejor"){
                                hs <- prueba3$outcome.Hospital.Name[1]
                            }else if(num =="peor"){
                                    hs <- prueba3$outcome.Hospital.Name[nrow(prueba3)]
                                }else if(num > nrow(prueba3)){
                                        hs <- "<NA>"
                                    }else if((num <= nrow(prueba3)) | (num == "")){
                                            hs <- prueba3$outcome.Hospital.Name[num]
                                        }
                    hs <- as.character(hs)
                    Result <- append(Result, c(hs,state[est]))
                }
            ResultFinal <- as.data.frame(matrix(Result, length(state), 2, byrow = TRUE))
            colnames(ResultFinal) <- c("Hospital", "Estado")
            rownames(ResultFinal) <- state
            ResultFinal <- ResultFinal[order(ResultFinal$Estado),]
            ResultFinal
        }    

head(rankingcompleto("ataque", 20), 10)
tail(rankingcompleto("neumonia", "peor"), 3)
tail(rankingcompleto("falla"), 10) 
