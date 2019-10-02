set.seed(123) #設定被抽取物
x<-rnorm(100,mean = 20,sd=5)
hist(x)
summary(x)
x<-rnorm(10000,mean = 20,sd=5)
hist(x) #normal
summary(x)
x<-rnorm(60000,1,6) #min & max
hist(x) #normal
summary(x)