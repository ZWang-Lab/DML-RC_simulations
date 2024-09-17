library(xtable)

path_dml="code and results\\"
source("util_results.R")

est_per_theta_index=c(1:2,1:2+6);est_per_se_index=est_per_theta_index+2;
est_per_se_index2=est_per_theta_index+2;est_per_se_index3=est_per_theta_index+4;
true_per_theta_index=c(13:14,13:14+6);true_per_se_index=true_per_theta_index+4
NM_theta_index=c(25:26,25:26+6);NM_se_index=NM_theta_index+4

index=c(4,6,8)
rho=index/10
all_table=NULL

#Table 2
for(s in 1:4){
for(k in index){
  dml_tuning=NULL
    dml_data=read.table(paste0(path_dml,"linear_gee_minrho0.",k,"\\dml_me_tuning_C",s,".txt"),header=F)
    dml_tuning=rbind(dml_tuning,dml_data)
  dim(dml_tuning)
  A=make_table_noRF(dml_tuning)
  all_table=rbind(all_table,A) 
}}
#all_table
Input=rep(c("True","Uncorrected","Corrected"),12)
MinRho=rep(c("","0.4","","","0.6","","","0.8",""),4)
all_table2=cbind(MinRho,Input,all_table)
rownames(all_table2)=1:36
all_table2=all_table2[-c(4,7,13,16,22,25,31,34),]

rowindex=c(1,6,7,4,5,2,3,8,13,14,11,12,9,10,15,20,21,18,19,16,17,22,27,28,25,26,23,24)
final_table=all_table2[rowindex,]
rownames(final_table)=1:dim(final_table)[1]
xtable(final_table,auto=T)

#Table S1
for(s in 1:4){
for(k in index){
  dml_tuning=NULL
   dml_data=read.table(paste0(path_dml,"nonlinear_sigmoid_gee_minrho0.",k,"\\dml_me_tuning_C",s,".txt"),header=F)
    dml_tuning=rbind(dml_tuning,dml_data)
  dim(dml_tuning)
  A=make_table_noRF(dml_tuning)
  all_table=rbind(all_table,A) 
}}
#all_table
Input=rep(c("True","Uncorrected","Corrected"),12)
MinRho=rep(c("","0.4","","","0.6","","","0.8",""),4)
all_table2=cbind(MinRho,Input,all_table)
rownames(all_table2)=1:36
all_table2=all_table2[-c(4,7,13,16,22,25,31,34),]

rowindex=c(1,6,7,4,5,2,3,8,13,14,11,12,9,10,15,20,21,18,19,16,17,22,27,28,25,26,23,24)
final_table=all_table2[rowindex,]
rownames(final_table)=1:dim(final_table)[1]
xtable(final_table,auto=T)

