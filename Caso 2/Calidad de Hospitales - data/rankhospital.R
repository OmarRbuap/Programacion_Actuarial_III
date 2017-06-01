rankhospital <- function(estado,resultado,rank){
    #lectura de datos
    setwd("C:/Users/omar/Desktop/Programacion_Actuarial_III/Caso 2/Calidad de Hospitales - data")
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    if(!((resultado =="ataque") | (resultado =="falla") | (resultado =="neumonia"))){
        stop ("Resultado invalido probar nuevamente")
        break
    }
    
    state <- as.character(outcome$State)
    if(!(estado %in% state)){
        stop("Resultado invalido probar nuevamente")
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
    Hospital <- suppressWarnings(as.character(outcome$Hospital.Name))
    
    tabla <- data.frame(outcome$Hospital.Name,outcome$State,causa)
    tabla1 <- tabla[order(tabla$outcome.Hospital.Name),]
    
    prueba1 <- subset(tabla1,tabla1$outcome.State == estado)
    prueba2 <- prueba1[order(prueba1$causa),]

    prueba3 <- data.frame(prueba2$outcome.Hospital.Name,prueba2$causa)
    u <- sum(is.na(prueba2$causa))
    t <- length(prueba2$causa)-u
    TablaTotal <- prueba3[1:t,]
    ranki <- (1:t)
    Rank <- as.data.frame(ranki)
    RankTotal <-cbind(TablaTotal,Rank) 
    names(RankTotal) <- c("Nombre.de.Hospital","Tasa","Rank")
    
    if(rank == "mejor"){
        Nhospital <- as.character(RankTotal$Nombre.de.Hospital[1])
    }else if(rank == "peor"){
        Nhospital <- as.character(RankTotal$Nombre.de.Hospital[t])
    }else if(rank %in% ranki){
        Nhospital <- as.character(RankTotal$Nombre.de.Hospital[rank])
    }else if(rank > t){
        Nhospital <- NA
    }else{
        stop("Resultado invalido probar nuevamente")
        break
    }
    print(Nhospital)
                           
}
rankhospital("TX","falla",4)
rankhospital("MD","ataque","peor")
rankhospital("MN","falla",5000)
