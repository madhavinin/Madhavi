library(data.table)


time1x<-ts(rep(1,6),start=c(2019,7), frequency = 12)
time2x<-ts(rep(3,12),start=c(2020,1), frequency = 12)
time3x<-ts(c(time1,time2),start=start(time1),frequency = frequency(time1))
time1x
time2x
time3x

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

fulldataarrival.ts<-ts(fulldata$arrival_delay,start = 
                         c(2020,218),frequency=365*3136)
fulldataarrival.ts
plot(fulldataarrival.ts)


fulldatadep.ts<-ts(fulldata$departure_delay,start = 
                         c(2020,218),frequency=365*3136)

plot(fulldatadep.ts)

#scatterplot of arrival and dep
plot(fulldata$arrival_delay,fulldata$departure_delay)

