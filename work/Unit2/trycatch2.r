tryCatch( 
  { 
    x =2 #x="1"字串輸出error錯誤；x=-1輸出warning錯誤
    z = sqrt(x) 
  },
  # 遇到 warning 時的自訂處理函數 
  warning = function(msg) {
    message(paste("[Warning]",msg,"\n")) 
    return(NULL) 
  },
  # 遇到 error 時的自訂處理函數 
  error = function(msg) { 
    message(paste("[Error]",msg,"\n")) 
    return(NA) 
  }
) 
ifelse(exists("z"),z,"z does not exist!") #ifelse(條件,TRUE,FLASE)
a= x 
a

