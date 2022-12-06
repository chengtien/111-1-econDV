pivot_longer(data=HW2,cols=2:11,
             names_to="year",
             values_to="NumberOfAccident")->accident
accident$city<-factor(accident$city,levels = c("臺北市","新北市","桃園市","臺中市","臺南市","高雄市"))


ggplot(data=accident,
       mapping = aes(x=year,y=NumberOfAccident,
                     colour=city,group=city))+
  geom_point(shape=15)+
  geom_line()+
  scale_colour_manual(values = c("#FF9900","#e9e9e9",
                                 "#CCCCCC","#999999","#666666","#333333"))+
  labs(title = "直轄市交通事故發生件數",
       subtitle = "橫軸為年份,縱軸為平均每日交通事故發生件數(件/日)",
       caption="資料來源:行政院主計總處https://winsta.dgbas.gov.tw/DgbasWeb/ZWeb/StateFile_ZWeb.aspx")+
  theme(axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        legend.key.size = unit(20,"pt"))

ggdash()
