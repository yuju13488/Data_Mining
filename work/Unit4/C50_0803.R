install.packages("caret")
library(caret)
#createDataPartition較指令sample抽樣好
sample_index<-createDataPartition(y=iris$Species,p=0.7,list=F)
iris.train=iris[sample_index,]
iris.test=iris[-sample_index,]

#確認訓練樣本與測試樣本不一致
par(mfrow=c(1,2))
plot(iris.train$Species)
plot(iris.test$Species)

#模型訓練
iris.C50tree=C5.0(Species~.,data=iris.train) #"~."取所有X變數
summary(iris.C50tree) #產生混淆矩陣或得用Length及Width即可判別品種
plot(iris.C50tree)

#訓練樣本的confusion matrix與預測準確率
y=iris$Species[sample_index]
y_hat=predict(iris.C50tree,iris.train,type='class')
table.train=table(y,y_hat)
cat("Total records(train)=",nrow(iris.train),"\n")
#預測正確率= 矩陣對角對角總和/矩陣總和
cat("Correct Classification Ratio(train)=", sum(diag(table.train))/sum(table.train)*100,"%\n")

#測試樣本的confusion matrix與預測準確率
y = iris$Species[-sample_index]
y_hat= predict(iris.C50tree,iris.test,type='class')
table.test=table(y,y_hat)
cat("Total records(test)=",nrow(iris.test),"\n")
cat("Correct Classification Ratio(test)=", sum(diag(table.test))/sum(table.test)*100,"%\n")