# 3. LIST ----

### 1) vector 와 list ----
v1 <- c(1,2,3);v1;length(v1)
class(v1)

v2 <- c(1,2,3,"김정수");v2;length(v2)
class(v2)

# named vector
v3 <- c(a=1,b=2,a=3,c=20);v3;length(v3)
class(v3)
View(v1)
View(v3)

#list

xx1 <- list(name="이태규",addr ="화곡동")
xx1
View(xx1)
xx1$name;xx1$addr

### 2) list (key=value) ----
# + list(element = item)
# + list(원소 = 값)

#key만 추가
xx1 <- list(name="이태규",height=180)
xx1
xx2 <- c(xx1,list(phone=NA))
xx2

View(xx2)
# key와 value 추가 ----
xx3 <- c(xx2, list(addr="화곡동"))
xx3
View(xx3)

#
xx3[4] #index별 list box 통채로 확인인
class(xx3[4]) #list

xx3[[4]]              #unboxing 후 내용물 확인
class(xx3[[4]])       #문자 vector

xx3$addr              # == xx3[[4]]
class(xx3$addr)       
View(xx3)

### 3) list boxing / unboxing 테스트 ----
#1번째 list box에 value 추가
xx3[1]
temp01 <- c(xx3[1],'이승범') # key 없음
temp01

View(temp01)
# 1번째 list box를 unboxing 하고 value 추가
xx3[1]
temp02 <-c(xx3[[1]],"이승범")
temp02
View(temp02)

### 4) list box별 value 추가 ----
xx3
xx3[[1]] <- c(xx3[[1]],"김정수")
xx3[[2]]<-c(xx3[[2]],185)
xx3[[3]]<-c(xx3[[3]],6378)
xx3[[4]]<-c(xx3[[4]],"노량진")
View(xx3)
#데이터 조회 ----
xx31[1]
xx3[[1]][2]
xx3[[1]][1]

#리스트 값 갱신
xx3

xx3[[3]][1] <- "5830"
xx3[[3]][1]

#리스트 삭제
xx3[3] <- NULL
xx3 # 전화번호 삭제제

# 4. data.frame ----

### 1) data.frame copy 방식
#+ SQL> create table ... as select ...;

my_mpg <- as.data.frame(ggplot2::mpg)
#+ as.data.frame(x), x가 데이터프레임이 아닐 경우
my_mpg <- ggplot2::mpg
class(my_mpg)

### 2) df(데이터프레임)생성, key-in 방식 ----
java <- c(100,20,45,66,71)
eng <- c(54,71,78,86,91)
jp <- c(64,92,88,66,31)
java;eng;jp;
my_score<-data.frame(java,eng,jp)
my_score

# 변수 생성을 깜박!
team <- c(1,2,3,4,5)
my_score <- data.frame(java,eng,jp,team)
my_score

#과목별 평균값
m_java<- mean(my_score$java)
m_eng<- mean(my_score$eng)
m_jp<- mean(my_score$jp)
mean(my_score$team)

### 3) 엑셀파일 읽기와 쓰기 ----
mean_sc <- data.frame(m_java,m_eng,m_jp)
mean_sc

install.packages("writexl")
getwd()
writexl::write_xlsx(mean_sc,"dts/m_score.xlsx")

#read
getwd()
install.packages("readxl")
library(readxl)
search()

df_xl <- read_xlsx("dts/f_exam.xlsx",sheet=1,col_names=T)
class(df_xl)
dim(df_xl)
head(df_xl)
# Q. 과목별 평균값 구해서, 다시 파일로 내려쓰기
names(df_xl)
m_eng <- mean(df_xl$eng)
m_japan <- mean(df_xl$japan)
m_math <- mean(df_xl$math)

my_xl<- data.frame(m_eng,m_japan, m_math)
writexl::write_xlsx(my_xl, "dts/my_xl.xlsx")

#type f_exam.csv csv로 실행시키기
.libPaths()
### 4) csv 파일 ----
#+ csv: comma separated value
#+ sheet 개념없음, headder == xl파일 col_names

#읽기
?read.csv()
getwd()
my_csv<-read.csv("dts/f_exam.csv")
my_csv

# 저장
write.csv(my_csv, file="dts/new_my_csv.csv")

#객체 사이즈 궁금
object.size(my_csv)
object.size(df_xl)
### 라이브러리경로 설정시 필요----
.libPaths("C:/PR/R-4.2.1/library")
"C:/PR/R-4.2.1/library"
.libPaths()
### 5) txt 파일 ----

# write 방법 ----
my_txt <- c("김정수", "이태규","배창현","박소현","문주현","김혜민","이승범","남정식","김혁")

my_txt
writeLines(my_txt,"dts/my_class.txt")

# q.

#파일 불러오기
mt_txt <- readLines("dts/txt2.txt",encoding = "UTF-8")
class(my_txt)
length(my_txt)

#공백기준으로 split
?strsplit()
my_split <- strsplit(my_txt,split=" ")
class(my_split)
length(my_split)

#list를 파일로 저장
?save()
save(my_split, file="dts/my_txt42.txt")
save(my_split, file="dts/my_txt42.RData")

#메모리 변수 확인 및 삭제
ls()
rm(list=ls())

#RData reload
?load()
load("dts/my_txt42.RData")
ls()

my_split

### 6) 컬럼 조정 ---

me <- read.csv("dts/f_exam.csv")
#컬렴명 변경
install.packages("dplyr")
library(dplyr)
search()

#+ rename(dts, new_cname = old_cname)
names(me)
me <- dplyr::rename(me, jp = japan) # 오른쪽에서 왼쪽으로로
names(me)

# 컬럼추가
me$kang <- c(11:20)
me[,"new_col"]<-c(1:10)
names(me)
me

#컬럼삭제
# 삭제는 NULL을 주면 됨 ----
me$new_col <- NULL
names(me)
# q1
my_mpg <- ggplot2::mpg
my_mpg
names(my_mpg)
my_mpg <- dplyr::rename(my_mpg, city =cty, highway=hwy)
names(my_mpg)
my_mpg

### 7) 파생변수
#+ 원래 컬럼을 조합하여 new 컬럼 생성
#+ 항상 맨 오른쪽에 생성

#data.frame
my_sc <- data.frame(
  eng=c(100,67,89,34,56),
  math=c(50,77,64,51,96),
  japan=c(95,77,82,34,76)
)
#sum 파생변수 ----
my_sc

my_sc$sum <- my_sc$eng+my_sc$math+my_sc$japan
my_sc

#avg 파생변수
my_sc$avg <- round((my_sc$eng+my_sc$math+my_sc$japan)/3,2)
my_sc$avg2 <- round(my_sc$sum/3,2)
my_sc

# 7-2 ) 종합연비(total) = (cty + hwy)/2
my_mpg <- ggplot2::mpg
my_mpg$total <- (my_mpg$cty + my_mpg$hwy)/2
my_mpg
names(my_mpg)
my_mpg[c(1,8,9,12)] |> head(4)

#평균, 요약 통계량, 히스토그램 ----
mean(my_mpg$total)
summary(my_mpg$total)
x11()
hist(my_mpg$total)

# 8) 조건 파생변수 ----
#+ test: total >= 25, pass
#+ ifelse(조건,T,F)
#+ SQL> decode(조건,T,F),case when()

my_mpg$total
my_mpg$test <- ifelse(my_mpg$total>=25, "Pass","Fail")
table(my_mpg$test)

View(my_mpg)
names(my_mpg)
#q  연료를 찾아 골라서 pass된 부분을 저장시키기
my_mpg[c(1,8,9,12)]
my_mpg[c(1,2,11,13)]
table(my_mpg$test)
my_mpg[my_mpg$test=="Pass",c(1,2,13)]|>head(3)

khm <- unique(my_mpg[my_mpg$test=="Pass",c(1,2,13)])
write.csv(khm,file="dts/khm.csv")

### 9) 빈도확인 ----

table(my_mpg$test)
#hist(my_mpg$test)
ggplot2::qplot(my_mpg$test)

names(my_mpg)
my_mpg$grade <- ifelse(my_mpg$total >= 31, "Excellent",
                       ifelse(my_mpg$total >= 21, "Good",
                       ifelse(my_mpg$total >= 15, "Normal","Poor")))
table(my_mpg$grade)
x11()
ggplot2::qplot(my_mpg$grade)


# Q
#Q-1 ) 데이터 카피
#+ cdhlmnstrV
data(package="ggplot2")
my_midwest <- ggplot2::midwest
my_midwest

# Q-2 ) 컬럼명 변경
names(my_midwest)
table(my_midwest)
my_midwest <- dplyr::rename(my_midwest, total_p = poptotal, black_p = popblack)
names(my_midwest)

# Q-3 ) 흑인인구 백분율과 히스토그램
my_midwest$black_rt <- (my_midwest$black_p / my_midwest$total_p)*100
names(my_midwest)
#히스토그램
x11()
hist(my_midwest$black_rt)
names(my_midwest)
my_midwest[c(2:4,5,8,13,31)]
View(my_midwest)

#Q-4)흑인인구 rt에 대한 평균, >>avg, <avg
names(my_midwest)
mean(my_midwest$black_rt)
my_midwest$black_vol <- ifelse(my_midwest$black_rt > mean(my_midwest$black_rt),
       ">>avg(2.68)","<avg(2.68)")
dim(my_midwest)
names(my_midwest)
my_midwest[c(2,5,8,32)] |> head(10)

#Q-5 ) 빈도표와 막대 그래프
table(my_midwest$black_vol)
x11()
ggplot2::qplot(my_midwest$black_vol)






