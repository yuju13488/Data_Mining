#沿用C50的樣本
iris.RFtree=randomForest(Species~.,data=iris.train,importance=T,proximity=T,ntree=300)
print(iris.RFtree)

#變數重要性
(round(importance(iris.RFtree ),2))