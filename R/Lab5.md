##### Для лабораторної роботи необхідно завантажити zip файл з даними за посиланням:«<a href="https://www.dropbox.com/s/i9wi47oyhfb7qlh/rprog_data_specdata.zip?dl=0" class="uri">https://www.dropbox.com/s/i9wi47oyhfb7qlh/rprog_data_specdata.zip?dl=0</a>». Це файл містить 332 csv файлів, що містять у собі результати спостережень за забрудненням повітря дрібнодисперсними частками (fine particular matter air pollution) у 332 локаціях у США. Кожен файл містить дані з одного монітору. ID номер кожного монітору міститься у назві файлу. Наприклад, дані з монітору під номером 200 містяться у файлі «200.csv». Кожен файл містить три змінні: Data: дата спостереження в форматі (рік-місяць-день), sulfate: рівень сульфатних часток в повітрі на дату (мікрограми на кубічний метр) та nitrate: рівень нітратних часток в повітрі на дату (мікрограми на кубічний метр). Для цій роботи необхідно додати на Github файл pmean.R, який містить усі функції. В файлі md необхідно указати виклик функції з аргументами та вивід у консоль результатів роботи функцій.

#### 1. Написати функцію pmean, яка обчислює середнє значення (mean) забруднення сульфатами або нітратами серед заданого переліка моніторів.

#### Ця функція приймає три аргументи: «directory», «pollutant», «id». Directory – папка, в якій розміщені дані, pollutant – вид забруднення, id – перелік моніторів. Аргумент id має значення за замовчуванням 1:332.

#### Функція повинна ігнорувати NA значення. Приклад роботи функції:

pmean(“specdata”, “sulfate”, 1:10)

``` r
pmean <- function( pollutant, ID = 1:332){
  csvFile <- unzip("rprog_data_specdata.zip")
  
  means <- c()
  for(i in ID) {
    means <- rbind(means, mean(read.csv(csvFile[i])[[pollutant]],na.rm = TRUE))
    
  }
  result <- mean(means,na.rm = TRUE)
  return(result)
}

pmean( "sulfate", 1:10)
```

    ## [1] 3.806771

``` r
pmean( "sulfate", 55)
```

    ## [1] 3.587319

``` r
pmean( "nitrate")
```

    ## [1] 1.584008

#### 2. Написати функцію complete, яка виводить кількість повних спостережень (the number of completely observed cases) для кожного файлу. Функція приймає два аргументи: «Directory» та «id» та повертає data frame, в якому перший стовпчик – ім’я файлу, а другий – кількість повних спостережень.

``` r
complete <- function(directory, ID = 1:332){
    csvFile <- unzip("rprog_data_specdata.zip")
    
   data <- data.frame()
    for(i in ID) {
      s <- read.csv(csvFile[i][])
      nobs <- sum(complete.cases(s))
      data <- rbind(data, data.frame(i, nobs))
    }
    
    return(data)
  }

complete("specdata", 1)
```

    ##   i nobs
    ## 1 1  117

``` r
complete("specdata", c(2, 4, 8, 10, 12))
```

    ##    i nobs
    ## 1  2 1041
    ## 2  4  474
    ## 3  8  192
    ## 4 10  148
    ## 5 12   96

``` r
complete("specdata", 50:60)
```

    ##     i nobs
    ## 1  50  459
    ## 2  51  193
    ## 3  52  812
    ## 4  53  342
    ## 5  54  219
    ## 6  55  372
    ## 7  56  642
    ## 8  57  452
    ## 9  58  391
    ## 10 59  445
    ## 11 60  448

#### Написати функцію corr, яка приймає два аргументи: directory (папка, де знаходяться файли спостережень) та threshold (порогове значення, за замовчуванням дорівнює 0) та обчислює кореляцію між сульфатами та нітратами для моніторів, кількість повних спостережень для яких більшепорогового значення. Функція повинна повернути вектор значень кореляцій. Якщо ні один монітор не перевищує порогового значення, функція повинна повернути numeric вектор довжиною 0. Для обчислення кореляції між сульфатами та нітратами використовуйте вбудовану функцію «cor» з параметрами за замовчуванням.

``` r
corr <- function(directory, threshold =0){
    csvFile <- unzip("rprog_data_specdata.zip")
    v <- numeric()
    
  
    for(i in 1:332) {
      s <- read.csv(csvFile[ i])
      
      data <- s[complete.cases(s),]
      
     if(nrow(data) > threshold ){
        v <- c(v, cor(data[,"sulfate"], data[, "nitrate"], use="na.or.complete"))
      }
    
    }
    if(length(v) > 0) return (v)
    return (c())
}

cr <- corr("specdata", 150)
head(cr); summary(cr)
```

    ## [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ## -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313

``` r
cr <- corr("specdata", 400)
head(cr); summary(cr)
```

    ## [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ## -0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313

``` r
cr <- corr("specdata", 5000)
head(cr); summary(cr) ; length(cr)
```

    ## NULL

    ## Length  Class   Mode 
    ##      0   NULL   NULL

    ## [1] 0
