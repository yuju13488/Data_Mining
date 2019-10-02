#H0為常態分布；H1不為常態分佈
#p-value<0.05表示顯著，拒絕虛無假設H0，不是Normal
data(iris)
shapiro.test(iris$Petal.Length) #常態檢定指令
hist(iris$Petal.Length,prob=T)
curve(dnorm(x,mean(iris$Petal.Length),sd(iris$Petal.Length)),col='red',add=T)

#H0為常態分布；H1不為常態分佈
#p-value>0.05表示"不"顯著，接受虛無假設H0，沒有足夠證據證明不是Normal
shapiro.test(iris$Sepal.Width)
hist(iris$Sepal.Width,prob=T)
curve(dnorm(x,mean(iris$Petal.Width),sd(iris$Petal.Width)),col='red',add=T)