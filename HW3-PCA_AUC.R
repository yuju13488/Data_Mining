library(C50)
data(churn)
?(churn)
names(churnTrain)
str(churnTrain)
data <- churnTrain[,c(-1,-3,-4,-5,-20)] #不要第1, 3, 4, 5, 20欄 (數字以外)
pca_Traindt <- princomp( data , cor=T) #cor=T單位不同
pca_Traindt
p<-predict(pca_Traindt) #算出主成分
head(p,5) #只顯示前5筆（並無刪減資料）
head(p[,c(1:10)],5) #取出10個主成分

#pca_Traindt<-princomp(data,cor=T) #data資料型態為data frame
pca_data=as.data.frame(p[,c(1:10)]) #轉換資型態
head(pca_data,5)
pca_data$churn=churnTrain$churn #將churn此欄位歸還
pca_data
library(rpart)
churn.tree=rpart(churn~.,data = pca_data)
churn.tree
plot(churn.tree)
text(churn.tree,cex=.8)

#訓練樣本的confusion matrix與預測準確率
y = pca_data$churn
y_hat=predict(churn.tree,newdata = pca_data,type='class')
table.train=table(y,y_hat)
#預測正確率= 矩陣對角對角總和/矩陣總和
cat("Correct Classification Ratio(train)=", sum(diag(table.train))/sum(table.train)*100,"%\n")

#測試樣本的confusion matrix與預測準確率
y = pca_data$churn
y_hat= predict(churn.tree,newdata = pca_data,type='class')
table.test=table(y,y_hat)
cat("Correct Classification Ratio(test)=", sum(diag(table.test))/sum(table.test)*100,"%\n")

#計算AUC
y_prob=predict(churn.tree,newdata =pca_data,type="prob")[,1]
library(ROCR)
pred<-prediction(y_prob,labels = pca_data$churn)
perf <- performance(pred, "auc")
( AUC = perf@y.values[[1]] ) 

