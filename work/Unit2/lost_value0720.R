#NA為R的遺漏值
a<-c(2,3,8,NA,4,NA,9,12,NA)
is.na(a) #針對是否有NA顯示T或F
any(is.na(a)) #判斷是否有NA值
sum(is.na(a)) #計算NA值數量
is.nan(0/0) #識別不可能得值
is.infinite(1/0) #識別無窮值
summary(a)

install.packages("mice")
library(mice) 
install.packages("missForest") 
library(missForest)
data <- prodNA(iris, noNA = 0.05) #產生5%遺漏值 
complete.cases(data) #資料完成回傳T；資料遺漏回傳F
summary(data) #檢視data
md.pattern(data)
str(data)

install.packages("VIM")
library(VIM)
aggr_plot <- aggr(data, col = c('navyblue', 'red'), numbers=TRUE, sortVars=TRUE, 
                  labels=names(data), cex.axis=.7, gap=3, 
                  ylab=c("Histogram of missing data", "Pattern"))
new_data<-data[complete.cases(data),] #根據資料遺漏值回傳F刪除遺漏值

new_data1 <- data
#用平均數取代遺漏值
#算出各欄的平均數
new_data1.mean_col_1 <- mean(new_data1[, 1], na.rm = T) #na.rm=T不計算NA
new_data1.mean_col_2 <- mean(new_data1[, 2], na.rm = T)
new_data1.mean_col_3 <- mean(new_data1[, 3], na.rm = T)
new_data1.mean_col_4 <- mean(new_data1[, 4], na.rm = T)
#取出各欄位中有遺漏值的“列位置”
na.rows1 <- is.na(new_data1[, 1])
na.rows2 <- is.na(new_data1[, 2])
na.rows3 <- is.na(new_data1[, 3])
na.rows4 <- is.na(new_data1[, 4])
#用平均數取代遺漏值
new_data1[na.rows1,1] <- new_data1.mean_col_1
new_data1[na.rows2,2] <- new_data1.mean_col_2
new_data1[na.rows3,3] <- new_data1.mean_col_3
new_data1[na.rows4,4] <- new_data1.mean_col_4 
summary(new_data1)#檢視遺漏值

#利用演算法y=a+b1x1+b2x2+b3x3+......
mice.data <- mice(data, m = 3, # 產生三個遺漏值被填補好的資料表
      maxit = 30,              # 最大疊代數max iteration
      method = "cart",         # 使用CART決策樹，進行遺漏值預測
      seed = 188)              # 令抽樣每次都一樣 
new_data1 <- complete(mice.data, 1) #第一個結果
new_data2 <- complete(mice.data, 2) #第二個結果
new_data3 <- complete(mice.data, 3) #第三個結果
Training_data_set <- new_data2 #選用第二個結果來當成模型訓練資料集
kmeans(Training_data_set[-5] , nstart=20, centers=5) #跑分群演算法
mice.data <- mice(data,
                  m = 3,        #產生三個遺漏值被填補好的資料表
                  maxit = 30,   # 最大疊代數max iteration
                  method = "rf",# 使用隨機森林，進行遺漏值預測
                  seed = 188)   # 令抽樣每次都一樣
summary(mice.data)

#使用隨機森林
mice.data <- mice(data, m = 3, # 產生三個遺漏值被填補好的資料表
      maxit = 30,              # 最大疊代數max iteration
      method = "cart",         # 使用CART決策樹，進行遺漏值預測
      seed = 188)              # 令抽樣每次都一樣
new_data1<-complete(mice.data,1)
summary(data)
summary(new_data1)
kmeans(new_data1[-5],nstart = 20,centers = 5)