#' Calculate pointer-year values from raw tree-ring widths
#' 
#'  This function takes object of raw tree-ring widths measuraments and calculates stand pointer-year 
#'  values for each year of original data.
#'  
#'  @param x a data frame with year values in the first column and raw tree ring measuraments in all other columns
#'  @usage pointer.year(x)
#'  @return A data frame with year values in the first column and the calculated stand pointer-year values in the second column
#'  @examples
#'  data(ozols)
#'  point<-pointer.year(ozols)
#'  point[1:10,]   
pointer.year<-function(x){
  rob<-c(-100,-0.8,-0.6,-0.4,-0.2,0,0.2,0.4,0.6,0.8,100)
  bez.gada<-as.matrix(x[,-1])
  pag<-bez.gada
  pag[1:5,]<-NA
  jt<-as.vector(pag)
  
  for(t in 1:ncol(bez.gada)){
    for(i in 6:nrow(bez.gada)){
      jt[i+(t-1)*nrow(bez.gada)]<-(bez.gada[i,t]-mean(bez.gada[(i-5):(i-1),t]))/mean(bez.gada[(i-5):(i-1),t])+0.0000000000000000000000000000000000001
    }
  }
  jt<-findInterval(jt,rob)
  jt<-matrix((ifelse(jt>=6,jt+1,jt)-6),ncol=ncol(bez.gada))
  
  point<-c(NA,NA,NA,NA,NA,20*apply(jt[-(1:5),],1,mean,na.rm=TRUE))
  point.gads<-data.frame(cbind(x[,1],point))
  colnames(point.gads)<-c("gads","indekss")
  point.gads
}