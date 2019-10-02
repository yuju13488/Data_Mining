#讀入CSV檔
setwd('E:/DM/work/0727')
babyData=read.table("babies.csv",header=T,sep = ",")

#排除有遺漏值的資料列
babyData=na.exclude(babyData)

#訓練樣本70%與測試樣本30%
n=0.3*nrow(babyData)
test.index=sample(1:nrow(babyData),n)
Train=babyData [-test.index,]
Test=babyData[test.index,]

#確認訓練樣本與測試樣本分不一致
par(mfrow=c(1,2)) #讓R的繪圖視窗切割成1 X 2 的方塊
hist(Train$bwt)
hist(Test$bwt)

#建模
install.packages("rpart")
library(rpart)
baby.tree=rpart(bwt~. ,data=Train) #使用CART分類回歸樹演算法
baby.tree
plot(baby.tree)
text(baby.tree , cex=.8)

#變數重要程度，愈大愈重要
baby.tree$variable.importance
#MAPE
y=babyData$bwt[-test.index]
y_hat=predict(baby.tree,newdata=Train, type="vector")
train.MAPE=mean(abs(y-y_hat)/y)
cat("MAPE(train)=",train.MAPE*100,"%\n")

#真實y
y=babyData$bwt[test.index]
#預測y
y_hat=predict(baby.tree,newdata=Test, type="vector")
test.MAPE=mean(abs(y-y_hat)/y)
cat("MAPE(test)=",test.MAPE*100,"%\n")
