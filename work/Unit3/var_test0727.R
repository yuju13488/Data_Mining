#var.test(x,y,ratio = 1,alternative = c('two.sided','less','greater'),conf.level = 0.95,...)
#想知道area_code_408與area_code_415白天通話平均通數是否顯著相同
# H0:變異數total_day_calls_408/變異數total_day_calls_415  = 1
# H1:變異數total_day_calls_408/變異數total_day_calls_415 != 1
# 顯著水準 alpha = 0.05
library(C50)
data(churn)
var.test( churnTrain$total_day_calls[churnTrain$area_code=='area_code_408' ], churnTrain$total_day_calls[churnTrain$area_code=='area_code_415' ])
#p-value > 0.05不顯著，兩樣本變異數無顯著差異

#想知道area_code_408與area_code_415白天通話平均通數是否顯著相同
# H0:平均數total_day_calls_408 – 平均數total_day_calls_415 = 0
# H1:平均數total_day_calls_408 – 平均數total_day_calls_415 != 0
# 顯著水準 alpha = 0.05
t.test(churnTrain$total_day_calls[churnTrain$area_code=='area_code_408' ], churnTrain$total_day_calls[churnTrain$area_code=='area_code_415' ], mu=0, var.equal=T)
#p-value > 0.05不顯著，area_code_408與area_code_405白天通話平均通數無顯著差異

#想知道CA區與VT區夜間通話平均通數是否顯著相同
## 先進行變異數檢定
# H0:變異數total_night_calls_CA/變異數total_night_calls_VT = 1
# H1:變異數total_night_calls_CA/變異數total_night_calls_VT != 1
# 顯著水準 alpha = 0.05
var.test(churnTrain$total_night_calls[churnTrain$state=='CA' ], churnTrain$total_night_calls[churnTrain$state=='VT'])
#p-value < 0.05顯著，接受H0，兩樣本變異數有顯著差異