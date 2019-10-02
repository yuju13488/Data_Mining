# 想知道客戶夜間通話次數與日間通話次數的相關程度
# 兩組樣本必須是數值資料
# H0:兩因素相關係數= 0
# H1:兩因素相關係數!=0
# 顯著水準alpha=0.05
cor(churnTrain$total_night_calls, churnTrain$total_day_calls)
cor.test(churnTrain$total_night_calls, churnTrain$total_day_calls)
#結論：p-value>0.05表示不顯著，兩變數無顯著相關