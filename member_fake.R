#產生百萬假會員資料

Sys.setlocale(category = "LC_ALL", locale = "cht")

profile <- data.frame(
  
  id = paste("0000000", as.character( seq(from=1, to=1000000, by=1)),sep='' ) ,
  
  age = round(rnorm(1000000,25,3)),
  
  gender = sample(c("男生", "女生"), size = 1000000, replace = TRUE),
  
  group = sample(c("誠品人", "鋼鐵仁","香港人"), size = 1000000, replace = TRUE),
  
  zone = sample(c("台灣","香港"), size=1000000, replace=TRUE)
  
)

install.packages("sqldf")

library(sqldf)

profile$id <- sqldf("SELECT substr(id,-7,7) FROM profile")

profile_final <- data.frame(id = profile$id,
                            
                            age = profile$age,
                            
                            gender = profile$gender,
                            
                            group = profile$group,
                            
                            zone = profile$zone)

names(profile_final)[1] <- 'id'

head(profile_final,10)

#檔案輸出

write.table(profile_final, file = "profile.csv", quote = FALSE, sep = ",", row.names = FALSE, col.names =TRUE )

