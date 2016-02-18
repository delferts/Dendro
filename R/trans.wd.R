#' Transform WinDendro measurament file of version 3
#' 
#'  This function takes measurament file of WinDendro programm (version 3 files only at this point) and extracts measuraments,
#'  years and names, and makes data frame where each tree-ring width series are in seperate column.
#'  
#'  @param file a name of WinDendro file
#'  @param r.par what kind of measuraments to extract - "RINGWIDTH","EARLYWIDTH" or "LATEWIDTH"
#'  @usage trans.wd(file,r.par="RINGWIDTH")
#'  @return A data frame with year in first column and measuraments in all other columns
#'  @examples
#'  #trans.wd("file.name.txt",r.par="RINGWIDTH")
#'  
trans.wd<-function(file,r.par="RINGWIDTH"){
  dati<-read.csv2(file=file,header=F,skip=2,fill=TRUE,sep="\t",as.is=TRUE)
  dati.rp<-dati[dati[,11]==r.par,] 
  saraksts.rp<-list() 
  for(i in 1:nrow(dati.rp)){  
    g<-as.numeric(dati.rp[i,13:ncol(dati.rp)]) 
    g<-g[!is.na(g)] 
    saraksts.rp[[dati.rp[i,1]]]<-data.frame((dati.rp[i,4]-length(g)+1):(dati.rp[i,4]),g) 
    colnames(saraksts.rp[[dati.rp[i,1]]])<-c("gads",dati.rp[i,1]) 
  }
  tab.rp<-saraksts.rp[[1]] 
  for(i in 2:length(saraksts.rp)){ 
    tab.rp<-merge(tab.rp,saraksts.rp[[i]],by="gads",all=TRUE)
  }
  tab.rp
}