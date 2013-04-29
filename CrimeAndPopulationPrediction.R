SantaClaraData2 <- read.csv ("E:/R/SantaClaraCountyCrimeData3.csv")
test.frame <- SantaClaraData2 [, 1:8]

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


mod4 <- lm(CrimeRate~Population+Year+City, data=test.frame)
test.frame4<-data.frame(City = "San Jose",Year = 2012:2016,Population = 0,CrimeRate = 0)
CrimeAndPopulation.frame3 <- predict.lm(mod4,test.frame4)
CrimeAndPopulation.frame3
CrimeAndPopulation.frame3
1        2        3        4        5 
6.621678 6.593392 6.565107 6.536822 6.508537 


UnemploymentRateModel<-lm(UnemploymentRate~Population+Year+City, data=test.frame)
test.frame.Unemployment<-data.frame(City = "San Jose",Year = 2012:2016,Population = 0,UnemploymentRate =0)
UnemploymentRateAndPopulation.frame3 <- predict.lm(UnemploymentRateModel,test.frame.Unemployment)
UnemploymentRateAndPopulation.frame3
UnemploymentRateAndPopulation.frame3
1         2         3         4         5 
-49.70860 -49.36700 -49.02541 -48.68381 -48.34222 

mod5 <-lm(CrimeRate~UnemploymentRate+Year+City, data = test.frame)
test.frame5<-data.frame(City = "San Jose",Year = 2012:2016,CrimeRate =0,UnemploymentRate =0)
CrimeAndUnemploymentRate.frame3 <- predict.lm(mod5,test.frame5)
CrimeAndUnemploymentRate.frame3
CrimeAndUnemploymentRate.frame3
1        2        3        4        5 
3.244976 3.238859 3.232741 3.226624 3.220506 

mod6<-lm(UnemploymentRate~CrimeRate+Year+City, data = test.frame)
test.frame6<-data.frame(City = "San Jose",Year = 2012:2016,UnemploymentRate =0,CrimeRate =0)
UnemploymentAndCrimeRate.frame3 <- predict.lm(mod6,test.frame6)
UnemploymentAndCrimeRate.frame3
UnemploymentAndCrimeRate.frame3
1        2        3        4        5 
15.31756 15.65371 15.98986 16.32601 16.66216 

mod7<-lm(UnemploymentRate ~ Year+City, data=test.frame)
test.frame7<-data.frame(City = "San Jose",Year = 2012:2016,UnemploymentRate = 0)
UnemploymentRate.frame3<-predict(mod7,test.frame7)
UnemploymentRate.frame3
UnemploymentRate.frame3
1        2        3        4        5 
10.27690 10.67604 11.07518 11.47432 11.87346 

mod8<-lm(CrimeRate ~ Year+City, data=test.frame)
test.frame8<-data.frame(City = "San Jose",Year = 2012:2016,CrimeRate = 0)
CrimeRate.frame3<-predict(mod8,test.frame8)
CrimeRate.frame3
CrimeRate.frame3
1        2        3        4        5 
2.574242 2.542075 2.509907 2.477739 2.445571 

plot(UnemploymentRate.frame3,CrimeRate.frame3)

mod9<-lm(OfficialsRate ~ Year+City, data=test.frame)
test.frame9<-data.frame(City = "San Jose",Year = 2012:2016,OfficialsRate = 0)
OfficialsRate.frame3<-predict(mod9,test.frame9)
OfficialsRate.frame3

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

