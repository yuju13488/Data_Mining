#載入C50 churn資料集
data(churn) #載入C50 churn資料集
data_train = churnTrain[,-3] #排除 "area_code"欄位
data_train = churnTrain[,-1] #排除 “state"欄位
data_train$churn = ifelse(data_train$churn=='yes',1,0)  # 羅吉斯回歸預設對 y=1 建模產出推估機率

#模型訓練
logitM=glm(formula=churn~., data= data_train, family=binomial(link="logit"), na.action=na.exclude)
summary(logitM)
#預設對y=1建模產出推估機率

#訓練樣本的混淆矩陣(confusion matrix)與預測正確率
install.packages("InformationValue") # for optimalCutoff
library(InformationValue)
y = data_train$churn
y_hat=predict(logitM,newdata=churnTrain,type="response")
#optimalCutoff(y, y_hat)[1] 提供了找到最佳截止值，減少錯誤分類錯誤
table.train=table(y, y_hat > optimalCutoff(y, y_hat)[1] ) 

#預測正確率 = 矩陣對角對角總和/矩陣總和
cat("Correct Classification Ratio(train)=", sum(diag(table.train))/sum(table.train)*100,"%\n")

#測試樣本的混淆矩陣(confusion matrix)與預測正確率
y = ifelse(churnTest$churn=='yes',1,0) #yes->1;no->0
y_hat=predict(logitM,newdata=churnTest,type="response")
table.test=table(y, y_hat > optimalCutoff(y, y_hat)[1] )

#預測正確率 = 矩陣對角對角總和/矩陣總和
cat("Correct Classification Ratio(test)=", sum(diag(table.test))/sum(table.test)*100,"%\n")

# ROC Curve
library(ROCR)
y_prob <- predict(logitM,newdata=churnTest,type="response")
y_prob <- exp(y_prob)/(1+exp(y_prob)) #odds轉機率
pred <- prediction(y_prob, labels = churnTest$churn)

# tpr: True Positive Ratio正確預測正例
# fpr: False Positive Ration誤判為正例
perf <- performance(pred, "tpr", "fpr")
plot(perf)
points(c(0,1),c(0,1),type="l",lty=2)  #畫虛線

#AUC
perf <- performance(pred, "auc")
( AUC = perf@y.values[[1]] )

#Gini
( Gini = (AUC-0.5) *2 )*100 