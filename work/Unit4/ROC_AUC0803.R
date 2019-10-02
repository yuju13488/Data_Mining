y_prob=predict(churn.tree,newdata = churnTest,type="prob")[,1] #取正確預測機率

#ROC
install.packages("ROCR")
library(ROCR)
pred<-prediction(y_prob,labels = churnTest$churn)

# tpr: True Positive Ratio 正確預測正例
# fpr: False Positive Ration誤判為正例
perf <- performance(pred, "tpr", "fpr") 
plot(perf)
points(c(0,1),c(0,1),type="l",lty=2)  #畫虛線

#AUC
perf <- performance(pred, "auc")
( AUC = perf@y.values[[1]] ) 
( Gini = (AUC-0.5) *2 )*100

# Iift chart
perf <- performance(pred, "lift" , "rpp")
plot(perf)