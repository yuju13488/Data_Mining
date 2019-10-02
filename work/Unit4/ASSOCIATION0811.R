install.packages("arules")
library(arules)

# (1)建置超市交易資料，7筆交易資料
transaction_data <- data.frame(Bread =  c(T,T,F,T,T,F,F),
                               Milk  =  c(T,F,T,T,T,T,F),
                               Diaper = c(F,T,T,T,T,F,T),
                               Beer =   c(F,T,T,T,F,F,T),
                               Coke =   c(F,F,T,F,T,T,T) )

# (2)建置關聯規則模型
rule=apriori(transaction_data,parameter=list(supp=0.1,conf=0.8,maxlen=4))   

# (3)查看rule
inspect(rule)
summary(rule)
inspect(head(sort(rule,by="support"),20)) #依照support排序
inspect(head(sort(rule,by="confidence"),20)) #依照confidence排序
inspect(head(sort(rule,by="lift"),20)) #依照lift排序
setwd('E:/DM')
data <- read.csv("E:/DM/shopcart.csv",header = FALSE)
data2=as(data,"transactions") #轉呈交易檔

#繪圖
install.packages("arulesViz")
library(arulesViz)
plot(rule)
plot(rule, method="graph", control=list(type="items"))


# 建置關聯規則模型
rule=apriori(data2,parameter=list(supp=0.2,conf=0.8,maxlen=4))

inspect(rule)
plot(rule)
plot(rule, method="graph", control=list(type="items"))