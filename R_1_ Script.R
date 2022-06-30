getwd()
setwd("D:/A5286")
getwd()
ims_trx=read.csv("training_data1_2207.csv")
View(ims_trx)
TRX_Round=round(ims_trx$TRX_Qty,0)
ims_trx=cbind(ims_trx,TRX_Round)
View(ims_trx)
str(ims_trx)
ims_trx$trgt_flg=as.character(ims_trx$trgt_flg)
target_flag=replace(ims_trx$trgt_flg,ims_trx$trgt_flg==c("N","Y"),c("NO","YES"))
View(target_flag)
ims_trx=cbind(ims_trx,target_flag)
View(ims_trx)
colnames(ims_trx)
subsetCols=ims_trx[,c("ims_id","TRX_Round", "target_flag")]
View(subsetCols)

subsetRows= ims_trx[ims_trx$TRX_Round>100,"TRX_Round"]
View(subsetRows)
trx_over_100=ims_trx[ims_trx$TRX_Round>100,c( "ims_id","TRX_Round", "target_flag")]
View(trx_over_100)
