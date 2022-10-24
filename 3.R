msg <- readLines('classwork3/putin-2012.txt')

#посчитаем кол-во символов
length(msg)
l<-lapply(msg, nchar)
Reduce(sum, l)

#можно не заморачиваться
txt <- paste(msg, collapse = " ")
nchar(txt)

r <- grep('мы',msg)
r
msg[r]

r <- grep('Мы', msg)
r
msg[r]

words <- unlist(strsplit(txt, ' '))
wc <- table(words)
wc <- sort(wc, decreasing = TRUE)
head(wc,20)
