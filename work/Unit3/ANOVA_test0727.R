#H0:mean(1)=mean(2)=mean(3)=......-mean(k)
#H1:mean(i) != mean(j)，i,j任意
# 想知道不同教育程度與每日平均上網時數是否有差異
# H0:uGo to Internet_高中 = uGo to Internet_大學 = uGo to Internet_研究所
# H1:至少有兩組平均上網時數有差異
# 顯著水準alpha=0.05
df <- data.frame( group = c(rep(1, 20), rep(2, 20), rep(3,20) ), #1:高中,2:大學,3:研究所；rep->重複次數（人數）
                  GoInternet = floor(runif(n = 60, min = 1, max = 10)) ) #floor->整數化
lm_df <- lm(GoInternet~group, data=df) #lm線性迴歸
anova(lm_df) 
#結論：p-value<0.05表示顯著，至少有兩種教育程度在上網時數有顯著不同。

# 另外一個函數aov
lm_df <- lm(group~GoInternet, data=df)
anova(lm_df)
a <- aov(lm_df)
summary(a)
boxplot(GoInternet~group, data=df)

#多重比較找出差異項目
fit <- aov(GoInternet~factor(group), data=df)
TukeyHSD(fit) 
plot(TukeyHSD(fit))
#TukeyHSD()倆倆比對是否有差異，從pvalue看來，3-1 <0.05表示高中與研究所有顯著差異