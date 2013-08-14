`fh.tab`<-function(fails,start="bark"){
gg=readLines(fails)
header.begin <- grep("^HEADER:$", gg)
header.end <- grep("^DATA:(Tree|Single)$", gg)
all.end <- c(header.begin[-1]-1,length(gg))

KeyCode<-vector()
Location<-vector()
Project<-vector()
Length<-vector()
DateEnd<-vector()
DeltaMissingRingsBefore<-vector()
Pith<-vector()
Bark<-vector()
SpeciesName<-vector()
TreeNo<-vector()
RadiusNo<-vector()


for(i in 1: length(header.begin)){
  tree.all<-gg[header.begin[i]:all.end[i]]
  KeyCode[i]<-ifelse(length(sub("KeyCode=","\\1",tree.all[grep("^KeyCode.*", tree.all)]))==0,NA,sub("KeyCode=","\\1",tree.all[grep("^KeyCode.*", tree.all)]))
  Location[i]<-ifelse(length(sub("Location=","\\1",tree.all[grep("^Location.*", tree.all)]))==0,NA,sub("Location=","\\1",tree.all[grep("^Location.*", tree.all)]))
  Project[i]<-ifelse(length(sub("Project=","\\1",tree.all[grep("^Project.*", tree.all)]))==0,NA,sub("Project=","\\1",tree.all[grep("^Project.*", tree.all)]))
  Length[i]<-ifelse(length(sub("Length=","\\1",tree.all[grep("^Length.*", tree.all)]))==0,NA,sub("Length=","\\1",tree.all[grep("^Length.*", tree.all)]))
  DateEnd[i]<-ifelse(length(sub("DateEnd=","\\1",tree.all[grep("^DateEnd.*", tree.all)]))==0,NA,sub("DateEnd=","\\1",tree.all[grep("^DateEnd.*", tree.all)]))
  DeltaMissingRingsBefore[i]<-ifelse(length(sub("DeltaMissingRingsBefore=","\\1",tree.all[grep("^DeltaMissingRingsBefore.*", tree.all)]))==0,NA,sub("DeltaMissingRingsBefore=","\\1",tree.all[grep("^DeltaMissingRingsBefore.*", tree.all)]))
  Pith[i]<-ifelse(length(sub("Pith=","\\1",tree.all[grep("^Pith.*", tree.all)]))==0,NA,sub("Pith=","\\1",tree.all[grep("^Pith.*", tree.all)]))
  Bark[i]<-ifelse(length(sub("Bark=","\\1",tree.all[grep("^Bark.*", tree.all)]))==0,NA,sub("Bark=","\\1",tree.all[grep("^Bark.*", tree.all)]))
  SpeciesName[i]<-ifelse(length(sub("SpeciesName=","\\1",tree.all[grep("^SpeciesName.*", tree.all)]))==0,NA,sub("SpeciesName=","\\1",tree.all[grep("^SpeciesName.*", tree.all)]))
  TreeNo[i]<-ifelse(length(sub("TreeNo=","\\1",tree.all[grep("^TreeNo.*", tree.all)]))==0,NA,sub("TreeNo=","\\1",tree.all[grep("^TreeNo.*", tree.all)]))
  RadiusNo[i]<-ifelse(length(sub("RadiusNo=","\\1",tree.all[grep("^RadiusNo.*", tree.all)]))==0,NA,sub("RadiusNo=","\\1",tree.all[grep("^RadiusNo.*", tree.all)]))
}

gadsk.list<-list()

for(i in 1:length(header.begin)){
  mes.all<-gg[(header.end[i]+1):all.end[i]]
  mes.nb<-as.numeric(gsub("\\D", "", unlist(strsplit(mes.all," "))))
  mes.nb<-mes.nb[!is.na(mes.nb)]
  mes.nb<-mes.nb[1:as.numeric(Length[i])]
  ifelse(start=="bark",
         gd.tab<-data.frame((as.numeric(DateEnd[i]):(as.numeric(DateEnd[i])-as.numeric(Length[i])+1)),mes.nb),
         gd.tab<-data.frame(((as.numeric(DateEnd[i])-as.numeric(Length[i])+1):as.numeric(DateEnd[i])),mes.nb))
  colnames(gd.tab)<-c("gads",KeyCode[i])
  gadsk.list[[i]]<-gd.tab
}

tab.gsk<-gadsk.list[[1]]
for(i in 2:length(gadsk.list)){ 
  tab.gsk<-merge(tab.gsk,gadsk.list[[i]],by="gads",all=TRUE)
}
tab.gsk<-tab.gsk[order(-tab.gsk$gads),]


gala.tabula<-data.frame(KeyCode,Location,Project,as.numeric(Length),as.numeric(DateEnd),as.numeric(DeltaMissingRingsBefore),Pith,Bark,SpeciesName,TreeNo,RadiusNo)
gala.tabula<-cbind(gala.tabula,t(tab.gsk)[-1,])
colnames(gala.tabula)<-c("KeyCode","Location","Project","Length","DateEnd","DeltaMissingRingsBefore","Pith","Bark","SpeciesName","TreeNo","RadiusNo",tab.gsk$gads)
nosaukums<-paste(substr(fails,1,(nchar(fails)-3)),"_parveidots.txt",sep="")
write.table(x=gala.tabula,file=nosaukums,row.names=F,sep="\t")
}