library(dplyr)
library(tidyverse)
library(plotrix)

#making a tibble called summary with means and standard error for all values
summary <- habitat %>% group_by(Site) %>% 
            summarise(across(.cols = everything(), list(mean=mean, se=std.error), na.rm=TRUE))
summary <- summary %>% filter_at(vars(Clarity_mean, Conductivity_mean), all_vars(!is.na(.)))

# mean vs overall plot for clarity
clarity_plot <- ggplot(summary, aes(x=Site, y=Clarity_mean)) + 
  geom_point()+
  geom_errorbar(aes(ymin=Clarity_mean-Clarity_se, ymax=Clarity_mean+Clarity_se), width=.2, position=position_dodge(0.05)) +
  geom_hline(yintercept=6.207576, linetype="solid", color= "blue")+
  ggtitle("Site Mean Water Transparency (m) vs. Overall Water Transparency") +
  theme(plot.title = element_text(size=16, hjust = 0.5),
        axis.text.x = element_text(size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=14),
        axis.title.y=element_text(size=14))
clarity_plot + labs( x= "", y= "Water Transparency (m)")

#total clarity mean for comparison
mean(habitat$Clarity, na.rm=TRUE)

# mean vs overall plot for conductivity
conductivity_plot <- ggplot(summary, aes(x=Site, y=Conductivity_mean)) + 
  geom_point()+
  geom_errorbar(aes(ymin=Conductivity_mean-Conductivity_se, ymax=Conductivity_mean+Conductivity_se), width=.2, position=position_dodge(0.05)) +
  geom_hline(yintercept=8.259592, linetype="solid", color= "blue")+
  ggtitle("Site Mean Conductivity (mS/cm) vs. Overall Mean conductivity") +
  theme(plot.title = element_text(size=16, hjust = 0.5),
        axis.text.x = element_text(size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=14),
        axis.title.y=element_text(size=14))
conductivity_plot + labs( x= "", y= "Conductivity mS/cm")

#total conductivity mean for comparison
mean(habitat$Conductivity, na.rm=TRUE)

#
