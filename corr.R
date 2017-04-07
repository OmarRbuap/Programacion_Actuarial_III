corr<- function(directorio,horizonte){
    setwd(directorio)
    x<-list.files()
    corr<-c()
    for(n in 1:332){
        nombrearchivo<-x[n]
        archivo<-read.csv(nombrearchivo,header = TRUE,sep = ",")
        sn<-archivo[,2:3]
        o<-is.na.data.frame(sn)
        d<-sn[rowSums(o)==0,]
        renglones<-nrow(d)
        
        if(renglones>horizonte){
            c<-cor(d$sulfate,d$nitrate)
            corr<-c(corr,c)
        }
        if(renglones<horizonte){
            corr<-c(corr,0)
        }
    }
    if(sum(corr)==0){
        corr<-c(0)
    }
    print(corr)
}
corr("C:/Users/omar/Desktop/specdata/specdata",2000)
