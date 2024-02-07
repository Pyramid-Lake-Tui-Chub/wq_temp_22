library(dplyr)
library(tidyverse)
library(ggplot2)
library(lubridate)

## 1.5 M ----
#converting character datetimes to date datetimes
dates_2 <- as.POSIXct(temp_1_5$Date, format = "%m/%d/%Y %H:%M", tz="America/Vancouver")
head(dates_2)

### averaging temperature by day, ended up just being for fun!!!
#temp_1_5$day <- floor_date(temp_1_5$dates_2, "day") #round dates to a day
#dailymeans <- temp_1_5 %>% group_by(day) %>%
  #summarize(mean = mean(Temperature))

# attach useable dates to the dataframe
temp_1_5 <- cbind(temp_1_5, dates_2)

# scatterplot with line for 1.5
shoreplot <- ggplot(data=temp_1_5, aes(x=dates_2, y=Temperature)) +
  geom_point() +
  geom_smooth(se=FALSE) +
  ggtitle("1.5 M Thermograph") +
  theme(plot.title = element_text(size=18, hjust = 0.5),
        axis.text.x = element_text(size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=14),
        axis.title.y=element_text(size=14))
shoreplot + 
  scale_x_datetime(date_breaks = "2 weeks", date_labels = "%m/%d") + 
  labs(x="", y= "Temperature (C)") 

## 7 m ----

#converting character datetimes to date datetimes
date_3_1 <- as.POSIXct(temp_7$Date, format = "%m/%d/%Y %H:%M", tz="America/Vancouver")

# attach useable dates to the dataframe
temp_7 <- cbind(temp_7, date_3_1)

#accidentally bound too many times!
temp_7 <- subset(temp_7, select= -date_3_1)

# scatterplot with line for 1.5
plot_7 <- ggplot(data=temp_7, aes(x=date_3_1, y=Temp)) +
  geom_point() +
  geom_smooth(se=FALSE) +
  ggtitle("7 M Thermograph") +
  theme(plot.title = element_text(size=18, hjust = 0.5),
        axis.text.x = element_text(size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=14),
        axis.title.y=element_text(size=14))
plot_7 + 
  scale_x_datetime(date_breaks = "2 weeks", date_labels = "%m/%d") + 
  labs(x="", y= "Temperature (C)") 

rm(date_3)

## 15 m ----

#converting character datetimes to date datetimes
date_4 <- as.POSIXct(temp_15$Date, format = "%m/%d/%Y %H:%M", tz="America/Vancouver")

# attach useable dates to the dataframe
temp_15 <- cbind(temp_15, date_4)

# scatterplot with line for 1.5
plot_15 <- ggplot(data=temp_15, aes(x=date_4, y=Temp)) +
  geom_point() +
  geom_smooth(se=FALSE) +
  ggtitle("15 M Thermograph") +
  theme(plot.title = element_text(size=18, hjust = 0.5),
        axis.text.x = element_text(size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=14),
        axis.title.y=element_text(size=14))
plot_15 + 
  scale_x_datetime(date_breaks = "2 weeks", date_labels = "%m/%d") + 
  labs(x="", y= "Temperature (C)") 


