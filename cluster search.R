--
title:cluster search
--
reading_file= read.table ("Human_NLS_sequences.txt") # or reading_file= read.table ("viral_NLS_sequences.txt")
dimention_1 = c(dim(reading_file))
z=NULL
cluster_table = matrix(ncol=4)
for (i in 1:dimention_1[1]){
  z=c(as.character(reading_file[i,]))
  m = c (strsplit(z,""))
  
  flag=0
  count=0
  NLS=NULL
  positive=0
  for (n in 1:lengths(m)){ 
    letter=m[[1]][n]
    if(letter=="K" || letter=="R" || letter=="H"){
      positive=positive+1
        if (flag==0){
        NLS=paste0(NLS,m[[1]][n])
        count=count+1
        if (n==lengths(m)){
          ratio=0
          ratio=positive/count
          cluster_table=rbind(cluster_table, c(NLS, count, ratio, positive))
        }
      }
      if (flag==1){
        NLS=paste0(NLS,m[[1]][n-1])
        NLS=paste0(NLS,m[[1]][n])
        count=count+2
        if (n==lengths(m)){
          ratio=0
          ratio=positive/count
          cluster_table=rbind(cluster_table, c(NLS, count, ratio, positive))
        }
        flag=0
        
      }
      if (flag>1){
        NLS=paste0(NLS,m[[1]][n])
        count=count+1
        flag=0
      }
      
    }
    else{
    
      flag=flag+1
      if (flag>1||n==lengths(m)){
        if (count>2){
          ratio=0
          ratio=positive/count
          cluster_table=rbind(cluster_table, c(NLS, count, ratio, positive))
        }
        print ("NLS")
        print (NLS)
        print("count")
        print(count)
        
        positive=0
        NLS=NULL
        count=0
      }   
   }
  }
}    
write.table(cluster_table, file = "Human_table.txt")  # or write.table(cluster_table, file = "Viral_table.txt")  
