#交叉分析表（Excel可用）
z<-data.frame(Main=c('豚','牛','牛','牛','豚','牛','豚'),sub=c('有','沒','沒','有','有','有','沒'),drink=c('tea','coffee','coffee','tea','coffee','tea','coffee'))
z
ftable(z,row.vars = 1:2,col.vars = "drink")
ftable(z,row.vars = "Main",col.vars = "drink")

#樞紐分析（Excel可用）
install.packages("plyr")
library(plyr)
#產生40筆隨機資料
df <- data.frame(
  group = c(rep('個人戶', 20), rep('企業戶', 20)), 
  sex = sample(c("M", "F"), size = 40, replace = TRUE), 
  age = floor(runif(n = 40, min = 25, max = 40)), 
  bill = floor(runif(n = 40, min = 199, max = 2600)) 
  )
df
#利用group, sex進行分組，並計算年齡的平均數、標準差以及bill總和與平均
ddply(df, .(group, sex), summarize,
  mean_age = round(mean(age), 2), 
  sd_age = round(sd(age), 2), 
  sum_bill = sum(bill), 
  mean_bill = round(mean(bill), 2) 
  )
#計算資料筆數count
ddply(df, c('group','sex'), nrow)
ddply(df, c('group','sex','age'), nrow)  

#用vcd計算列聯表%
install.packages("vcd")
library(vcd)
#產生40筆隨機資料
df <- data.frame(
  group = c(rep('個人戶', 20), rep('企業戶', 20)), 
  sex = sample(c("M", "F"), size = 40, replace = TRUE), 
  age = floor(runif(n = 40, min = 25, max = 40)), 
  bill = floor(runif(n = 40, min = 199, max = 2600)) 
)
prop.table(df$bill)  
data.frame(df$bill,prop.table(df$bill))
table(df$age)
prop.table(table(df$age)) #轉百分比
table(df$age,df$group) #二維列聯表轉百分比
prop.table(table(df$age,df$group)) #表格內全部加總=1
prop.table(table(df$age,df$group),1) #參數1表示各列加總=1
prop.table(table(df$age,df$group),2) #參數2表示各行加總=1

#ftable&vcd
z<-data.frame(Main=c('豚','牛','牛','牛','豚','牛','豚'),sub=c('有','沒','沒','有','有','有','沒'),drink=c('tea','coffee','coffee','tea','coffee','tea','coffee'))
z
ftable(z,row.vars = 1:2,col.vars = "drink")
prop.table(ftable(z,row.vars = 1:2,col.vars = "drink"))