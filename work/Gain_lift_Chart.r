Gain_Lift_Chart <- function (y,y_hat,y_prob) 
{
  
  #���X�p���ƶ� 
  gain_chart_DT = cbind( y,y_hat,y_prob)
  gain_chart_DT <- as.data.frame(gain_chart_DT)
  names(gain_chart_DT) <- c("positive_flg","y_hat","yes_prob")
  
  #�̷� ��3����� [yes_prob] �y�����v����Ƨ�
  gain_chart_DT = gain_chart_DT[order(gain_chart_DT[, 3], decreasing = TRUE), ]
  
  #�p��ֿn�`�H��(A)
  #��index row(gain_chart_DT[, 1, drop = FALSE])
  gain_chart_DT$row_index = row(gain_chart_DT[, 1, drop = FALSE])/nrow(gain_chart_DT)
  
  #�p��ֿn���Ҽ�
  gain_chart_DT$target_cum = cumsum(gain_chart_DT[, "positive_flg"])
  
  #�p��ֿn���ҼƤ��(B)
  gain_chart_DT$target_rto = gain_chart_DT$target_cum/sum(gain_chart_DT[, "positive_flg"])
  
  #�p��Lift (C)
  gain_chart_DT$lift = gain_chart_DT$target_rto / gain_chart_DT$row_index
  
  return(gain_chart_DT)
} 