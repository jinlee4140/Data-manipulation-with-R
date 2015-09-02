#GROUP_BY
#group_by lets you define groups within your data set. Its influence becomes clear when calling summarise() on a grouped dataset:
#summarizing statistics are calculated for the different groups separately.

#group_by(data, Var0, Var1, ...)
#data is the tbl dataset you work with, and var0, var1, ... are the variables you want to group by. If you pass on several variables as arguments, the number of separate sets of grouped observations will increase, but their size will decrease.

library(dplyr)
library(hflights)
#hflights$Cancelled
hflights %>%
  group_by(UniqueCarrier) %>%
  summarise(n_flights = n(), 
          n_canc = sum(Cancelled == 1), 
          p_canc = mean(Cancelled == 1) * 100, 
          avg_delay = mean(ArrDelay, na.rm = TRUE)) %>%
  arrange(avg_delay, p_canc)

#UniqueCarrier is NA, which should not be happening, right?????????????????
#Error on the top problem

# Answer the question: Which day of the week is average total taxiing time highest?
hflights %>% 
  group_by(DayOfWeek) %>%
  summarise(avg_taxi = mean(TaxiIn + TaxiOut, na.rm=TRUE)) %>%
  arrange(desc(avg_taxi))