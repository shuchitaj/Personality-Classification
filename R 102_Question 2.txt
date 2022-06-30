monthlyTRX <- read.csv("training_data1_2207.csv", header = TRUE)
territory <- read.csv("training_data2_2207.csv", header= TRUE)
speciatltyGroup <- read.csv("training_data3_2207.csv", header= TRUE)
colnames(territory)
colnames(speciatltyGroup)
colnames(territory)= c("ims_id","Territory_ID","IMS_Specialty")
specialtyGroup <- speciatltyGroup
colnames(specialtyGroup)
colnames(specialtyGroup) <- c("IMS_Specialty","Specialty_Group")
terr2 <- merge(x=territory, y=specialtyGroup, by= "IMS_Specialty", all.x = TRUE)
terr2
str(terr2)
anyNA(terr2)
terr2$Specialty_Group <- as.character(terr2$Specialty_Group)
terr2[is.na(terr2)] <- "OTHER"
terr2[,'IMS_Specialty'] <- NULL
SpecialtyCount <- table(terr2$Specialty_Group)
SpecialtyCount
ims_data <- merge(x=monthlyTRX, y=terr2, by = "ims_id")
anyNA(ims_data)
 trx_sum_2012 <- aggregate(x= ims_data$TRX_Qty,
                           by= list(ims_data$ims_id),
                           FUN= sum)
ims_data$trgt_flg <- as.character(ims_data$trgt_flg) 
targeted_physicians <- subset(ims_data, trgt_flg == "Y", c(1:6))

