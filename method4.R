#mean method predicts avg value
arrivalmean<-meanf(fulldataarrival.ts,h=2000)
depmean<-meanf(fulldataarrival.ts,h=2000)

#naive method predicts last value value
arrivalnaive<-naive(fulldataarrival.ts,h=2000)
depnaive<-naive(fulldataarrival.ts,h=2000)

#drift method takes first and last observation 
#and draws line in between consider for log
arrivaldrift<-rwf(fulldataarrival.ts,h=2000,drift=T)
depdrift<-rwf(fulldataarrival.ts,h=2000,drift=T)

arrivaldriftlog<-rwf(logarrival,h=30,drift=T)
depdriftlog<-rwf(logdep,h=30,drift=T)

#seasonal naive takes seasonal values into 
#account/consider for log
arrivalSnaive<-snaive(fulldataarrival.ts,h=2000)
depSnaive<-snaive(fulldataarrival.ts,h=2000)

arrivalSnaivelog<-snaive(logarrival,h=30)
depSnaivelog<-snaive(logdep,h=30)

#plot results
plot(arrivalmean,plot.conf=F,main='arrival')
lines(arrivalnaive$mean,col=3,lty=2,lwd=5)
lines(arrivaldrift$mean,col=2,lty=2)
lines(arrivalSnaive$mean,col=6,lty=2)
#plot(fulldataarrival.ts[41895:43895], col=7, lty=2, lwd=1)
#plot(fulldataarrival.ts[41895:43895])
legend('topleft',lty=1,col=c(1,3,2,6),
       legend=c('mean method','naive method',
                'drift method','seasonal naive'))

plot(depmean,plot.conf=F,main='departure')
lines(depnaive$mean,col=3,lty=1)
lines(depdrift$mean,col=2,lty=1)
lines(depSnaive$mean,col=6,lty=1)
legend('topleft',lty=1,col=c(1,3,2,6),
       legend=c('mean method','naive method',
                'drift method','seasonal naive'))

#accuracy
accuracy(arrivalmean)
#accuracy(arrivalmean,testdataarrival)
accuracy(arrivaldrift)
accuracy(arrivalnaive)
accuracy(arrivalSnaive)

accuracy(depmean)
accuracy(depdrift)
accuracy(depSnaive)
accuracy(depnaive)








