
file.access("C:/Users/Gardenjun/Desktop/data",2)
source("C:/Users/Gardenjun/Desktop/data")


data <- read.table("C:/Users/Gardenjun/Desktop/data/usapass_hw1.txt")
n <- nrow(data)
t <- 1:n

df <- data.frame(t, data)
df


# 데이터 그래프 그리기
plot(df, type="l", ylab="usapass")


