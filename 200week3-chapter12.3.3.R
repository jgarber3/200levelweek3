#12.3.3

#1 Why are gather and spread not symmetrical

stocks <- tibble(
  year   = c(2015, 2015, 2016, 2016),
  half  = c(   1,    2,     1,    2),
  return = c(1.88, 0.59, 0.92, 0.17)
)
stocks %>% 
  spread(year, return) %>% 
  gather("year", "return", `2015`:`2016`) %>%
  print()

#answer
#I think it has to do with the changng of types when you do the operartion. If you gether a bunch of columns it things those things are strings even if the
#values of them are actually integers. When we spread the yera and return above, that fact that they were numbers got lost when we pushed them to columns.
# When we gathered them back up, they are now cast to strings because gather has to turn them all into the same type to work.

#2 Why does the code fail?
#answer
#because the colun names cant be referenced a numberics, you have to use the ` symbol to reference them. 


#3 Why does spreading this fail?

people <- tribble(
  ~name,             ~demo,    ~range,
  #-----------------|--------|------
  "Phillip Woods",   "age",       45,
  "Phillip Woods",   "height",   186,
  "Phillip Woods",   "age",       50,
  "Jessica Cordero", "age",       37,
  "Jessica Cordero", "height",   156
)

#answer:
# its fails because you already have a record with an age for the first person and the third record has no place to go.
# To fix it with another column you could put some key on it so that you get unique combo key
people <- tribble(
~name,             ~demo,    ~range, ~number,
#-----------------|--------|------
"Phillip Woods",   "age",       45,  1,
"Phillip Woods",   "height",   186, 1,
"Phillip Woods",   "age",       50, 2,
"Jessica Cordero", "age",       37, 1,
"Jessica Cordero", "height",   156,  1
)
spread(people, key = "demo", value = "range")



#4 Tidy this 
preg <- tribble(
  ~pregnant, ~male, ~female,
  "yes",     NA,    10,
  "no",      20,    12
)
#answer
gather(preg, "gender","answers", male, female)
