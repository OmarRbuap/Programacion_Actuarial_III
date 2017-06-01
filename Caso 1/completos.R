completos<-function(directorio,t){
    setwd(directorio)
    x <- list.files()
    id <- c()
    nobs <- c()
    
    for(n in t){
        nombrearchivo<-x[n]
        archivo<-read.csv(nombrearchivo,header = TRUE,sep = ",")
        o <- is.na.data.frame(archivo)
        d <- archivo[rowSums(o)==0,]
        renglones <- nrow(d)
        id <- c(id,n)
        nobs <- c(nobs,renglones)
    }    
    
    final<-cbind(id,nobs)
    final
    class(final)
    final2<-as.data.frame(final)
    print(final2)
}    

completos("C:/Users/omar/Desktop/specdata/specdata",c(2,4))
