Частина 2. Для наступних питань використаємо дані перепису населення від
United States Census Bureau. Цей набір даних містить дані по населенню
для округів і штатів в США з 2010 по 2015 рокі. В цьому документі є опис
назв змінних. Завантажити файл можна за посиланням
<a href="https://www.dropbox.com/s/c1b2vqg8i3m1n93/census.csv?dl=0" class="uri">https://www.dropbox.com/s/c1b2vqg8i3m1n93/census.csv?dl=0</a>
Файл необхідно завантажити в змінну census\_df Зчитуємо файл

``` r
census_df <- read.csv("census.csv", stringsAsFactors = FALSE)
```

Питання 5 В якому штаті (state) більше всього округів (county)? Функція
повинна повернути одне текстове значення

``` r
library(plyr)
answer_five <- function(){
  r <- count(census_df$STNAME)
  f <- r$x[which.max(r$freq)]
  return(f)
}
answer_five()
```

    ## [1] "Texas"

Питання 6 Якщо розглядати три найбільш населених округа (county) з
кожного штату, які три найбільш населені штати (в порядку з більш до
менш населеного)? Використовуйте CENSUS2010POP. Функція повинна
повернути вектор з трьох текстових значень.

``` r
answer_six <- function(){
res =split(census_df$CENSUS2010POP,census_df$STNAME)
res = sapply(res, function (x) sort(x,decreasing = T))
res <- sapply(res,function (x) sum(x[2:4]))
res = sort(res, decreasing = TRUE)
return(names(res[1:3]))
}
answer_six()
```

    ## [1] "California" "Texas"      "Illinois"

Питання 7 Який округ (county) має найбільшу абсолютну зміну в населенні
протягом періоду 2010-2015? (Підказка: значення населення зберігається в
колонках з POPESTIMATE2010 до POPESTIMATE2015. Необхідно розглядати всі
шість колонок). Якщо населення округу за 5річний період 100, 120, 80,
105, 100, 130, то найбільша різниця за період буде \|130-80\|=50.
Функція повинна повернути одне текстове значення.

``` r
answer_seven <- function(){
p <-  census_df[,10:15]
p_max <- apply(p, 1, max)
p_min <- apply(p, 1, min)
diff=(p_max - p_min)
d <- data.frame(CTY = census_df$CTYNAME, diff)
d
r <- d[order(d["diff"], decreasing = TRUE),]
res <- r$CTY[which.max(r$diff)]
return(res)
}
answer_seven()
```

    ## [1] "Texas"

Питання 8 В census\_df США поділені на 4 регіони (колонка “REGION”).
Напишіть функцію, яка знаходить округи (county), що належать регіонам 1
або 2, назва яких починається з “Washington” та POPESTIMATE2015 більше
ніж POPESTIMATE2014. Функція повинна повернути 5х2 дата фрейм з
колонками “STNAME”, “CTYNAME”.

``` r
answer_eight <- function(){    
  res <- census_df[census_df["SUMLEV"]==50 & census_df["REGION"] <= 2 & c(sapply(census_df["CTYNAME"], function(x) 'Washington' == substr(x, 1, 10))) & census_df["POPESTIMATE2015"] > census_df["POPESTIMATE2014"],]
res[c("STNAME",  "CTYNAME")]
}
answer_eight()
```

    ##            STNAME           CTYNAME
    ## 897          Iowa Washington County
    ## 1420    Minnesota Washington County
    ## 2346 Pennsylvania Washington County
    ## 2356 Rhode Island Washington County
    ## 3164    Wisconsin Washington County
