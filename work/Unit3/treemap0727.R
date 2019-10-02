install.packages("treemap")
library(treemap)
y=data.frame(C_ID=c('group1','group2','group3','group4','group5','group6','group7'),
             C_RTO=c(0.22,0.3,0.16,0.04,0.19,0.03,0.06) #size
            )
treemap(y,index = c('C_ID'),vSize = 'C_RTO',vColor='C_RTO')

setwd('E:/DM/work')
x<-read.table(file.choose(),header = T,sep=',',fileEncoding = 'big5') #選擇TaiwanGov.csv
treemap(x,index = c('縣市'),vSize = '面積',vColor= '面積')
treemap(x,index = c('縣市','行政區名稱'),vSize = '面積',vColor= '面積')
treemap(x,index = c('縣市','行政區名稱'),vSize = '人口數',vColor= '人口數')
