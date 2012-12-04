rel.supr<-function(ozols,sliek){
ozols<-ozols
x<-ozols[,-1]
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


gals<-data.frame(ozols[,1],p.sk,p.pr,n.sk,n.pr,kopa)

colnames(gals)<-c("gads","poz.sk","poz.proc","neg.sk","neg.proc","kopa.koki")
gals
}
