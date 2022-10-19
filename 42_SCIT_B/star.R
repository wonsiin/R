# sampleing

install.packages("rvest")
install.packages("dplyr")
library(rvest)
library(dplyr)
search()

url="https://search.naver.com/search.naver?where=news&sm=tab_jum&query=%EB%B6%81%ED%95%9C"
url

text <- read_html(url, encoding = "UTF-8")
text
#xml형식으로 읽힌다.
class(text)

#list_news의 값을다 긁어온다----
text %>% 
  html_nodes(xpath='//*[@class="list_news"]')-> news_list
news_list

#데이터를 긁어와서 볼수있다.----
news_list %>% 
  html_children() %>% 
  html_nodes(xpath='//*[@class="news_tit"]') %>% 
  html_text() -> news_title

news_title

#복 소수(실수 + 허수)
1
2i
aa<-1+2i
aa
class(aa)

#Work Directory

#0. work directory ----
# . :  current wd  (커런트 워트디렉토리)
# .. : parents wd (페어런트 워크디렉토리) 
### 1) 현재 work directory에서 
#워크디렉토리 확인
getwd()
#메인 작업폴더에 있는csv찾는법
read.csv("강흥석.csv")
#폴더 내부에 있는경우 csv파일 읽는법
read.csv("dts/이승범.csv")
read.csv("./dts/이승범.csv")

# 2) wd changed
setwd("E:/PR/R_Works/42_SCIT_B/dts")
getwd()
#메인 작업폴더에 있는csv찾는법
read.csv("../강흥석.csv")
#폴더 내부에 있는경우 csv파일 읽는법
read.csv("이승범.csv")

setwd("E:/PR/R_Works/42_SCIT_B")
getwd()

#ctrl + shift + c : 전체묶음 ----

#R의 속성
#can be nested!! 중첩을 의미
#데이터 베이스 에서 함수(싱글 펑션 , 그룹 펑션) 의 구분 함수
# 중첩이 가능하냐? 가능하지 않느냐?
# 싱글 펑션은 err가 전혀 없다.
# 그룹펑션은 err가 발생
#f3(f2(f1(x))) : 중첩활용 (빠르고 간결하다, 가속성은 떨어짐)

#0. 데이터 분석도구
#<구글링 cheat sheet>
#"패키지 이름 cheat sheet"
#"dplyr cheat sheet" 
#1.변수
# 변수 선언 방식(Naming Convention)
#camelCase 소문자로 시작하다가 중간 단어의 첫 문자는 대문자로 표기
# snake_case 각 단어를  언더바(_)로 연결
#PascalCase 복합단어를 구성할때 , 단어의 첫 문자를 대문자로 표기

#변수 선언 불가능 Case
#10a <-10       특수기호<- 10
#a-b <- 10       .13 <- 10
#변수선언
#.a <- 10 a_a <- 10
# 변수사용은 가급적 소문자 권장
#alt + l 하면 접어진다

#1. 변수(variables) ----

### 1) 변수 만들기 ( <- ) ----
#1줄로 실행시 이렇게
a <- 2;a
aa <- 5^20;aa
AA <- 10;AA
class(a)
class(aa)
class(AA)
a+aa
a*aa
### 2) 여러 개의 변수값 할당 (c(), seq()) ----
# c() = 여러개의 변수를 묶어주는 역활
?c()
bbb <- c(10,20,30,40,50);length(bbb);bbb
ccc <-c(100:120);ccc

?seq()
# seq(from, to, by=+-num, length.out) 파라미터가 존재
# 100~ 150까지 5씩 증가시켜라
ccc2 <- seq(100, 150, by=5);ccc2
# 하나의 값을 여러 변수에 할당
aa <- bb <- cc <- dd <- 100
aa;bb;cc;dd;
### 3) 연속값 계산하기 ----
dd <- seq(10,100, by=10);dd;length(dd)
ee <- seq(100, by=-5);ee;length(ee)
#콘솔 값 지우기 ctrl + l 누르면 된다.
dd+ee

# Q 
d1 <- c(1:10);d1;length(d1)
d2 <- c(1:3);d2;length(d2)
#길이가 너무 맞지 않아서 더할수가 없다.
d1+d2
### 4) 문자 변수 할당 ----
#문자열의 길이가 길어도 한 묶음으로 본다
h1 <- "aaa";h1;length(h1)
h2 <- "Hello R Programming~";h2;length(h2)
h3 <- c("Hello","R", "Programming~");h3;length(h3)
#err ----
h1 + h2
h1+3
### 5) 반복문자 변수 생성 (rep()) ----
# rep(dts,each,times,length.out)
# dts = data
# each = 데이터 하나하나의 반복 횟수
# times = 전체 데이터 반복 횟수
# length.out = 표현될수 있는 데이터 전체 사이즈를 강제로 조절
?rep()
# 반복문이다. for문이랑 비슷----
r1 <- rep(1,5);r1
r2 <- rep(1:5,3);r2
rep(1:5, each=3)
length(rep(1:5, each=3))
#자리수를 억지로 100자리까지 늘리는것이다.----
rep(1:5, each=3,length.out=100)

rep(1:5)
rep(1:5,each=2)
# each 는 몇번 반복할것인가? ----
# times 는 전체 데이터를 몇번 반복할것인가----
rep(1:5,each=2,times=3)
rep(1:5,each=2,times=3,length.out=100)

#중복된 데이터를 제외하고 읽는법
#합집합 교집합 차집합을 의미한다.
#합집합 a 와 b 를 합친 전부
#교집합 a 와 b 의 중복된값만
#차집합 a - b
### 6) 집합(set,중복된 데이터는 제외)----
set1 <- seq(10,100,by=2);set1
set2 <- seq(30,150,by=4);set2
length(set1)
length(set2)
#합집합
u_set <- union(set1, set2);u_set
length(u_set)
#교집합
i_set <- intersect(set1, set2);i_set
length(i_set)
#차집합
setdiff(set1,set2)-> sd1;sd1
setdiff(set2,set1)-> sd2;sd2
length(sd1)
length(sd2)

#set
setequal(set1, set2)
#비교 중복 데이터는 제외하므로 true가 나온다
setequal(c(1,3,5), c(1,1,1,5,5,3,3,3,3,1,5))
#is.element()  %in%, in   in연산자
is.element(9,set1)
is.element(10,set1)
is.element(1,c(1,2,3))
is.element(5,c(1,2,3))
### 7) 정렬 ----
# sort(),order(), rank()

#dts 준비 랜덤값 호출
?sample()
a <-sample(1:100, 10)

#NA (결측치)
a
# () 함수 [] 데이터셋
# 0 부터 시작이 아닌 1부터 시작
a[7]
a[c(4,7,10)]
#순서에 데이터를 업데이트 하고싶은경우
a[c(4,7,10)] <- NA
a
### 7-1) sort() 오름차순(낮은값부터 큰숫자로) NA는 무시한다. ----
a;length(a)
sort(a)
length(sort(a))
#decreasing = 내림차순(높은값부터 낮은숫자로) NA는 무시한다.
sort(a, decreasing = T)
#NA표기 ( NA를 뒷쪽으로 둬라 라는 뜻 )
sort(a,na.last = T) #NA 뒷쪽으로
sort(a,na.last = F) #NA 앞쪽으로

# 7-2) order() ----
#정렬된 데이터를 기준으로 원자료의 index (위치값)를 리턴
a
sort(a)
#order는 NA를 무시하진 않지만 뒤로 뺀다
order(a)
?order()
# 역정렬
a
sort(a, decreasing = T)
order(-a)
sort(a, decreasing = F)

#NA
a
order(a, na.last = T)
order(a, na.last = F)
order(a, na.last = NA) #NA제거거

# Q
r1 <- c(1,5);r1
r2 <- rep(1:5,3);r2
sort(r1)
sort(r2)

r2[order(r2)] # == sort(r2) 랑 같다
r2
sort(r2)
order(r2)
# , 적용시킬때 사용 ----
paste(order(r2),collapse = ",")
c(1,6,11,2,7,12,3,8,13,4,9,14,5,10,15)
r2[c(1,6,11,2,7,12,3,8,13,4,9,14,5,10,15)]
r2[order(r2)]
sort(r2)









