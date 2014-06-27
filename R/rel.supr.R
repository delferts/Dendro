#' Calculate release-supression values from raw tree-ring widths
#' 
#'  This function takes object of raw tree-ring widths measuraments and calculates stand release-suppression values for 10 year interval 
#'  values for each year of original data.
#'  
#'  @param gadsk a data frame with year values in the first column and raw tree ring measuraments in all other columns
#'  @param sliek a value from 0 to 1 that shows how big increase/decrease should be to count it as release or suppression
#'  @usage rel.supr(gadsk,sliek=0.5)
#'  @return A data frame with year values in the first column, number and percentage of trees with positive and negative change and total number of trees
#'  @examples
#'  data(ozols)
#'  rel.values<-rel.supr(ozols,sliek=0.3)
#'  rel.values[1:10,]

rel.supr<-function(gadsk,sliek=0.5){
  x<-gadsk[,-1]
  y<-list()
  for(i in 1:ncol(x)){
    z<-x[,i]
    g<-rep(NA,nrow(x))
    for(t in 11:nrow(x)){
      g[t]<-round((mean(z[t:(t+9)])-mean(z[(t-10):(t-1)]))/mean(z[(t-10):(t-1)]),3)
    }
    y[[i]]<-g
  }
  
  izm<-matrix(unlist(y),ncol=ncol(x))
  izm<-ifelse(izm>sliek | izm< -sliek,izm,0)
  
  
  p.sk<-apply(izm,1,function(x) sum(x>sliek,na.rm=TRUE))
  n.sk<-apply(izm,1,function(x) sum(x< -sliek,na.rm=TRUE))
  kopa<-apply(izm,1,function(x) sum(!is.na(x)))
  
  p.pr<-round(p.sk/kopa,3)
  n.pr<-round(n.sk/kopa,3)
  
  
  gals<-data.frame(gadsk[,1],p.sk,p.pr,n.sk,n.pr,kopa)
  
  colnames(gals)<-c("gads","poz.sk","poz.proc","neg.sk","neg.proc","kopa.koki")
  gals
}
