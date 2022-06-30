ims_trx <- read.csv("training_data1_2207.csv", header = TRUE)
TRX_Round <- round(ims_trx$TRX_Qty)
str(ims_trx)
ims_trx$trgt_flg <- as.character(ims_trx$trgt_flg)
target_flag <- replace(ims_trx$trgt_flg, ims_trx$trgt_flg== "N","No")
target_flag <- replace(target_flag, target_flag== "Y","Yes")
target_flag
ims_trx <- cbind(ims_trx, TRX_Round, target_flag)

subsetCols <- c("ims_id","TRX_Round","target_flag")

ims_trx[,subsetCols]

options(max.print = 100000)

ims_trx[,subsetCols]

subsetRows <- subset(TRX_Round, TRX_Round>100)

ims_trx[subsetRows,]

trx_over_100 <- ims_trx[subsetRows,subsetCols]

TRX_Round

ims_trx
