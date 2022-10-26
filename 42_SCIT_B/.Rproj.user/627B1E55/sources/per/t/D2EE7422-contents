# test2.R

# 책갈피 ----
# 4개를 넣으면 책갈피 기능이있다.
# 0. shortcut(단축키)   ----
# 실행 : ctal + enter
# 복사 : shift + alt + 방향키
# 복사내용이동 : 복사내용 잡고 + alt + 방향키
# 자주사용 단축키
# %>%(pipe) = ctrl + shift + m
# 글자 크기 조절 ctrl + -     키우기 shift + ctrl + +
# 블록 주석 :
# <- :  alt + - , = 랑 같은 의미다.  ( a = 10, a <- 10 같다, 10 -> a )


10 + 10

# 1. 도움말 ----
# 설치가 된건 ?names
# 설치가 안된건 ??names 로 찾는다.
help(base)
?names()

# 2. 내장함수 ----
# income <- read.csv("dts/소득.csv")
# write.csv(income,file = " dts/income.csv")

# 데이터 객체 의 2번째 행에서 2개으 컬럼조회
# income[2,c("도단위","지역구")]  *sql과 비슷하게 사용된다.
search()
read.csv("aaa.csv")

# 3. 외장 기능 (패키지, 함수) ----
# 외장 함수란 외부에서 패키지를 다운로드하여 사용하는 함수
# install.packages("패키지명")  패키지설치
# libraty(패키지명)            메모리등록
# search()                   현 메모리에 로딩되어 있는 패키지 리스트
install.packages("ggplot2")
search()
# 이부분이 inport다 ----
# 모든 내용은 변수에 담자 (ls(), ls(x), ls.str(x))로 확인

library(ggplot2)
search()
# 4. 모든 내용은 변수로 처리 ----
aa <- read.csv("aaa.csv")
aa

# 5. 패키지 설치 및 확인 ----
install.packages("ggplot2")
install.packages("dplyr")
library(dplyr)
search()

# 패키지 내리는 법법----
detach("package:ggplot2")

# 6. 특정 pkgs 의 dts 확인----
data(package = "ggplot2")
mpg
?mpg

# 7 . 워크 디렉토리 wd 확인----
getwd()
# setwd("주소") 로 주소를 바꿀수 있다. ----

# 8 . 버전 확인 ----
R.version
RStudio.Version()

# 9. 현재 메모리 내 변수 확인 ----
a <- "남정욱"
b <- "문주현"
c <- "이승범"
d <- "이민국"
e <- "배창현"

a
b
c
d
e
# 백터로 데이터를 담는것이다.
class(a)
# 메모리에 변수가 몇개인지 확인 ----
ls()
# 10. 변수 삭제 ----
rm(a)
ls()
# 변수 전체 삭제 공식 ----
rm(list = ls())
ls()

# 11.dts 속성확인  (데이터셋 (데이터 프레임으로 이해해라)) ----
# cdhlmnstrV

search()
mpg

# 클레스별 함수다
class(mpg)
# 234행 11개의 열이 있다라는것을 알려줌.
dim(mpg)

# 앞에서 6행(줄)을 읽어보는것이다.
head(mpg)
# 열의 개수를 리턴해준다.
# . 이 아닌 $를 사용하여 가져온다
length(mpg)
# cty란 컬럼의 데이터값을 가져와서 개수를 센다.
length(mpg$cty)
# mode(mpg) 모드 보다는 typeof(mpg) 가 좋다.
# 범주형 data type 에는 levels(mpg) 를 사용한다 ----
names(mpg) # 컬럼명 return
# colnames(mpg) == names 랑 같다
typeof(mpg)

# str(mpg)  == names(mpg) + class(mpg)/typeof(mpg) + head() 랑 같다. 매우 중요 ----
str(mpg)
# 1분위값 3분위값 작은값 큰값 등 숫적으로 값을 보여준다.
summary(mpg)

# 뒤에서 6행(줄)을 읽어보는것이다.
tail(mpg)
# 레코드의 index값들이 나온다.실제 데이터의 전처리할때 많이 사용.
rownames(mpg)

View(mpg) # 표로 자료의 데이터를 볼수있다. ----
# in연산자 참 거짓으로 보여줌
2008 %in% mpg$year

# 12. 맛보기 ----

# 12-1 . pkg 설치 및 확인
install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
library(dplyr)
search()

# 12-2. 메모리에서 pkg 내리기
detach("package:ggplot2")
search()

# 12-3. 특정 pkg(패키지) 내의 dts 확인
data(package = "ggplot2")
data(package = "dplyr")

# 12-4. 도움말
help(mpg)
?mpg
??mpg

# 12-5. dts 속성조회
search()
?economics

economics
# cdhlmnstrV
class(economics)
str(economics)
View(economics)
dim(economics)
head(economics)
tail(economics)
length(economics)

# 6. ggplot2::mpg 에서 제조사별 평균-고속도로 연비(내림정렬)
# 7.ford사에 model별 평균 - 고속도로 연비(내림정렬)
# 8. 도심연비(cty)와 배기량(displ)의 상관관계(qplot활용)

# 12-6. 제조사별 평균-hwy(연비)
?mpg
View(mpg)

# 중복 데이터 빼고 보는방법
unique(mpg$manufacturer)

# sql 함수에 대해서
# 단일행 : 넣은 만큼 나오는게 단일행이다.
# 단일행 : 문자함수 , 숫자함수, 날짜함수, 변환함수, 일반함수(제너럴펑션){ 일반 함수가 조그만 제어문 같은것이다}
# 일반함수중 업계를 강타한 함수 : DECODE 중요하다  -> Case() 는 모든곳에서 사용가능하다. ----
# 다행함수(그룹함수) : 많이 집어넣어도 1개로 출력한다.(평균값 구하기)
# 그룹함수 + 그룹바이 사용해야한다.
# 1. 원칙그룹함수와 그룹바이가같이 들어오는 경우는 select list 절에서 그룹함수를 제외하고
# 나머지 모든 컬럼은 반드시  그룹바이절에 나와줘야 에러가 안난다.
# 2. 그룹by 에 있다고 해서 반드시 select 에 적을 필요는 없다.
# 그룹바이 사용방법 ----
# SQL : select .. gf(그룹함수) from ... group by ..
mpg %>%
  group_by(manufacturer) %>%
  summarise(a = mean(hwy)) %>%
  arrange(-a) %>%
  head(2)

# 12-7. ford 사의 모델별 평균 -hwy
# SQL> select .. gt() from .. where .. group by
names(mpg)
mpg %>%
  filter(manufacturer == "ford") %>%
  group_by(manufacturer, model) %>%
  summarise(a = mean(hwy)) %>%
  arrange(-a)

# 12-8. ctu(도심연비) - displ(배기량)
library(ggplot2)
search()
# 모형 개발시 빨리 확인할때 사용 ----
?qplot()
names(mpg)
# x 축과 y축을 표시해준다. x축과  y축은 있는 name을 사용해라.
qplot(data = mpg, x = displ, y = cty)
# col = 색상으로 비교
qplot(data = mpg, x = displ, y = cty, col = displ)

# 12-9. USA economics
data(package = "ggplot2")
names(economics)
?economics

# 월별 개인 소비 동향
# geom_line 선으로 통계를 찾는방법법 ----
?ggplot()
ggplot(
  data = economics,
  aes(x = date, y = pce)
) +
  geom_line()

# 월별 개인 저축 동향
ggplot(
  data = economics,
  aes(x = date, y = psavert)
) +
  geom_line()

# 12-10. 회귀분석 ----
# 데이터  = 정보있는데이터    (표현을 하면 y=x , hwy=displ 없는 방식인데 보여주기용)
# lm(data = mpg, hwy~displ)
# R-squared:  0.5868,	Adjusted R-squared:  0.585
# 수치가 0.6~ 0.7이 넘어가야 고객의 불만을 덜 받는다.
# 1에 가깝게 될수록 상품가치가 올라간다.
# 인공지능 통계 사용 ----
?lm()
names(mpg)
lm(data = mpg, hwy ~ displ)
lm.mpg <- lm(data = mpg, hwy ~ displ) # y= x1+ x2 라는 의미다.
summary(lm.mpg)

names(mpg)
lm(data = mpg, hwy ~ displ + drv)
lm.mpg2 <- lm(data = mpg, hwy ~ displ + drv) # y= x1+ x2 라는 의미다.
summary(lm.mpg2)

names(mpg)
lm(data = mpg, hwy ~ displ + drv + year + cyl + fl + class)
lm.mpg3 <- lm(data = mpg, hwy ~ displ + drv + year + cyl + fl + class) # y= x1+ x2 + x3 + x4 + x5 + x6 라는 의미다.
summary(lm.mpg3)

# 데이터리터러시(R)
# R Fundamentals
# 데이터 분석도구 
#1. 변수 2. 함수 3. 리스트 
#4. 데이터프레임 5. 패키지 6. 데이터 분석 & 가공
#0. 데이터 분석도구 ----
# 데이터 형태에 따라 담는 그릇도 달리하는 것이...
#Data Object Type <- 데이터 처리 -> 변수 함수 패키지
# 1. Vector 2. Matrix 3. data.frame 4.Array 5. List
#Data Object Type-1        0)스칼라(Scalar):하나의 데이터 값
#1) 백터 (Vector) : 1차원 배열개념
# -단일형 데이터(문자 or 숫자 or 논리)
#장점 : 심플 빠름 , 단점 : 문자 숫자 논리중 하나만 들어가야함
#2) 행렬 (Matrix,매트릭스):2차원
# - 단일형 데이터(문자 or 숫자 or 논리)
# - 행렬 간의 사칙연산 등의 목적으로 사용
#3) 데이터프레임(data.frame):2차원

#4)배열(Array,어레이):다차원(2차원 이상) 이게 있어서 영상이 처리가됨 
#- 단일형 데이터(문자 or 숫자 or 논리)
#5)리스트(list): 1차원 응용(복잡한 데이터 유형 처리)
# -다중형데이터
# -여러 객체들의모음 (object's collection)
# (백터,행렬, 배열, 데이터프레임, 리스트 등)
# -key와 value로 구성된 해시맵(hashmap)
#Data Type (Data Object에 들어가는 값)
# 숫자 : numeric, double(실수),integer(정수),complex(복소수)
# 문자 : character
# 논리 : logical
# 그외 : null/na/NaN/Inf
#숫자분류 :
# 실수 (Real numbers) : 실수:a(double) 
#         무리수 : 숫자가 안끊킴  유리수 : 끝이있음
#                           정수: 소수점 이하          분수,소수
#                     양수(자연수) 0(ZERO) 음수:-X
#허수(i)
#Imaginary numbers
#<가우스>Lateral Number 
#x+y = 10, xy = 40
#우주과학, 양자역학등
# 복소수
#COMPLEX NUMBERS
#a+bi
#실수a,b 허수i
#전자 제어 컴퓨터 등


























