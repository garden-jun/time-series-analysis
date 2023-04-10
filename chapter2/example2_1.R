## Example 2.1 : 선형모형 적합

install.packages("lmtest")
library(lmtest) # library for Durbin-Watson test(dwtest)
dir <- choose.dir() # 자료파일이 저장된 directory 지정
setwd(dir)
z <- scan("population.txt")
pop = round(z/10000)
pop=ts(pop, start=c(1960))
t <- 1:length(pop) # 시간변수 생성
t2 = t*t
m1 <- lm(pop ~ t)
dwtest(m1)
summary(m1)
ts.plot(pop, fitted(m1), xlab="year", ylab="population", lty=1:2, main="그림 2-3 총인구와 선형모형 예측값")
legend("topleft", legend=c("pop", "fitted"), lty=1:2)
ts.plot(resid(m1), type="o", xlab="year", ylab="residual", main="그림 2-4 선형모형 적합 후 잔차"); abline(h=0)
acf(resid(m1), main="잔차의 ACF")


m2 <- lm(pop ~ t + t2)
summary(m2)
ts.plot(pop, fitted(m2), xlab="year", ylab="population", lty=1:2, main="그림 2-5 총인구와 2차 선형모형 예측값")
ts.plot(resid(m2), type="o", xlab="year", ylab="residual", main="그림 2-6 2차 선형모형 적합 후 잔차"); abline(h=0)
legend("topleft", legend=c("pop", "fitted"), lty=1:2)
acf(resid(m2), main="잔차의 ACF")

lnpop <- log(pop)
m3 <- lm(lnpop ~ t+t2)
dwtest(m3)
summary(m3)
ts.plot(lnpop, fitted(m3), xlab="year", ylab="log population", lty=1:2, main="로그변환 후 2차 추세모형 예측값")
legend("topleft", legend=c("lnpop", "fitted"), lty=1:2)
ts.plot(resid(m3), ylab="residual", main="그림 2-7 로그변환 후 2차 추세모형 적합 후 잔차"); abline(h=0)
acf(resid(m3), main="잔차의 ACF")

