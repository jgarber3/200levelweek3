library(tidyverse)

#load up the example tables
table2 <- data.frame(country = c("Afghanistan","Afghanistan","Afghanistan","Afghanistan","Brazil","Brazil"), year = c(1999,1999,2000,2000,1999,1999), 
                     type = c("cases","population","cases","population","cases","population"), count = c(745,3423423424,5656,34545654445,333,435345354))
table4a <- data.frame(country = c("Afghanistan","Brazil","China"), "1999" = c(745,5656,333), "2000" = c(34534,23,345))
table4b <- data.frame(country = c("Afghanistan","Brazil","China"), "1999" = c(3423423424,34545654445,4353455354), "2000" = c(3423423424,34545654445,4353455354))

#excercise12.2.1
#2- compute rate from table 2
cases <- table2[which(table2$type == "cases"),]
pop <- table2[which(table2$type == "population"),]
combined <- inner_join(cases,pop, by=c("country","year"))
rates <- mutate(combined, rate = (count.x / count.y) * 10000)

#computer for table 4a and 4b
combined <- inner_join(table4a,table4b, by=c("country"))
rates <- mutate(combined, rate1999 = (X1999.x / X1999.y) * 10000, rate2000 = (X2000.x / X2000.y) * 10000)

#3 plot the chart using table2
new <- spread(table2, key="type", value = "count")
new <- mutate(new, rate = cases / population * 10000)
library(ggplot2)
ggplot(new, aes(year, cases)) + 
  geom_line(aes(group = country), colour = "grey50") + 
  geom_point(aes(colour = country))
