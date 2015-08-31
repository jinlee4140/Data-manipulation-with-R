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

# Calculate the maximum taxiing difference for flights that have taxi data available
temp2 <- filter(hflights, !is.na(TaxiIn), !is.na(TaxiOut))
s2 <- summarise(temp2, max_taxi_diff = max(abs(TaxiIn - TaxiOut)))
s2



#dplyr provides several helpful aggregate functions of its own, in addition to the ones that are already defined in R. These include:

#first(x) - The first element of vector x.
#last(x) - The last element of vector x.
#nth(x, n) - The nth element of vector x.
#n() - The number of rows in the data.frame or group of observations that summarise() describes.
#n_distinct(x) - The number of unique values in vector x.

# Calculate the summarizing statistics of hflights
s1 <- summarise(hflights, n_obs = n(),
                n_carrier = n_distinct(UniqueCarrier),
                n_dest = n_distinct(Dest),
                dest100 = nth(Dest, 100))
s1
hflights$UniqueCarrier

# Calculate the summarizing statistics for flights flown by American Airlines (carrier code "American")
aa <- filter(hflights, UniqueCarrier == "American")
aa

s2 <- summarise(aa, n_flights = n(), 
                n_canc = sum(Cancelled == 1), 
                p_canc = mean(Cancelled == 1) * 100, 
                avg_delay = mean(ArrDelay, na.rm = TRUE))
s2

#Think of n() as number of observations.