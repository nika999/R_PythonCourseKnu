### Виконала: *Бокань Вероніка*

### В лабораторній роботі необхідно виконати наступні дії:

### В лабораторній роботі необхідно написати наступні функції на мові R та вивести результат роботи цих функцій на довільних даних:

### 1. Функція add2(x, y), яка повертає суму двох чисел.

``` r
add2 <- function(x,y){x+y}
add2(2,1)
```

    ## [1] 3

### 2. Функція above(x, n), яка приймає вектор та число n, та повертає всі елементі вектору, які більше n. По замовчуванню n = 10.

``` r
above <-function(x,n){
  r <- x[x>n]
  r
}
above(8:12,10)
```

    ## [1] 11 12

### 3. Функція my\_ifelse(x, exp, n), яка приймає вектор x, порівнює всі його елементи за допомогою exp з n, та повертає елементи вектору, які відповідають умові expression. Наприклад, my\_ifelse(x, “\>”, 0) повертає всі елементи x, які більші 0. Exp може дорівнювати “\<”, “\>”, “\<=”, “\>=”, “==”. Якщо exp не співпадає ні з одним з цих виразів, повертається вектор x.

``` r
my_ifelse <- function(x, exp, n){
  if (exp=="<"){ 
    r <- x[x<n] 
    r }
  else if(exp=="<="){ r <- x[x<=n]
 r}
  else if(exp==">="){ r <- x[x>=n]
  r}
  else if(exp==">"){ r <- x[x>n]
  r}
  
  else x
}
my_ifelse(8:12,"<",10)
```

    ## [1] 8 9

``` r
my_ifelse(8:12,"<=",10)
```

    ## [1]  8  9 10

``` r
my_ifelse(8:12,">",10)
```

    ## [1] 11 12

``` r
my_ifelse(8:12,">=",10)
```

    ## [1] 10 11 12

``` r
my_ifelse(8:12,"ttt",10)
```

    ## [1]  8  9 10 11 12

### 4. Функція columnmean(x, removeNA), яка розраховує середнє значення (mean) по кожному стовпцю матриці, або data frame. Логічний параметр removeNA вказує, чи видаляти NA значення. По замовчуванню він дорівнює TRUE.

``` r
x <- data.frame(a = 1:4, b = 1,NA,2,NA) 
columnmean <- function(x, removeNA = TRUE){
if (removeNA == FALSE){ na.rm = FALSE
  mean(x)}
  else mean(x[!(is.na(x))])
}
columnmean(x, TRUE)
```

    ## [1] 1.833333

``` r
columnmean(x)
```

    ## [1] 1.833333

``` r
columnmean(x, FALSE)
```

    ## Warning in mean.default(x): argument is not numeric or logical: returning NA

    ## [1] NA
