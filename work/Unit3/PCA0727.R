#主成份分析
#連續（數字）數值
#降維度（減少x個數）：去除x線性組合
#萃取新的變數之間兩兩獨立
#建議在迴歸、分群、類神經網路分析前PCA

pca_Traindt<-princomp(data,cor=T) #data資料型態為data frame
#cor=F變數單位或值域相同；cor=T變數單位或值域不同，演算法將變數轉Z-score再計算

install.packages("C50")
library(C50)
data(churn)
names(churnTrain)
str(churnTrain)
data <- churnTrain[,c(-1,-3,-4,-5,-20)] #不要第1, 3, 4, 5, 20欄 (數字以外)
pca_Traindt <- princomp( data , cor=T) #cor=T單位不同
summary(pca_Traindt) #檢視
#取前7個獨立因子即可有原15個變數的74%

screeplot(pca_Traindt,type="lines") #繪製陡坡圖（最佳反折點）

#檢視各因子可解釋的變異
print(pca_Traindt$loadings,digits=8,cutoff=0) #digits=8在第8個換行

p<-predict(pca_Traindt) #算出主成分
p[,c(1:5)]
head(p,5) #只顯示前5筆（並無刪減資料）
head(p[,c(1:7)],5) #取出7個主成分
