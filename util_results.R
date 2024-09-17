covrage_rate=function(para_mean,para_sd){
  p=dim(para_mean)[2]
  rate=rep(0,p)
  for(i in 1:p){
    a=(0>para_mean[,i]-1.96*para_sd[,i])&(0<para_mean[,i]+1.96*para_sd[,i])
    rate[i]=sum(a)/length(a)
  }
return(rate)
}

make_table_noRF=function(dml_tuning){
MEAN1=apply((dml_tuning[,est_per_theta_index]),2,mean)
MSE1=apply((dml_tuning[,est_per_theta_index])^2,2,mean)
SD1=apply(dml_tuning[,est_per_theta_index],2,sd)
SE1=apply(dml_tuning[,est_per_se_index],2,mean)
SE1_gee=apply(dml_tuning[,est_per_se_index3],2,mean)
#SE1_gee=apply(dml_tuning[,est_per_se_index],2,mean)
rate1=covrage_rate(dml_tuning[,est_per_theta_index],dml_tuning[,est_per_se_index3])
TABLE1=c(MEAN1[1]/8,rate1[1],SE1_gee[1]/SD1[1],MEAN1[4]/8,rate1[4],SE1_gee[4]/SD1[4],MEAN1[4]/MEAN1[1],MSE1[4]/MSE1[1])

MEAN2=apply((dml_tuning[,true_per_theta_index]),2,mean)
MSE2=apply((dml_tuning[,true_per_theta_index])^2,2,mean)
SD2=apply(dml_tuning[,true_per_theta_index],2,sd)
SE2=apply(dml_tuning[,true_per_se_index],2,mean)
rate2=covrage_rate(dml_tuning[,true_per_theta_index],dml_tuning[,true_per_se_index])
TABLE2=c(MEAN2[1]/8,rate2[1],SE2[1]/SD2[1],MEAN2[4]/8,rate2[4],SE2[4]/SD2[4],MEAN2[4]/MEAN2[1],MSE2[4]/MSE2[1])

MEAN3=apply((dml_tuning[,NM_theta_index]),2,mean)
MSE3=apply((dml_tuning[,NM_theta_index])^2,2,mean)
SD3=apply(dml_tuning[,NM_theta_index],2,sd)
SE3=apply(dml_tuning[,NM_se_index],2,mean)
rate3=covrage_rate(dml_tuning[,NM_theta_index],dml_tuning[,NM_se_index])
TABLE3=c(MEAN3[1]/8,rate3[1],SE3[1]/SD3[1],MEAN3[4]/8,rate3[4],SE3[4]/SD3[4],MEAN3[4]/MEAN3[1],MSE3[4]/MSE3[1])

TABLE=rbind(TABLE2,TABLE3,TABLE1)
TABLE=round(TABLE,3)
colnames(TABLE)=c("RBias","CoverR","AsySE/EmpSE","RBias","CoverR","AsySE/EmpSE","Bias_ratio","MSE_ratio")
return(TABLE)
}
