#Introduction to dplyr package and the tbl class. Learn the philosophy that guides dplyr, discover some useful applications of the dplyr package, and meet the data structures that dplyr uses behind the scenes.
#dplyr introduces a grammar of data manipulation.
#tbl %>%

#I will use dplyr to analyze a data set of airline flight data, containing flights that departed from Houston. This data is stored in a package called hflights.
library("dplyr")
library("hflights")
head(hflights)
tail(hflights)
summary(hflights)

str(hflights) 
dim(hflights) #tells you number of observations of number of variables only.
#There are 227496 observations of 21 variables.

hflights <- tbl_df(hflights)
hflights
#tbl, a special type of data.frame

glimpse(hflights) #gives you all of the variables in the row.
#as.data.frame(hflights)

#a tbl is just a special kind of data.frame. They make your data easier to ook at, but also easier to work with. On top of this, a tbl is straightforwardly derived from a data.frame sstructure using tbl_df().


two <- c("AA", "AS")
two
lut <- c("AA" = "American", 
         "AS" = "Alaska", 
         "B6" = "JetBlue")
two <- lut[two]
two




carriers <- hflights$UniqueCarrier
carriers

lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental", "DL" = "Delta", "OO" = "SkyWest", "UA" = "United", "US" = "US_Airways", "WN" = "Southwest", "EV" = "Atlantic_Southeast", "F9" = "Frontier", "FL" = "AirTran", "MQ" = "American_Eagle", "XE" = "ExpressJet", "YV" = "Mesa")
hflights$UniqueCarrier <- lut[hflights$UniqueCarrier]
hflights$UniqueCarrier
hflights$CancellationCode

lut <- c("A" = "carrier", "B" = "weather", "C" = "FFA", "D" = "security", "E" = "not cancelled")

hflights$CancellationCode <- lut[hflights$CancellationCode]
hflights$CancellationCode

glimpse(hflights)