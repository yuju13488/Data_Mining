# 想知道性別與客戶流失是否相關
## 兩組樣本必須是類別（文字）資料 
# H0:兩因素無關係
# H1:兩因素有關係
# 顯著水準 alpha = 0.05
dt <- matrix(c(38,45,100,77),ncol=2)
chisq.test(dt)
#結論：p-value>0.05表示不顯著，性別的不同與客戶流失是無關的。


#數據太大易失真