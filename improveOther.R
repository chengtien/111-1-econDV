googlesheets4::gs4_deauth()
googlesheets4::read_sheet(ss="https://docs.google.com/spreadsheets/d/1vD-efs8ON6_R79W8R3YFaKROR7QxbMA6ofi5VGXf1Ig/edit#gid=0",
                          sheet = "sheet1")-> CPI
pivot_longer(data = CPI,
             cols = c(2:9),
             names_to = "type",
             values_to = "CPI")->CPI_
CPI_$type<-factor(CPI_$type,levels = c("總指數","衣著類","食物類","雜項類","交通及通訊類","居住類",
                                       "醫藥保健類","教養娛樂類"))

CPI_$month<-as_date(CPI_$month)
CPI_$month<-month(CPI_$month,label=TRUE,abbr = TRUE)


Jul<-CPI_|>dplyr::filter(month=="七月")

ggplot(data = CPI_,
       mapping = aes(x=month,y=CPI,
                     group=type,color=type,
                     label=type))+
  geom_line(size=1.5)+
  scale_colour_manual(values = c("#DC0000","#7FBCD2","#5F7161","#6D8B74",
                                 "#97C4B8","#D0B8A8","#C7BCA1","#D0B8A8"))+
  labs(title = "2022台灣消費者物價指數如何變化?",
       subtitle = "以七大類和總指數比較",
       caption = "資料來源:經濟部統計處")+
  scale_y_continuous(position = "right")+
  geom_label(data = Jul,
             mapping = aes(x=month,y=CPI,
                           label=type),
            nudge_x = -0.1,nudge_y = 0)+
  theme(axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        legend.position = "none",
        plot.title = element_text(size = 20),
        plot.subtitle = element_text(size = 18),
        plot.caption = element_text(size = 12))

ggdash()

  
  


