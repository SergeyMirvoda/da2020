gmp <- read.table("gmp.dat")
gmp$pop <- gmp$gmp/gmp$pcgmp
plot(pcgmp~pop, data=gmp, xlab="Население", log="xy",ylab="Доход на душу населения ($/человеко-год)", main="Метрополии США, 2006")
