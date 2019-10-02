install.packages("xgboost")
library(xgboost)
library(C50)
library(dplyr)

#以客戶流失資料集為例
data(churn)
data_train = churnTrain[,-3] #data.frame:3333 obs. of  19 variables
data_test = churnTest[,-3] #data.frame:1667 obs. of  19 variables

#將訓練與測試資料集轉乘數值型的Matrix格式
dataTrain_matrix <- Matrix::sparse.model.matrix(churn ~ .-1, data = data_train) #-1是去掉流水號
output_vector_train = churnTrain[,'churn'] == "yes"
train_matrix <- xgb.DMatrix(data = as.matrix(dataTrain_matrix),label=output_vector_train)
dataTest_matrix <- Matrix::sparse.model.matrix(churn ~ .-1, data = data_test)
output_vector_test = churnTest[,'churn'] == "yes"
test_matrix <- xgb.DMatrix(data = as.matrix(dataTest_matrix),label=output_vector_test)

#模型超參數設定
nc = length(unique(output_vector_train)) #預測變數Y有幾類（nc=2）
params = list( "objective" = "multi:softprob", #結果包含預測機率與預測類別
               "eval_metric" = "mlogloss", #損失函數
               "num_class" = nc # 設定Y的類別 
               )
watchlist <- list(train=train_matrix , test=test_matrix) #設定建模時需監控的樣本清單
#xgboost模型建置
bst_model <- xgb.train(params = params, data = train_matrix, nrounds = 100, watchlist = watchlist, eta = 0.3, #Learning Rate, low -> more robust to overfitting
                       max.depth = 5, #預設值:6，每顆樹的最大深度，樹高越深，越容易overfitting
                       seed =123 )

# Overfitting檢視
evalue_log <- bst_model$evaluation_log
plot(evalue_log$iter, evalue_log$train_mlogloss, col='blue')
lines(evalue_log$iter, evalue_log$test_mlogloss, col='red')

#依照最佳迭代次數再次建模
bst_model <- xgb.train(params = params,
                       data = train_matrix,
                       nrounds = 17,
                       watchlist = watchlist,
                       eta = 0.3, # Learning Rate, low - more robust to overfitting
                       max.depth = 5, #預設值:6，每顆樹的最大深度，樹高越深，越容易overfitting
                       seed =123 )

#檢視重要變數
var_feature <- xgb.importance(colnames(train_matrix), model = bst_model)
print(var_feature)
xgb.plot.importance(var_feature)

#預測新資料
p <- predict(bst_model, newdata = test_matrix) #模型評分，1667*2筆(因為每人有流失與未流失的機率)
pred <- matrix(p, nrow=nc, ncol=length(p)/nc ) %>% #轉成 2*1667 matrix格式
  t() %>% #再轉成 1667*2 matrix格式
  data.frame() %>% #轉成data.frame格式
  mutate(y = output_vector_test, y_hat = max.col(., "last")-1 )
  #取得最大機率值的欄位數，然後將欄位編號減1
head(pred,10)

#預測正確率 = 矩陣對角對角總和/矩陣總和
table.test = table(output_vector_test,pred$y_hat)
cat("Correct Classification Ratio(test)=", sum(diag(table.test))/sum(table.test)*100,"%\n")
