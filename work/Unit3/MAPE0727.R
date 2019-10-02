#絕對百分比誤差MAPE=(|樣本實際值-樣本預測值|/樣本實際)後的平均值
#MAPE<10%         good
#10%<=MAPE<=20%   ok
#MAPE>=20%        bad
y_hat=predict(lmTrain , newdata = data.frame(x=x))
train.MAPE=mean(abs(y-y_hat)/y)
cat("MAPE(train)=",train.MAPE*100,"%\n")
