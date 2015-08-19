#we use filter() to ask simple question. How many flights were cancelled in the year of 2015? You use filter to extract specific observations.
#f1 <- select(hflights, starts_with("Cancel", DepDelay)
library(dplyr)
library(hflights)
filter(hflights, Cancelled == 1)

?Comparison

# All flights that traveled 3000 miles or more.
f1 <- filter(hflights, Distance >= 3000)
f1
# All flights flown by one of JetBlue, Southwest, or Delta airlines
f2 <- filter(hflights, UniqueCarrier %in% c("JetBlue", "Southwest", "Delta"))

#x %in% c(a, b, c), TRUE if x is in the vector c(a, b, c)


# All flights where taxiing took longer than flying
f3 <- filter(hflights, TaxiIn + TaxiOut > AirTime)
#R also comes with a set of boolean operators that you can use to combine multiple logical tests into a single test. These include &, L, and !, respectively the and, or, and not operators.
#If you supply filter() with multiple tests separated by commas, it will return just the rows that satisfy each test(as if the tests were joined by an & operator).

# all flights that departed before 5am or arrived after 10pm.
f1 <- filter(hflights, DepTime < 500 | ArrTime > 2200)

# all flights that departed late but arrived ahead of schedule
f2 <- filter(hflights, DepDelay > 0, ArrDelay < 0)

# all cancelled weekend flights
f3 <- filter(hflights, DayOfWeek %in% c(6,7), Cancelled == 1)

# all flights that were cancelled after being delayed
f4 <- filter(hflights, Cancelled == 1, DepDelay > 0)


# Select the flights that had JFK as their destination
c1 <- filter(hflights, Dest == "JFK")

c1
str(c1)

# Combine the Year, Month and DayofMonth variables to create a Date column
c2 <- mutate(c1, Date = paste(Year, Month, DayofMonth, sep = "-"))
#******* NOT UNDERSTANDING THE MUTATE ABOVE THIS COMMENT
c2$Date
# Retain only a subset of columns to provide an overview
select(c2, Date, DepTime, ArrTime, TailNum)

#How many weekend flights flew a distance of more than 1000 miles but had a total taxiing time below 15 minutes?
a1 <- filter(hflights, DayOfWeek %in% c(6,7), Distance > 1000, TaxiIn + TaxiOut < 15)
str(a1)
#Answer: 155 flights. Didn't find that answer yet but figure it out.
