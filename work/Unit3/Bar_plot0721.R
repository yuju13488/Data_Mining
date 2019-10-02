data("mtcars")
mtcars
attach(mtcars)
table(cyl)
T_cyl=table(cyl) #汽缸產生次數分配
#names.arg指派X軸標籤；col指派直條塗顏色
barplot(T_cyl , main="cyl 汽缸數次數分配表", xlab="汽缸數", col=c("red", "blue", "green"), 
        names.arg=c("4 汽缸", "6 汽缸", "8 汽缸"), border = "cyan")
barplot(T_cyl ,
        main="cyl 汽缸數次數分配表", 
        xlab="汽缸數", 
        col=c("red", "blue", "green"), 
        names.arg=c("4 汽缸", "6 汽缸", "8 汽缸"), 
        border = "cyan", 
        horiz=TRUE)#horiz=TRUE橫式直條圖

library("vcd")
prop.table(table(cyl))
T_cyl1=prop.table(table(cyl))#百分比常條圖
barplot(T_cyl1 ,
        main="cyl 汽缸數次數分配表", 
        xlab="汽缸數", 
        col=c("red", "blue", "green"), 
        names.arg=c("4 汽缸", "6 汽缸", "8 汽缸"), 
        border = "cyan", 
        horiz=TRUE)

#分組長條圖
T_cyl2=table(am,cyl)
T_cyl2
barplot(T_cyl2 ,
        main="cyl 汽缸數次數分配表", 
        xlab="汽缸數", 
        col=c("red", "blue", "green"), 
        names.arg=c("4 汽缸", "6 汽缸", "8 汽缸"), 
        border = "cyan", 
        horiz=FALSE,
        legend=rownames(T_cyl2),beside=TRUE)#legend圖例；beside分組或堆疊

#百分比堆疊圖
prop.table(table(am,cyl),2)
T_cyl3=prop.table(table(am,cyl),2)
barplot(T_cyl3,
        main="cyl 汽缸數次數分配表", 
        xlab="汽缸數", 
        col=c("red", "blue", "green"), 
        names.arg=c("4 汽缸", "6 汽缸", "8 汽缸"), 
        border = "cyan", 
        horiz=FALSE,
        legend=c("自動","手動"),beside=FALSE,cex.names=2)#cex.names=2標籤文字兩倍大
barplot(T_cyl3,
        main="cyl 汽缸數次數分配表", 
        xlab="汽缸數", 
        col=c("red", "blue", "green"), 
        names.arg=c("4 汽缸", "6 汽缸", "8 汽缸"), 
        border = "cyan", 
        horiz=FALSE,
        legend=c("自動","手動"),beside=FALSE,cex.names=2,space=2)#cex.names=2標籤文字兩倍；space直條間距離大