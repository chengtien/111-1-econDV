googlesheets4::gs4_deauth()
googlesheets4::read_sheet(ss="https://docs.google.com/spreadsheets/d/1hXtBuoCTp87VUHKhUVz3wDY3lxXhsddNgrk8mlMmWcA/edit#gid=0",
                          sheet = "sheet1")->Accident
googlesheets4::read_sheet(ss="https://docs.google.com/spreadsheets/d/1_72TtZD2PxL9_RzL74pTJckJSEd7yVu6FyVxTwY_RP4/edit#gid=0",
                          sheet = "sheet1")->MotorVehicle

pivot_longer(data=Accident,cols=c(2:11),
             names_to="year",
             values_to="NumberOfAccident")->Accident
Accident$city<-factor(Accident$city,levels = c("臺北市","新北市","桃園市","臺南市","臺中市","高雄市"))

pivot_longer(data = MotorVehicle,cols = c(2:7),
             names_to ="city" ,
             values_to = "NumberOfAccident")->MotorVehicle_
MotorVehicle_$city<-factor(MotorVehicle_$city,levels = c("臺北市","新北市","桃園市","臺南市","臺中市","高雄市"))

plot1<-ggplot(data=Accident,
       mapping = aes(x=year,y=NumberOfAccident,
                     colour=city,group=city,label=city))+
  geom_point(shape=19,size=2)+
  geom_line(size=1.5,alpha=0.9)+
  scale_colour_manual(values = c("#F77E21","#B09B71",
                                 "#D8CCA3","#EDDFB3","#7D9D9C","#576F72"))+
  labs(title = "六都之中，誰的交通事故最少?
       ",
       subtitle = "平均每日交通事故發生件數(件/日)")+
  theme(axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(size = 24),
        plot.subtitle = element_text(hjust = 0.5,size = 20),
        legend.position="none")+
  scale_y_continuous(position = "right")

plot1

plot2<-ggplot(data=MotorVehicle_,
       mapping = aes(x=year,y=NumberOfAccident,
                     colour=city,group=city))+
  geom_point(shape=19,size=2)+
  geom_line(size=1.5,alpha=0.9)+
  scale_colour_manual(values = c("#F77E21","#B09B71",
                                "#D8CCA3","#EDDFB3","#7D9D9C","#576F72"))+
  labs(subtitle = "每萬輛機動車肇事數(件/萬輛)",
       caption="資料來源:行政院主計總處")+
  theme(axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        legend.key.size = unit(30,"pt"),
        legend.title = element_text(size = 16),
        legend.text = element_text(size = 14),
        plot.subtitle = element_text(hjust = 0.5,size = 20),
        plot.caption = element_text(size = 14))+
  scale_y_continuous(position = "right")+
  scale_x_continuous(breaks=seq(2012,2021,1)) 


plot1+plot2


ggdash()
