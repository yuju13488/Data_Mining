iris_new <- iris[,-5]
Cluster_km<-kmeans(iris_new,nstart = 15,centers = 3) #nstart隨機丟太集中最多重算次數；centers群數
#nstart是指重新隨意放k個中心點的次數，一般建議nstart>=10
table(Cluster_km$cluster, iris[, 5]) #觀察分群結果與實際類別的差別

plot(iris_new$Petal.Width,iris_new$Petal.Length,col=Cluster_km$cluster)

#最佳分群數K決定
Cluster_km
WSS_ratio<-rep(NA,times=10)
for (k in 1:length(WSS_ratio)) {
  Cluster_km<- kmeans(iris_new, nstart=15,centers=k)
  WSS_ratio[k] <- Cluster_km$tot.withinss 
}

#畫陡坡圖 
plot(WSS_ratio, type="b", main = "陡坡圖")
