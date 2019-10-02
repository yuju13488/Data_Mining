install.packages("e1071")
library(e1071)
data(iris)
data <- iris

# 產生建模與測試樣本
n=0.3*nrow(data)
test.index=sample(1:nrow(data),n)
Train=data[-test.index,]
Test=data[test.index,]

# 建模
svm = svm(Species ~ . ,data=Train)
summary(svm)

# 測試樣本預測正確率
Ypred = predict(svm, Test)

# 混淆矩陣 (預測率有93.33%)
message("準確度：",sum(diag(table(Test$Species,Ypred))) / sum(table(Test$Species,Ypred)) *100,"%")
