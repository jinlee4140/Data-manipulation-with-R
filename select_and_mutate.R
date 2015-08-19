#The five verbs and select in more details: SELECT, FILTER, ARRANGE, MUTATE, SUMMARIZE.
#Select - removes columns from data set.
#Filter - removes rows
#Arrange - re-orders rows from a dataset
#Mutate - which uses data to build new column
#Summarize - calculates some of the statistics

#Variables are column names and Observatons are row names
#tidyr - tidy data; allows you to reorganize your data in a tidy way

#hflights comes with 21 variables. Of those 21 variables,  we will be working with just four variables - ActualElapsedTime, AirTime, ArrDelay, DepDelay.
#select(df, Group, sum)
library(dplyr)
library(hflights)
str(hflights)


x <- seq(0, 2 * pi, length = 100)
sinx <- sin(x)
plot(x, sinx)

# What order of operations should we use to to find the average value of the ArrDelay (arrival delay) variable for all American Airline flights in the  hflights tbl?
select(hflights, ActualElapsedTime, AirTime, ArrDelay, DepDelay)

#Print hflights, nothing has changed!
hflights

select(hflights, Origin:Cancelled)

select(hflights, -(DepTime:AirTime)) 

# - Operator allows you to select everything EXCEPT a column or range of columns


#dplyr comes with a set of helper functions that can help you select variables. These functions find groups of variables to select, based on their names. dplyr provides 6 helper functions, each of which only works when used inside select().

#starts_with("X"): every name that starts with "X"
#ends_with("X"): every name that ends with "X"
#contains("X"): every name that contains "X"
#matches("X"): every name that matches "X", which can be a regular expression
#num_range("x", 1:5): the variables named x01, x02, x03, x04 and x05
#one_of(x): every name that appears in x, which should be a character vector


# Return a tbl containing just ArrDelay and DepDelay
select(hflights, ends_with("Delay"))

# Return a tbl as described in the second exercise, using both helper functions and variable names
select(hflights, UniqueCarrier, ends_with("Num"), starts_with("Cancel"))

# Return a tbl as described in the third exercise, using only helper functions.
select(hflights, contains("Tim"), contains("Del"))


#Exercise 1
ex1r <- hflights[c("TaxiIn","TaxiOut","Distance")]
ex1r

ex1d <- select(hflights, contains("Taxi"), Distance)
ex1d


# Exercise 2
ex2r <- hflights[c("Year","Month","DayOfWeek","DepTime","ArrTime")]
ex2r

ex2d <- select(hflights, Year:ArrTime, -DayofMonth)
ex2d

# Exercise 3
ex3r <- hflights[c("TailNum","TaxiIn","TaxiOut")]
ex3r
ex3d <- select(hflights, starts_with("T"))
ex3d

#The Second of five verbs: mutate

#mutate(tblName, loss = ArrDelay - DepDelay)
mutate(hflights, loss = ArrDelay - DepDelay)
#mutate() is the second of five data manupulation functions you will get familiar with in this course. In contrast to select(), which retains a subset of all variables, mutate() creates new columns which are added to a copy of the dataset.
#Think of mutate() as a POST method and select() as a GET method.

# Add the new variable ActualGroundTime to a copy of hflights and save the result as g1.
g1 <- mutate(hflights, ActualGroundTime = ActualElapsedTime - AirTime)
g1

# Add the new variable GroundTime to a copy of g1 and save the result as g2.
g2 <- mutate(g1, GroundTime = TaxiIn + TaxiOut)
g2

g3 <- mutate(g2, AverageSpeed = Distance / AirTime * 60)
g3

#So far we've been using mutate() function to add a variable one at a time, but you can also use mutate() to add multiple variables at once. To create more than one variable, place a comma between each variable that you define inside mutate()

# Add a second variable loss_percent to the dataset and save the result to m1.
m1 <- mutate(hflights, loss = ArrDelay - DepDelay, loss_percent = (ArrDelay - DepDelay) / DepDelay * 100)
m1
# Remove the redundancy from your previous exercise and reuse loss to define the loss_percent variable.
# Assign the result to m2
m2 <- mutate(hflights, loss = ArrDelay - DepDelay, loss_percent = loss / DepDelay * 100)
m2

# Add the three variables as described in the third exercise and save the result to m3
m3 <- mutate(hflights, TotalTaxi = TaxiIn + TaxiOut, 
             ActualGroundTime = ActualElapsedTime - AirTime, 
             Diff = TotalTaxi - ActualGroundTime)
m3

#RECAP on mutate and select