
getwd()
monthlyTRX=read.csv("training_data1_2207.csv")
View(monthlyTRX)
territory=read.csv("training_data2_2207.csv")
View(territory)
colnames(territory)[2]="Territory_ID"
View(territory)
specialtyGroup=read.csv("training_data3_2207.csv")
colnames(specialtyGroup)=c("IMS_Specialty","Specialty_Group")
View(specialtyGroup)

View(territory)
View(specialtyGroup)
terr2=merge(territory,specialtyGroup,by.x = "Spec", by.y = "IMS_Specialty",all.x = T)
View(terr2)
colnames(terr2)
terr2=terr2[-1]
View(terr2)
is.na(terr2$Specialty_Group)
terr2[is.na(terr2$Specialty_Group),]="OTHER"
View(terr2)
SpecialtyCount=aggregate(cbind(Count=ims_id)~Specialty_Group,data = terr2,FUN = function(x){NROW(x)})
View(SpecialtyCount)
ims_data=merge(terr2,monthlyTRX,by.x = "ims_id", by.y = "ims_id")
View(ims_data)
trx_sum_2012=aggregate(TRX_Qty~ims_id, data = ims_data, FUN = sum)
View(trx_sum_2012)
trx_sum_2012=trx_sum_2012[order(trx_sum_2012$TRX_Qty,decreasing = TRUE),]
View(trx_sum_2012)
targeted_physicians= ims_data[ims_data$trgt_flg=="Y",]
View(targeted_physicians)
