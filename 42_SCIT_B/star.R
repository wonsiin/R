# sampleing

install.packages("rvest")
install.packages("dplyr")
library(rvest)
library(dplyr)
search()

url="https://search.naver.com/search.naver?where=news&sm=tab_jum&query=%EB%B6%81%ED%95%9C"
url
?text
text <- read_html(url, encoding = "UTF-8")
text
#xml형식으로 읽힌다.
class(text)

#list_news의 값을다 긁어온다----
text %>% 
  html_nodes(xpath='//*[@class="list_news"]')-> news_list
news_list

#list_news의 값을다 긁어온다----
url1="https://novelai.app"
url1

text <- read_html(url1, encoding = "UTF-8")
text
text %>% 
  html_nodes(xpath='//*[@class="mt-4 grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-4 pb-16"]')-> ai_list
ai_list %>% 
  html_children() %>% 
  html_nodes(xpath='//*[@class="news_tit"]') %>% 
  html_text() -> ai_title
ai_title

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

# 7-3) rank()
?rank()
rank(a)   # 작은 수치가 1위
rank(-a)  # 큰수치가 1위

# NA 표기
a
rank(a)
rank(a, na.last=T)
rank(a, na.last=F)
rank(a, na.last="keep") #NA순위를 없앤다다(na 제외 후 처리)
rank(a, na.last=NA) #NA를 제거

### 8) named vector ----
data(package = "datasets")
?islands

class(islands)
head(islands)
str(islands)

?hist()
hist(islands)

search()
?ggplot2::qplot() #특정 함수 패키지를 메모리에 안올리고 사용하겟다는 의미
ggplot2::qplot(islands)

#named vector -1
cc2<-c(a=1,b=1,b=1,a=2,c=2,a=3)
class(cc2)
cc2
hist(cc2)
ggplot2::qplot(cc2)
#named vector -2
xx <- c(20,50,80)
xx
class(xx)

names(xx)<- c("R","Python","Java")
xx
names(xx)

### 9) factor data ----
print("====data======")
aa <- c(1,1,1,2,2,2,3,3,4,5,5,6,7)
aa
class(aa)
typeof(aa) #mode(aa)

#levels(aa)
#nlevels(aa)
#is.factor(aa)

print("===== factor data ======")
f.aa <- as.factor(aa)
f.aa
class(f.aa)
levels(f.aa)
nlevels(f.aa)
is.factor(f.aa)


levels(f.aa)[3] #3번째 값을 가져오기기
ff <- levels(f.aa)
ff
ff[3] #== levels(f.aa)[3]

### 10) data type is.***, as.*** ----

# 문자변수 선언
yy<-c("김","정","수","김","수")
yy
class(yy)
is.factor(yy)#false

# factor 변환 및 확인 (몇가지 인가 확인할때 사용)
# char 로 되어있는것을 범주형으로 바꿔주면 숫자로 표시가 되어 ----
# 인공지능에 효율적이다. 무조건 이렇게 사용해야한다.
as.factor(yy)
mm <- as.factor(yy)
is.factor(as.factor(yy))
class(as.factor(yy))
typeof(as.factor(yy))
mode(as.factor(yy))
typeof(mm)
mm

### 11) Dts object Type ----

# 11-1) 명목형 & 순서형 factor

# 명목형 factor
f1 <- factor(c("a","a","a","b","b","c"))
f1

class(f1)
typeof(f1)
is.factor(f1)
is.ordered(f1)

#순서형 factor
f2 <- factor(c("a","a","a","b","b","c"))

class(f2)
typeof(f2)
is.factor(f2)
is.ordered(f2)

# 11-2) 행렬(matrix)
v1 <- c(1:20)
v1
class(v1)

m1 <- matrix(v1,4,5)
# 함수 : matrix(dts, 행, 열, byrow=F)----
m1

matrix(m1, nrow=4, ncol = 5) # == matrix(v1,4,5)
matrix(m1, nrow=4, ncol = 5,byrow=T) # 행 기준으로 진행된다.

matrix(m1,nrow=4,ncol = 10) #데이터를 다시 재정의 한다.
matrix(m1,nrow=4,ncol = 10,byrow=T)
matrix(m1,nrow=5,ncol = 10,byrow=T)
matrix(m1,nrow=3,ncol = 10,byrow=T)

# 11-3) 배열(array)

# 2차원

v2 <- rep(1:100, length.out=20)
v2
ar2 <- array(v2,dim=c(2,10))
class(ar2)
#array 와 matrix랑 같다 (2차원일 경우 유사하다)
typeof(ar2)

# 3차원
ar3 <- array(v2,dim=c(2,5,4))
ar3
class(ar3)
# 3차원인경우 array
dim(ar3)
# 행 , 열 , 그외          행과 열 = 2차원 , 행과열을 묶어놓은곳 = 3차원
#[행, 열, 3차원]
ar3
ar3[2, , ] #2행의 값을 다 가져온것이다.
ar3[2,2,] # 2행 2열의 값을 다 가져온다.
ar3[2,2,3]
ar3[2,5,3]

# 11-4) data.frame # == table

v2
class(v2)
dim(v2)
df.a <- data.frame(v2)

v2
df.a
dim(df.a)
typeof(df.a)
typeof(df.a$v2)

# 11-5) list ----
#list 는 놓치는게 없다.
test.a <- seq(10,100,by=5)
test.a
class(test.a)
typeof(test.a)

#list로 담기
list.a2 <- list(test.a,"김정수",df.a,ar2)
class(list.a2)
typeof(list.a2)
list.a2
#방에 무조건 값을 다 담는다.

#Q 퀴즈
length(list.a2)
list.a2
list.a2[2] #list형태로
list.a2[1]
# list는 백터다 매우 큰 백터 
# list 2번째 데이터를 가져오는데 그또한 list다. 값을 가져와도 list형태태
# 가로 2개는 list 내부의 값을 보여준다.
list.a2[[1]] #data 프레임 형태로
list.a2[[2]]

list.a2[1]
class(list.a2[1])
list.a2[[1]]
class(list.a2[[1]])

list.a2[2]
class(list.a2[2])
list.a2[[2]]
class(list.a2[[2]])

list.a2[3]
class(list.a2[3])
list.a2[[3]]
class(list.a2[[3]])

#Q

a1 <- c(1:3)
a2 <- c(10:15)
#a3 <- c(20:30)
a3 <- c(20:31)
a1
a2
a3
length(a3)
data.frame(a1)
data.frame(a1,a2)
data.frame(a1,a2,a3)
# err가 나는 이유는?  칸 수가 안맞아서



# 2. 함수(function) ----

### 0) 함수 샘플 ----
library()
Sys.Date()
Sys.time()

sum(10:20)
my_mpg <- ggplot2::mpg
class(my_mpg)
mean(my_mpg$cty)
max(my_mpg$cty)
min(my_mpg$cty)
hist(my_mpg$cty)
# SQL 활용 ----
install.packages("sqldf")
library(sqldf)
search()

names(my_mpg)
# SQL > select model, year from my_mpg ----
# 5줄만 읽는다. sql문 사용
sqldf("select model, year from my_mpg
      limit 5
      ")

# 1) print() & cat() ----
print("이태규")
#print("이태규","이시헌") 는 하나의 값만 출력 여러개는 불가능 err다
cat("이태규","이시헌")
cat("이태규","\n","이시헌","김혁")
cat("이태규","\n","이시헌","\n","김혁")

#fill 을 사용하면 앞에 띄어지는 부분이있는경우 사용용
cat("이태규","이시헌","김혁",fill=1)
print(1);print(2) # print는 나열해서 사용해야한다
cat(1);cat(2) #cat은 2개로 만들면 문자열 합치기가 된다.

# 2) 문자처리함수(paste()) ----
h1 <- "aaa";h1;length(h1)
h2 <- "Hello R programming~";h2;length(h2)
h3 <- c("Hello","R","programming~");h3;length(h3)
h3
#error ----
h1+h2
h1+3

#
paste(h3)
paste(h3,collapse = " + ")
paste(h3,collapse = " ^^; ")
paste(h3,collapse = " ")
length(paste(h3,collapse = " "))

#error ok ----
h1+h2
paste(h1,h2)
h1+3
paste(h1,3)

### 3) 내장함수 ----
ls()
rm(list=ls())

#dts 로딩딩
getwd()
my_ex <- read.csv("dts/ss_exam.csv")
class(my_ex)
names(my_ex)
dim(my_ex)
head(my_ex)

# [행,열], [index] 행과 열이 없으면 컨샙이다
# + dts[] dataset
# + function(){ 함수 구현 내용 }
my_ex
my_ex[2,] #2행 전체
my_ex[,3] #3열 전체-v 백터
my_ex[3] #3열 전체 -df 데이터프라임
my_ex[c(3,5)] #3,5열 전체 -df 데이터프라임
my_ex[c("database","japan")] #3,5열 전체 -df 데이터프라임

my_ex[2,3]

View(my_ex)
                                             
# Q. 2열 6열 1열
my_ex[c(2,6,1)] |> head(2) #2줄만 읽도록하기
# Q. id가 3인 java와 eng 출력
my_ex [my_ex$id==3,c("java","eng")] #my_ex$ <- 지정해주는 방법 (id가 3인값 출력)
#select java , eng from my_ex where id=3
my_ex [3,c("java","eng")] #행이 3번째 값을 가져오는것
#id update : 3 -> 123
my_ex[my_ex$id ==3,"id"] <- 123 #update 방법법
my_ex
my_ex[my_ex$id ==7,"id"] <- 3 #update 방법법
my_ex

View(my_ex)

#Q. 일본어 점수 >= 90
# sql > select * from my_ex where japan >= 90
my_ex[my_ex$japan >= 90,]|> head(2)
# 일본어 점수가 >= 90 이고 영어 < 70
my_ex[my_ex$japan>=90 & my_ex$eng>=70,]
# 영어가 >= 60이상 id의 database와 japan
my_ex[my_ex$eng >=60,c("database","japan","eng")]

### 4) 패키지 내 함수 ----
# 시각화, plot
# + base::plot()      기본 plot()
# + ggplot2::qplot()  분석 및 개발시 유용
# + ggplot2::ggplot() 확정 보고서용

search()
my_mpg <- ggplot2::mpg
# + SQL> create table ... as select ...;
my_mpg

#base::plot()
?base::plot()
my_base1 <- plot(x=my_mpg$cty) #도심연비
my_base1 <- plot(x=my_mpg$cty, type="o")
my_base2 <- plot(x=my_mpg$hwy) #고속도로연비
my_base3 <- plot(x=my_mpg$cty, y=my_mpg$hwy) #cty - hwy

# ggplot2::qplot()
search()
my_mpg1 <- ggplot2::qplot(data = my_mpg, x = cty)
my_mpg1 <- ggplot2::qplot(data = my_mpg, x = cty,y=hwy)
my_mpg1

# 변수: drv, hwy
names(my_mpg)
unique(my_mpg$drv)
my_mpg1 <- ggplot2::qplot(data = my_mpg, x = drv,y=hwy)
my_mpg1 <- ggplot2::qplot(data = my_mpg, x = drv,y=hwy, geom="boxplot",col=drv)
my_mpg1

#사운드 패키지 ----
install.packages("beepr")
library(beepr)
search()
??beepr
beep(2);beep(6);beep(1);beep(9);beep(8)
### 5) 사용자 정의 함수 ----
# 사용자정의함수명 <- function(x1,x2,...){
#   ...
#   함수구현
#   ...
#   return(결과값)
# }
# Q. 합계와 평균함수 ----
my_fn <- function(a,b,c,d){
  sum1 <- sum(a,b,c,d)
  avg1 <- sum1/4
  
  cat(paste("sum : ", sum1),
      paste("avg : ", avg1),fill=1)
  
  return(list(sum1, avg1)) #**중요하다다
}
#전체를 드래그 해주고 실행해줘야한다.
bae_ch <- my_fn(10,12,45,60);bae_ch
bae_ch$sum
bae_ch$avg
# Q. 구구단
#조건 : 문자X , 음수 X , 10이상 X
#반복문 : 1~9단

# in 연산자 사용한 구구단 ----
fc <- function(x){
  if(is.numeric(x)){
    if(x < 10 & x %in% c(1:9)){
 #   if(x < 10 & x > 0){ 이 방법도 가능
      for(i in 1:9){
        y = x * i
        cat(paste(x,"*",i,"=",y),fill=1)
      } #for문 close
    }else{
      cat("1~9까지 입력하세요요.",fill=1)
    }
  }else{
    cat("조건에 부합하지 않습니다.","메롱!",fill=1)
  }
} #function close

#paste 로 묶어준다다
for(i in 1:9){
  cat(paste(i,"단"),fill=1)
  for(j in 1:9){
    y = i * j
    cat(paste(i,"*",j,"=",y),fill=1)
  } #for문 close
} #function close
fc(9)
10 %in% c(1:9)
fc("aa")
is.numeric("a")

### 6) 빈도함수 (table(), hist(), qplot()) ----
# 6-1) number data
b_num <- c(1,1,1,1,3,3,3,2,2,2,4,5,5,2,4,5)
b_num
class(b_num)
typeof(b_num)

# 뭐가 몇개인지 나온다. 
table(b_num)       #빈도수            ** 주로사용
prop.table(b_num)  # 각 데이터 빈도비율
prop.table(table(b_num))*100  # 카테고리(범주)별 빈도비율 ** 주로사용

hist(b_num)
hist(table(b_num))
ggplot2::qplot(b_num)    #****

# 6-2) character data
b_char <- c("a","a","a","b","b","c","a")
b_char
class(b_char)
typeof(b_char)

#
table(b_char)
prop.table(b_char) #err,data type 문제
prop.table(table(b_char))*100

#
hist(b_char) #hist(x)에 x가 있으면 x는 숫자여야한다
hist(table(b_char))
ggplot2::qplot(b_char) #보기편하게 사용하기 좋음  *****
#테이블 사용 ----


### 7) table() 옵션 ----

t1 <- c(NULL, "a","a",NULL,"b","c")
t1
table(t1)
table(t1,useNA = 'no')    # NA를 표시금지 ( DEFAULT )
table(t1,useNA = 'ifany') # NA가 있으면 표시
table(t1,useNA = 'always') # NA가 있거나 없거나 항상 표시

t2 <- c(NULL, "a","a",NULL,"b","c",NA,NA) #봣는데 모를경우 NA 라고 한다 (결측치)
t2

table(t2)
table(t2,useNA = 'no')    # NA를 표시금지 (default)
table(t2,useNA = 'ifany') # NA가 있으면 표시
table(t2,useNA = 'always') # NA가 있거나 없거나 항상 표시

### 8) NULL/NA/NaN/Inf

# 8-1) NaN / Inf (Infinite)

log(100)
log(-100) #err

#감당이 가능한 범위는 [계산가능범위] (-10^308 ~ 10^309 까지다)
# 1e+05 / 1 * 10^5  의미
10^5
# 1e+100 / 1 * 10^100  의미
10^100
10^200
10^300
10^309 # Inf 감당하기 어렵다는 의미
-10^309 # -Inf 감당하기 어렵다는 의미다. 

# 8-2 ) NULL / NA








