pivot_longer(data=HW1_,cols=2:6,
             names_to="year",
             values_to="unemployment_rate")->country_unemployment_rate


    
ggplot(data=country_unemployment_rate,
       mapping = aes(x=year,y=unemployment_rate,
                     colour=Country,group=Country))+
  geom_point()+
  geom_line()+
  scale_colour_manual(values = c("#FFCCFF","#FFCC33","#FF6633",
                                 "#009900","#66CCFF","#0033FF",
                                 "#000066","#9999FF","#CC66CC"))+
  labs(title = "世界各國近五年失業率",
       subtitle = "橫軸為年份,縱軸為失業率(單位為%)",
       caption="資料來源:https://www.stat.gov.tw/ct.asp?xItem=37200&ctNode=517&mp=4",
       y=NULL)
 
econDV2::ggdash()
