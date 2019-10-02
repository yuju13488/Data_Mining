install.packages("sqldf")
library(sqldf)
sqldf("SELECT * FROM iris")
sqldf

data("chickwts")
str(chickwts) #feed->str class
table(chickwts$feed) #group by in SQL
split(chickwts$weight,chickwts$feed) #分群

chickwts[,2] #全部筆數資料,第二欄
chickwts[1,] #一筆資料,全欄位
#抽樣：隨機5筆資料，全部欄位(replace=F取後不放回->抽不重複)
chickwts[sample(1:nrow(chickwts),5,replace = F),]

#Making test data
money <- sample(0:99999999,500000,replace = TRUE)
View(money)

High <- c( 120, 134, 110, 158, 100, 101, 140, 105)
Weight <- sample(20:25,8,replace = TRUE) #從20~25抽8筆，取後放回（可重複資料）
Gender <- c("男", "女", "男", "男", "男", "女", "女", "女")
High > 130
High[High>130]
Gender[High>130]
report <- data.frame(High, Weight, Gender)
boy.pass <- report[Gender == "男" & High>130 , ] #挑選身高大於130的男童
boy.pass 

iris
rownames(iris)
iris[as.integer(rownames(iris))%%7==0,] #切割rownames是7的倍數的觀察值
subset(iris,iris$Sepal.Length > 7,select = -Species) #subset( 欲切割的物件, 切割條件, 欄位挑選select=-Species不要此變數)
subset(iris,  iris$Sepal.Length>7, select= c(Sepal.Length, Species) )

