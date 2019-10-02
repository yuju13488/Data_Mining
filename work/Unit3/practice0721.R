#空氣品質資料，Ozone臭氧，Solar.R太陽輻射
data("airquality")
head(airquality,6)
cor(airquality[,1:4],use="pairwise") #產出兩兩相關係數矩陣
pairs((airquality[,1:4])) #繪圖
