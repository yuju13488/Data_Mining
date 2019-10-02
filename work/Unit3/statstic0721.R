install.packages('C50')
library(C50)
?(churn)
data(churn)
str(churnTrain)

x<-c(85,34,55,62,63,68,76)
mean(x) #平均值
range(x) #組距
median(x) #中位數
sd(x)#標準差
var(x) #變異數
sd(x)^2 #標準差^2
max(x) 
min(x)
quantile(x) #分位數
cor=sd(x)/mean(x)
cor