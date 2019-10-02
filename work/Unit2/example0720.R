data(cars) #內建資料
str(cars)
summary(cars)

#將速度分成3類，數字轉文字(case...when...)
#第一類 speed<12 ; 第二類 speed <15 ; 第三類 speed >= 15
cars$speed
x1 = cars$speed
new_cars_band = 1*(x1<12) + 2*(x1>=12 & x1<15) + 3*(x1>=15)
new_cars_band
label=c('慢','中','快')
new_cars_band=label[new_cars_band]
new_cars_band

#速度轉車種%in%(ifelse)
#慢、中轉一般轎車；快轉跑車
car_categ=c('一般轎車','跑車')
new_cars_band_1=1*(new_cars_band%in%c('慢','中'))+2*(new_cars_band%in%c('快'))
new_cars_band_1=car_categ[new_cars_band_1]
new_cars_band_1

#within(case...when...)
new_cars<-cars
new_cars<-within(new_cars,
                 {
                   speed_level <- NA  #一定要指定一個值
                   speed_level[cars$speed<12] <- "慢"
                   speed_level[cars$speed>=12 & cars$speed<15] <- "中"
                   speed_level[cars$speed>=15] <- "快"
                 }
                )
head(new_cars,5)

#transfrom
new_cars<-cars
new_cars<-transform(new_cars,
           new_var1=new_cars$speed*new_cars$dist,
           new_var1=new_cars$dist
           )
head(new_cars,10)
