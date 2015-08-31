#FORMAT: summarise(df, sum = sum(A), avg = mean(B), var = var(B))
#min, sum, sd, max, mean, var, length, medium, IQR, first, last, nth, n, n_distinct
#summarise(), the last of the 5 verbs, follows the same syntax as mutate(), but the resulting dataset consists of a single row instead of an entire new column in the case of mutate(). 

library(dplyr)
library(hflights)

hflights
# Determine the shortest and longest distance flown and save statistics to min_dist and max_dist resp.
s1 <- summarise(hflights, min_dist = min(Distance), max_dist = max(Distance))
s1

# Determine the longest distance for diverted flights, save statistic to max_div. Use a one-liner!
s2 <- summarise(filter(hflights, Diverted == 1), max_div = max(Distance))
s2


#min(x) - minimum value of vector x.
#max(x) - maximum value of vector x.
#mean(x) - mean value of vector x.
#median(x) - median value of vector x.
#quantile(x, p) - pth quantile of vector x.
#sd(x) - standard deviation of vector x.
#var(x) - variance of vector x.
#IQR(x) - Inter Quartile Range (IQR) of vector x.
#diff(range(x)) - total range of vector x.

# Calculate summarizing statistics for flights that have an ArrDelay that is not NA
temp1 <- filter(hflights, !is.na(ArrDelay))
s1 <- summarise(temp1,
                earliest = min(ArrDelay),
                average = mean(ArrDelay),
                latest = max(ArrDelay),
                sd = sd(ArrDelay))

s1