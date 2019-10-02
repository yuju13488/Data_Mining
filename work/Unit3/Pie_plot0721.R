# 簡單圓餅圖
pieces <- c(8,8,2,4,2)
pie(pieces , labels = c('工作','睡覺','念書','打電動','聊天'), main="生活時 間分配圖")

#簡單圓餅圖 加上百分比 
pieces <- c(8,8,2,4,2)
pct <- round(pieces/sum(pieces)*100)#計算各個類別百分比
lbls <- paste(c('工作','睡覺','念書','打電動','聊天'),pct,'%', sep='')
pie(pieces , labels = lbls, main="生活時間分配圖") 

# 利用線圖看趨勢
years <- sort(round(runif(10,2000,2010),0))
newbornbaby<- sort(round(runif(10,200,1000),0))
dt <- data.frame(newbornbaby,years)
par(mfrow=c(3,2))#在一張畫布上輸出3*2個圖型
plot(newbornbaby~ years , data=dt, type='l', col=1) #type='l'只畫線
plot(newbornbaby~ years , data=dt, type='b', col=2) #type='b'畫線與點
plot(newbornbaby~ years , data=dt, type='c', col=3) #type='c'把'b'的圖去點
plot(newbornbaby~ years , data=dt, type='h', col=4) #type='h'垂直線
plot(newbornbaby~ years , data=dt, type='s', col=5) #type='s'階梯圖

