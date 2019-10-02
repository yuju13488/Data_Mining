# 想知道新的促銷對刷卡金額是否有影響
# H0:平均數刷卡金額_促銷之前– 平均數刷卡金額_促銷之後 = 0
# H1:平均數刷卡金額_促銷之前– 平均數刷卡金額_促銷之後 != 0
# 顯著水準 alpha = 0.05
Crd_amt_before <- rnorm(10000,mean=4032,sd=570)
Crd_amt_after <- rnorm(10000,mean=5661,sd=690)
t.test(Crd_amt_before, Crd_amt_after, mu=0, paired=T, var.equal=F)
#結論：p-value < 0.05表示顯著， 新的促銷對刷卡金額是有顯著的 提升。人話: 新的促銷有助於提高卡戶的刷卡金