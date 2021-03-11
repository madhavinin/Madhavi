library(tidyverse)
library(data.table)
library(ggplot2)


#import all csv files
day1<-fread('05082020.csv',sep=',',header=TRUE)
day2<-fread('06082020.csv',sep=',',header=TRUE)
day3<-fread('07082020.csv',sep=',',header=TRUE)
day4<-fread('08082020.csv',sep=',',header=TRUE)
day5<-fread('09082020.csv',sep=',',header=TRUE)
day6<-fread('10082020.csv',sep=',',header=TRUE)
day7<-fread('11082020.csv',sep=',',header=TRUE)
day8<-fread('12082020.csv',sep=',',header=TRUE)
day9<-fread('13082020.csv',sep=',',header=TRUE)
day10<-fread('14082020.csv',sep=',',header=TRUE)
day11<-fread('15082020.csv',sep=',',header=TRUE)
day12<-fread('16082020.csv',sep=',',header=TRUE)
day13<-fread('17082020.csv',sep=',',header=TRUE)
day14<-fread('18082020.csv',sep=',',header=TRUE)



#combine all then convert to timeseries
fulldata<-rbind(day1,day2,day3,day4,day5,day6,day7,day8,day9,day10,day11,day12,day13,day14)
str(fulldata)

#filter data 
mydata<-as_tibble(fulldata)
nonzerovalue1<-fulldata%>%filter(fulldata$arrival_delay>0|fulldata$departure_delay>0 )
str(nonzerovalue1)
nonzerovalue1$stop_id<-as.factor(nonzerovalue1$stop_id)

arreqdep<-nonzerovalue1%>%filter(nonzerovalue1$arrival_delay==nonzerovalue1$departure_delay)
arrnoteqdep<-nonzerovalue1%>%filter(nonzerovalue1$arrival_delay!=nonzerovalue1$departure_delay)

#arreqdep$eq<-
wednesdays<-rbind(day1,day8)
thursdays<-rbind(day2,day9)
fridays<-rbind(day3,day10)
saturdays<-rbind(day4,day11)
sundays<-rbind(day5,day12)
mondays<-rbind(day6,day13)
tuesdays<-rbind(day7,day14)

nonzerovaluex<-fulldata%>%filter(arrival_delay>1900)
nonzerovaluex


#write.csv(carSpeeds, file = 'data/car-speeds-cleaned.csv')
write.csv(nonzerovalue1, file='nonzerovalue.csv')

#barchart of nonzero vs all obs
countnonzero<-c(5055,38840)
barplot(countnonzero,main='delays',
        names.arg = c('delayed','on time'),
        ylab='no of observation')

###scatterplot of stations with delays
#plot(x,y,xlab="PC1",ylab="PC2", col = ifelse(x < 0,'red','green'), pch = 19 )
plot(nonzerovalue1$arrival_delay,nonzerovalue1$departure_delay,col=ifelse(nonzerovalue1$arrival_delay==nonzerovalue1$departure_delay, 'red','blue'))

###stations with mean delay
meanstatdelay<-aggregate(nonzerovalue1,by=list(nonzerovalue1$stop_id),FUN = 'mean')
plot(meanstatdelay$arrival_delay,type = 'o')
lines(meanstatdelay$departure_delay,type='o',col='blue')

#mean of delays with days
meanweddelay<-aggregate(wednesdays,by=list(wednesdays$stop_id),FUN = 'mean')
meanthursdelay<-aggregate(thursdays,by=list(thursdays$stop_id),FUN = 'mean')
meanfridelay<-aggregate(fridays,by=list(fridays$stop_id),FUN = 'mean')
meansatdelay<-aggregate(saturdays,by=list(saturdays$stop_id),FUN = 'mean')
meansundelay<-aggregate(sundays,by=list(sundays$stop_id),FUN = 'mean')
meanmondelay<-aggregate(mondays,by=list(mondays$stop_id),FUN = 'mean')
meantuedelay<-aggregate(tuesdays,by=list(tuesdays$stop_id),FUN = 'mean')
plot(meanweddelay$arrival_delay,type='o')
plot(meanthursdelay$arrival_delay,type='o',col='blue')
plot(meanfridelay$arrival_delay,type='o',col='green')
plot(meansatdelay$arrival_delay,type='o',col='red')
plot(meansundelay$arrival_delay,type='o',col='yellow')
plot(meanmondelay$arrival_delay,type='o',col='brown')
lines(meantuedelay$arrival_delay,type='o',col='purple')
#heatmap with delay arrivaldelay,stopid
#using as.factor doesn't work
heatmap(data, scale="column", col = cm.colors(256))

meanmondelaymat<-as.matrix(meanmondelay)
heatmap(meanmondelaymat[,3:4],col=cm.colors(256), cexCol = 0.70)
meantuedelaymat<-as.matrix(meantuedelay)
heatmap(meantuedelaymat[,3:4],col=cm.colors(256), cexCol = 0.70)
meanweddelaymat<-as.matrix(meanweddelay)
heatmap(meanweddelaymat[,3:4],col=cm.colors(256), cexCol = 0.70)
meanthursdelaymat<-as.matrix(meanthursdelay)
heatmap(meanthursdelaymat[,3:4],col=cm.colors(256), cexCol = 0.70)
meanfridelaymat<-as.matrix(meanfridelay)
heatmap(meanfridelaymat[,3:4],col=cm.colors(256), cexCol = 0.70)
meansatdelaymat<-as.matrix(meansatdelay)
heatmap(meansatdelaymat[,3:4],col=cm.colors(256), cexCol = 0.70)
meansundelaymat<-as.matrix(meansundelay)
heatmap(meansundelaymat[,3:4],col=cm.colors(256), cexCol = 0.70)



