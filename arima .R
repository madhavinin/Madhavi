#log
logarrival<-log(fulldataarrival.ts)
plot(logarrival)
logdep<-log(fulldatadep.ts)
plot(logdep)


#ARIMA on arrival and dep
library(forecast)
arrivalarimafull<-auto.arima(fulldataarrival.ts)
attributes(arrivalarimafull)
deparimafull<-auto.arima(fulldatadep.ts)
attributes(deparimafull)


#ACF and PACF Plots
acf(arrivalarimafull$residuals, main='Arrival Correlogram')
pacf(arrivalarimafull$residuals, main='Arrival Partial Correlogram')

acf(deparimafull$residuals, main='Dep Correlogram')
pacf(deparimafull$residuals, main='Dep Partial Correlogram')

#Ljung-box test
Box.test(arrivalarimafull$residuals, lag=20, type ='Ljung-Box')
Box.test(deparimafull$residuals, lag=20, type ='Ljung-Box')

#forecast
forecastarrival3<-forecast(arrivalarimafull,2000)
forecastdep<-forecast(deparimafull,2000)

library(ggplot2)
autoplot(forecastarrival3)
autoplot(forecastdep)

#accuracy 
accuracy(forecastarrival3)
accuracy(forecastdep)
