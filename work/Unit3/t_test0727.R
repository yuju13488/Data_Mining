#t檢定
# t.test(x,y=NULL,
#        alternative = c('two.sided','less','greater'),
#        mu=0,paired = F,var.equal = F,conf.level = 0.95,...)
install.packages('C50')
library(C50)
?(churn)
data(churn)
str(churnTrain)
#mean=160
#H0白天通話平均==160通；H1白天通話平均!=160通
#顯著水準alpha=0.05
t.test(churnTrain$total_day_calls,mu=160,alternative = 'two.sided')
#p-value<0.05顯著，拒絕H0