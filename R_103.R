getwd()
setwd("D:/A5286")
Attendee=read.csv("Attendee.csv")
Universe=read.csv("Universe.csv")
View(Attendee)
View(Universe)
Attendee=Attendee[Attendee$At_Class=="Physician" & Attendee$SP_flag==1,]
Universe=Universe[Universe$At_Class=="Physician",]
Universe_Control=Universe[!Universe$At_ID%in%Attendee$At_ID,]
View(Universe_Control)
install.packages('dplyr')
library(dplyr)
colnames(Attendee)
id_sales=Attendee[Attendee$Month>3& Attendee$Month<22,]
View(id_sales)

Attendee_new=Attendee[Attendee$At_ID%in%id_sales$At_ID,]
View(Attendee_new)
