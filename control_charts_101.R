#https://study.urfu.ru/Aid/Publication/12279/2/Solonin.pdf

install.packages('qicharts')
install.packages('ggplot2')
library(qicharts)

#Для воспроизводимости
set.seed(7)
#Сгенерируем случайные числа - 24 штуки
y <- rnorm(24)

#Диаграмма случайных отклонений
qic(y, chart = 'i')


y[18] <- 7 #Внесём ошибку

# Plot I chart
qic(y, chart = 'i')

#Типы карт карта суммарного числа несоответствий
# c-карта 
m.vehicles       <- 300 #станков
m.ttg            <- 4 #среднее время изготовления детали (дней)
m.capacity       <- m.vehicles * 5 #дней всего
m.performance    <- m.capacity / m.ttg
p.od             <- 0.08 #8% переработки

# Сгенерируем данные
vehicles  <- rpois(24, lambda = m.vehicles)
workdays <- round(rnorm(24, mean = m.capacity, sd = 100))
n.pu        <- rpois(24, lambda = m.performance * p.od * 1.5)
#n.pat.pu    <- rbinom(24, size = discharges, prob = p.pu)
week        <- seq(as.Date('2022-01-01'),
                   length.out = 24, 
                   by         = 'week') 

# Combine data into a data frame
d <- data.frame(week, vehicles, workdays, n.pu)
d

d[d == 50] <- 70



qic(n.pu,
    x     = week,
    data  = d,
    chart = 'c',
    main  = 'Производительность (C chart)',
    ylab  = 'Count',
    xlab  = 'Week')

