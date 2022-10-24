install.packages("tidyverse")
#install.packages("dplyr")
library(dplyr)

id   <- c(10,11,12,13)
name <- c('Luke','C-3PO','R2-D2','Darth Vader')
dob  <- c('19BBY', '112BBY', '33BBY', '41.9BBY')
df   <- data.frame(id, name, dob)

nrow(df)
df[5,] <- c("v1","v2","xx")

df[nrow(df) + 1,] = c("v1","v2","xx") #rbind, add_row {tibble} 

plot(df$gender)

g<-c('male', 'n/a','n/a','male')
df$gender<-g
summary(df)

summary(df)

df$gender == "male"



df$gender<- as.factor(g)
df
summary(df)

#Загрузим тестовый набор данных
data(starwars)
#посмотрим что в нём
dim(starwars)
?starwars

###Фильтрация
starwars %>%
  filter(skin_color == "light", eye_color == "brown")
#Это точно то же самое
#starwars[starwars$skin_color == "light" & starwars$eye_color == "brown", ]

###Сортировка
m1<-starwars %>% arrange(mass)
starwars %>% arrange(desc(mass))


###Выборка 
starwars %>% slice(5:10)
##TOP N
starwars %>%
  arrange(desc(mass)) %>% 
  slice(1:5)

##случайная
starwars %>% slice_sample(n = 10)
##
starwars %>% slice_max(height, n = 10)
starwars %>%
  filter(!is.na(mass)) %>%
  slice_max(height, n = 10)


#Колонки
starwars %>% select(homeworld, hair_color, skin_color, eye_color)
starwars %>% select(homeworld, ends_with("color"))
?select

#Вычисляемые колонки
starwars %>% mutate(height_m = height / 100)

#Переместить колонки
starwars %>% relocate(sex:homeworld, .before = height)

starwars$height


plot(starwars$height)
starwars$height


f<-starwars %>%
  filter(!is.na(height))
plot(f$height)
mean(f$height)
