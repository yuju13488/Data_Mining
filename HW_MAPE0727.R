setwd('E:/DM/work/0727')
babyData=read.table("babies.csv",header=T,sep = ",")

#排除有遺漏值的資料列
babyData=na.exclude(babyData)

#訓練樣本60%與測試樣本40%
n=0.4*nrow(babyData)
test.index=sample(1:nrow(babyData),n)
Train=babyData [-test.index,] #'-'代表刪除[]內
Test=babyData[test.index,] #在','代表取的筆數；','後代表欄位，空白代表全取

#建模
lmTrain <- lm(formula = bwt ~., data = Train)
summary(lmTrain)

# 數值變數預測效果評估: MAPE(Mean Absolute Percentage Error)
y=babyData$bwt[test.index]
y_hat=predict(lmTrain,newdata=Test, type="response")
test.MAPE=mean(abs(y-y_hat)/y)
cat("MAPE(test)=",test.MAPE*100,"%\n")

#再次建模，去掉age與weight
lmTrain_1 <- lm(formula = bwt ~ gestation+parity+height+smoke, data = Train)
summary(lmTrain_1)

# 數值變數預測效果評估: MAPE(Mean Absolute Percentage Error)
y=babyData$bwt[test.index]
y_hat=predict(lmTrain_1,newdata=Test, type="response")
test.MAPE=mean(abs(y-y_hat)/y)
cat("MAPE(test)=",test.MAPE*100,"%\n")
