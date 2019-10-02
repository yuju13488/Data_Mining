x1 = c(1,2,3)
x2 = c(4,5,6)
x3 = c(7,8,9)
TTL = c(x1,x2,x3)
TTL

union(x1,x2) #一次僅能兩個變數
union(union(x1,x2),x3)
rbind(x1,x3,x3) #row合併
cbind(x1,x3,x3) #column合併