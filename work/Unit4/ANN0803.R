install.packages("neuralnet") #多層神經網路:倒傳遞類神經網路
install.packages("nnet") #單層神經網路
library(nnet)
library(neuralnet)
data(iris)

# One-hot Encoding
head(class.ind(iris$Species))
data <- cbind(iris, class.ind(iris$Species))

# 產生建模與測試樣本7:3
n=0.3*nrow(data)
test.index=sample(1:nrow(data),n)
Train=data[-test.index,]
Test=data[test.index,]

# 建模
formula.bpn <- setosa + versicolor + virginica ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
BNP = neuralnet(formula = formula.bpn, 
                hidden=c(3,2), #兩層隱藏層，第一層有3個神經元，第二層有2個神經元
                data=Train, 
                learningrate = 0.01, # learning rate
                threshold = 0.01, #自設參數勿太大->收斂
                stepmax = 5e5 #最大的ieration數 = 500000(5*10^5) 
                )

# 繪製網路圖
plot(BNP)

# 預測
cf=compute(BNP,Test[,1:4])
Ypred = as.data.frame(round(cf$net.result)) #預測結果 

# 建立一個新欄位，叫做Species
Ypred$Species <- ""

# 把預測結果轉回Species的型態
for(i in 1:nrow(Ypred)){
  if(Ypred[i, 1]==1){ Ypred[i, "Species"] <- "setosa"}
  if(Ypred[i, 2]==1){ Ypred[i, "Species"] <- "versicolor"}
  if(Ypred[i, 3]==1){ Ypred[i, "Species"] <- "virginica"} 
  }

Ypred

table(Test$Species,Ypred$Species)

# 混淆矩陣 (預測率有97.7777%)
message("準確度：",sum(diag(table(Test$Species,Ypred$Species))) / sum(table(Test$Species,Ypred$Species)) *100,"%")