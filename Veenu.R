This is to predict law enforcement officials v/s property crime. And the results shows that as number of officials 
increases then number of property crime decreases. 
This shows the affect of law enforcement officials on propertycrime . 

mod10<-lm(propertyCrime ~ Year+City, data=test.frame)
test.frame10<-data.frame(City = "San Jose",Year = 2012:2016,propertyCrime = 0)
propertyCrime.frame3<-predict(mod10,test.frame10)
propertyCrime.frame3
propertyCrime.frame3
1        2        3        4        5 
23111.14 23139.44 23167.74 23196.05 23224.35 

mod11<-lm(Law.Enforcement.Officials ~ Year+City, data=test.frame)
test.frame11<-data.frame(City = "San Jose",Year = 2012:2016,Law.Enforcement.Officials = 0)
Officials.frame3<-predict(mod11,test.frame11)
Officials.frame3
Officials.frame3
1        2        3        4        5 
1715.233 1713.039 1710.844 1708.649 1706.454 

plot(propertyCrime.frame3,Officials.frame3)

*********************************************************************************
This predicts the value of unemploymentrate and propertycrime, and the result is also linear 
where unenmployment decreases , property crime also decrease and viceversa.
This shows the affect of unemploymentrate on property crime

mod2<-lm(UnemploymentRate~propertyCrime+City+Year, data = test.frame)
test.frame2<-data.frame(City = "San Jose",Year = 2012:2016,UnemploymentRate= 0,propertyCrime =0)
UnemploymentAndpropertyCrime.frame3 <- predict.lm(mod2,test.frame2)
UnemploymentAndpropertyCrime.frame3
1        2        3        4        5 
22.51302 22.92715 23.34127 23.75539 24.16952 

mod3<-lm(propertyCrime~UnemploymentRate+City+Year, data = test.frame)
test.frame3<-data.frame(City = "San Jose",Year = 2012:2016,PropertyCrime = 0,UnemploymentRate= 0)
PropertyCrimeAndUnemployment.frame3 <- predict.lm(mod3,test.frame3)
PropertyCrimeAndUnemployment.frame3
1        2        3        4        5 
23588.44 23635.28 23682.12 23728.96 23775.80 
plot(UnemploymentAndpropertyCrime.frame3,PropertyCrimeAndUnemployment.frame3)