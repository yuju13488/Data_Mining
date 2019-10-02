#電信業客戶流失模型
data()
data(churn) #載入C50 churn
?(churn)
names(churnTrain)
str(churnTrain)

#模型訓練
data_train=churnTrain[,-3] #排除"area_code"欄位
churn.tree=rpart(churn~.,data = data_train)
churn.tree

#CART決策樹
plot(churn.tree)
text(churn.tree,cex=.8)

#變數重要性
churn.tree$variable.importance

#訓練樣本的confusion matrix與預測準確率
y = churnTrain$churn
y_hat=predict(churn.tree,newdata = churnTrain,type='class')
table.train=table(y,y_hat)
cat("Total records(train)=",nrow(iris.train),"\n")
#預測正確率= 矩陣對角對角總和/矩陣總和
cat("Correct Classification Ratio(train)=", sum(diag(table.train))/sum(table.train)*100,"%\n")

#測試樣本的confusion matrix與預測準確率
y = churnTest$churn
y_hat= predict(churn.tree,newdata = churnTest,type='class')
table.test=table(y,y_hat)
cat("Total records(test)=",nrow(iris.test),"\n")
cat("Correct Classification Ratio(test)=", sum(diag(table.test))/sum(table.test)*100,"%\n")

setwd("E:/DM/work")
source('Gain_lift_Chart.r', encoding = 'Big5') #老師寫的UDF
y = ifelse(churnTest$churn=='yes',1,0) #記得要把正例轉成1，負例轉成0
y_hat=predict(churn.tree,newdata=churnTest,type="class")
y_prob = predict(churn.tree,newdata=churnTest,type="prob") #預測流失機率
#呼叫老師寫的UDF
DT =Gain_Lift_Chart(y,y_hat,y_prob)
par(mfrow = c(1, 2))
# Gain Chart
plot(DT$row_index, DT$target_rto, xlab = "全體人數累積百分比",  ylab = "正例人數累積百分比" ,type = "l", main = "Gain Chart")
#Lift Chart
plot(DT$row_index, DT$lift, xlab = "全體人數累積百分比", ylab = "Lift",type = "l", main = "Lift Chart")