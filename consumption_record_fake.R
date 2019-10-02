#產生百萬假會員一年的消費資料

trans_df <- data.frame(data_month=character(),
                       
                       id=character(),
                       
                       product=character(),
                       
                       Logicals=logical(),
                       
                       Characters=character(),
                       
                       amt=integer()
                       
)

#每月產出假消費紀錄

for(i in 1:12)
  
{
  
  id = sample(profile_final$id, size = round(runif(1,300000,700000)), replace = TRUE)
  
  i_month <- ifelse(nchar(i)==1,paste('0',i,sep=''),i)
  
  tmp_df <- data.frame(
    
    data_month = paste('2019/',i_month,'/01',sep=''),
    
    id = id,
    
    product = sample(c("中文書", "外文書","雜誌","兒童","CD","DVD","風格文具",'生活雜貨'), size = length(id), replace = TRUE),
    
    amt = round(runif(length(id),50,699))
    
  )
  
  trans_df <- rbind(trans_df,tmp_df)
  
}

#檔案輸出

write.table(trans_df, file = "trans.csv", quote = FALSE, sep = ",", row.names = FALSE, col.names =TRUE )