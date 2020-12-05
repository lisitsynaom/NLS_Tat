--
title: ggplots
--
library(ggplot2)

# Figue of positive cluster distribution in NLS and matching with NoLS
t_cluster<-c(2,3,4,5,6,7,8,9,11,12,2,3,4,5,6,7,8,9,12)
t_percent<-c(8.73015873,37.3015873,31.74603175,11.9047619,4.761904762,2.38095238095238,0.793650794,1.587301587,0.793650794,3.975535168,40.36697248,30.27522936,15.29051988,5.810397554,1.834862385,0.917431193,0.917431193,0.611620795)
t_mNolS<-c(18.18181818,31.91489362,50,80,100,100,100,100,100,7.692307692,22.72727273,38.38383838,50,78.94736842,100,100,100,100)
t_type<-c("viral","viral","viral","viral","viral","viral","viral","viral","viral","human","human","human","human","human","human","human","human","human")
t_table_frame<-data.frame("pc"=t_cluster, "percent"=t_percent, "match with NoLS"=t_mNolS, "organism"=t_type)

ggplot(data=t_table_frame, aes(x=pc, y=1, group=match.with.NoLS, color=match.with.NoLS))+
       geom_point(aes(size=percent))+
       labs( x="Number of positive aa", y=" ")+
       theme(panel.background = element_rect(color="black", fill = "white"), panel.grid.major = element_line(size=0.5, linetype = 'solid'), axis.title = element_text(size=14), axis.text = element_text(size=15))+scale_radius(range = c(5,15))+scale_x_discrete(limits=c(2:12))+scale_y_discrete(limits=c(1:2)) +facet_wrap(~organism)
ggsave("Human+Viral NLS clusters_NoLS.tiff", plot=last_plot(), device = "tiff")

# Figue of positive cluster distribution and density in NLS 
 p_cluster<-c(3,3,4,4,5,5,5,6,6,6,7,7,8,9,9,10,10,11,12,13,14,19,3,3,4,4,5,5,5,6,6,6,7,7,7,7,8,8,8,9,9,9,10,10,10,11,13,21)
 p_density<-c(0.67,1,0.75,1,0.6,0.8,1,0.666666667,0.833333333,1,0.714285714,0.857142857,0.75,0.666666667,0.888888889,0.6,0.8,0.727272727,0.916666667,0.692307692,0.785714286,0.631578947,0.666666667,1,0.75,1,0.6,0.8,1,0.666666667,0.833333333,1,0.571428571,0.714285714,0.857142857,1,0.625,0.75,1,0.666666667,0.777777778,0.888888889,0.7,0.8,0.9,0.818181818,0.923076923,0.571428571)
p_percent<-c(8.73015873,16.66666667,19.84126984,15.87301587,0.793650794,15.07936508,3.968253968,0.793650794,7.142857143,1.587301587,0.793650794,0.793650794,0.793650794,0.793650794,0.793650794,0.793650794,0.793650794,0.793650794,0.793650794,0.793650794,0.793650794,0.793650794,3.975535168,21.71253823,16.20795107,14.37308869,2.44648318,10.70336391,4.892966361,4.281345566,5.198776758,1.22324159,0.917431193,4.892966361,2.752293578,0.611620795,0.305810398,0.917431193,0.305810398,0.917431193,0.917431193,0.305810398,0.305810398,0.305810398,0.611620795,0.305810398,0.305810398,0.305810398)
 p_type<-c("viral","viral","viral","viral","viral","viral","viral","viral","viral","viral","viral","viral","viral","viral","viral","viral","viral","viral","viral","viral","viral","viral","human","human","human","human","human","human","human","human","human","human","human","human","human","human","human","human","human","human","human","human","human","human","human","human","human","human")
 table_frame<-data.frame("pc"=p_cluster, "pd"=p_density, "percent"=p_percent, "organism"=p_type)

 ggplot(data=table_frame, aes(x=pc, y=pd))+
        geom_point(aes(size=percent), color="#2F4F4F")+
        labs(x="cluster lenght", y="cluster density")+
        theme(panel.background = element_rect(color="black", fill = "white"), panel.grid.major = element_line(size=0.5, linetype = 'solid', color="gray"),  axis.title = element_text(size=14), axis.text = element_text(size=15))+scale_radius(range = c(2,10))+facet_wrap(~organism)  
        
        ggsave("Human+Viral NLS clusters.tiff", plot=last_plot(), device = "tiff")
