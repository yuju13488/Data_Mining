#一次安裝
packages<-c("C50","tree","rpart","randomForest")
for (i in packages){install.packages(i)}
#一次載入
sapply(packages, FUN=library,character.only=T)
search()       

