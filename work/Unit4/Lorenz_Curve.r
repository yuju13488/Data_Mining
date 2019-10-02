Lorenz_Curve <- function(y_p,y_n,y_prob)
{
  #���X�p���ƶ� 
  L_chart_DT = as.data.frame( cbind(y_p,y_n,y_prob) )
  names(L_chart_DT) <- c("positive_flg","nagative_flg","yes_prob")
  
  #�̷� ��3����� [yes_prob] �y�����v����Ƨ�
  L_chart_DT = L_chart_DT[order(L_chart_DT[, 3], decreasing = TRUE), ]
  
  #�p��ֿn���Ҽ�
  L_chart_DT$target_cum = cumsum(L_chart_DT[, "positive_flg"])
  
  #�p��ֿn���ҼƤ��
  L_chart_DT$target_rto = L_chart_DT$target_cum/sum(L_chart_DT[, "positive_flg"])
  
  #�p��ֿn�ϨҼ�
  L_chart_DT$nontarget_cum = cumsum(L_chart_DT[, "nagative_flg"])
  
  #�p��ֿn�ϨҼƤ��
  L_chart_DT$nontarget_rto = L_chart_DT$nontarget_cum/sum(L_chart_DT[, "nagative_flg"])
  
  return(L_chart_DT)
  
}
