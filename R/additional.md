Частина 1. Завантажте файл “olympics.csv” за посиланням
<a href="https://www.dropbox.com/s/9oayr45v7nj30nv/olympics.csv?dl=0" class="uri">https://www.dropbox.com/s/9oayr45v7nj30nv/olympics.csv?dl=0</a>
Цей файл базується на статті в Wikipedia All Time Olympic Games Medals
Спочатку необхідно провести базову обробку файлу. Напишіть функцію
prepare\_set \<- function(file\_name) {} яка в якості аргументу приймає
ім’я файлу і повертає дата фрейм. Збережіть цей дата фрейм в змінну
olympics olympics \<- prepare\_set(“olympics.csv”) Функція prepare\_set
повинна виконувати наступні дії: 1. Зчитати файл
read.csv(“olympics.csv”, skip = 1, header = TRUE, encoding=“UTF-8”,
stringsAsFactors = FALSE)

``` r
library(readr)
library(stringr)
d <- read.csv("olympics.csv", skip = 1, header = TRUE, encoding="UTF-8",
stringsAsFactors = FALSE)
```

1.  Першому стовпцю дати назву “Country”

``` r
colnames(d)[1] <- "Country"
```

1.  Автоматично в циклі згенерувати назви останніх стовпців за
    наступними правилами: 3.1. Видалити з назви “X.U.2116..”, тобто
    “X.U.2116..Summer” буде “Summer”

``` r
for(i in colnames(d)) {
    new_name <- str_replace_all(i, "X.U.2116..", "")
    names(d)[names(d) == i] <- new_name
    }
```

3.2. “X01..” замінити на “Gold”, тобто “ X01…1” буде “Gold.1” 3.3.
“X02..” та “X03..” замінити на “Silver” та “Bronze” відповідно В
результаті повинні бути наступні назви стовпців: “Country”, “Summer”,
“Gold”, “Silver”, “Bronze”, “Total”, “Winter”, “Gold.1”, “Silver.1”,
“Bronze.1”, “Total.1”, “Games”, “Gold.2”, “Silver.2”, “Bronze.2”,
“Combined.total”

``` r
for(i in colnames(d)) {
  new_name <- str_replace_all(i, "X.U.2116..", "")  
  new_name <- str_replace_all( new_name, "X01..", "Gold")
  new_name <- str_replace_all( new_name, "X02..", "Silver")
  new_name <- str_replace_all( new_name, "X03..", "Bronze")
    
    names(d)[names(d) == i] <- new_name
    }
```

1.  Необхідно привести назви країн до виду “Afghanistan”, “Algeria” і
    т.п. Для цього можна використати функцію str\_split бібліотеки
    stringr. В назві країн не повинно бути пробілів на початку та в
    кінці.

``` r
# str_split щоб повернути список підрядків
#"\\(" - before "("
ed_cy <- str_split(d$Country, "[:space:]\\(", simplify=TRUE) #TRUE returns a character matrix.
  d$Country <- ed_cy[,1]
```

1.  Додайте до дата фрейму новий стовпець “ID”, в який запишіть
    трибуквений код країна. Наприклад, “AFG”, “ALG” і т.п.

``` r
d$ID <- str_split(ed_cy[,2],"\\)", simplify=TRUE)[,1]
d$ID
```

    ##   [1] "AFG" "ALG" "ARG" "ARM" "ANZ" "AUS" "AUT" "AZE" "BAH" "BRN" "BAR" "BLR"
    ##  [13] "BEL" "BER" "BOH" "BOT" "BRA" "BWI" "BUL" "BDI" "CMR" "CAN" "CHI" "CHN"
    ##  [25] "COL" "CRC" "CIV" "CRO" "CUB" "CYP" "CZE" "TCH" "DEN" "DJI" "DOM" "ECU"
    ##  [37] "EGY" "ERI" "EST" "ETH" "FIN" "FRA" "GAB" "GEO" "GER" "EUA" "GDR" "FRG"
    ##  [49] "GHA" "GBR" "GRE" "GRN" "GUA" "GUY" "HAI" "HKG" "HUN" "ISL" "IND" "INA"
    ##  [61] "IRI" "IRQ" "IRL" "ISR" "ITA" "JAM" "JPN" "KAZ" "KEN" "PRK" "KOR" "KUW"
    ##  [73] "KGZ" "LAT" "LIB" "LIE" "LTU" "LUX" "MKD" "MAS" "MRI" "MEX" "MDA" "MGL"
    ##  [85] "MNE" "MAR" "MOZ" "NAM" "NED" "AHO" "NZL" "NIG" "NGR" "NOR" "PAK" "PAN"
    ##  [97] "PAR" "PER" "PHI" "POL" "POR" "PUR" "QAT" "ROU" "RUS" "RU1" "URS" "EUN"
    ## [109] "KSA" "SEN" "SRB" "SCG" "SIN" "SVK" "SLO" "RSA" "ESP" "SRI" "SUD" "SUR"
    ## [121] "SWE" "SUI" "SYR" "TPE" "TJK" "TAN" "THA" "TOG" "TGA" "TRI" "TUN" "TUR"
    ## [133] "UGA" "UKR" "UAE" "USA" "URU" "UZB" "VEN" "VIE" "ISV" "YUG" "IOP" "ZAM"
    ## [145] "ZIM" "ZZX" ""

1.  Видаліть з дата фрейму останню строку “Totals”

``` r
d <- d[-dim(d)[1],]
```

### Результат - готова функція:

``` r
 prepare_set <- function(file_name) {
d <- read.csv(file_name, skip = 1, header = TRUE, encoding="UTF-8",
stringsAsFactors = FALSE)
colnames(d)[1] <- "Country"
for(i in colnames(d)) {
  new_name <- str_replace_all(i, "X.U.2116..", "")  
  new_name <- str_replace_all( new_name, "X01..", "Gold")
  new_name <- str_replace_all( new_name, "X02..", "Silver")
  new_name <- str_replace_all( new_name, "X03..", "Bronze")
names(d)[names(d) == i] <- new_name}
# str_split щоб повернути список підрядків
#"\\(" - before "("
ed_cy <- str_split(d$Country, "[:space:]\\(", simplify=TRUE) #TRUE returns a character matrix.
d$Country <- ed_cy[,1]
d$ID <- str_split(ed_cy[,2],"\\)", simplify=TRUE)[,1]
d <- d[-dim(d)[1],]
return(d)
 }
d <- prepare_set("olympics.csv")
d
```

    ##                              Country Summer Gold Silver Bronze Total Winter
    ## 1                        Afghanistan     13    0      0      2     2      0
    ## 2                            Algeria     12    5      2      8    15      3
    ## 3                          Argentina     23   18     24     28    70     18
    ## 4                            Armenia      5    1      2      9    12      6
    ## 5                        Australasia      2    3      4      5    12      0
    ## 6                          Australia     25  139    152    177   468     18
    ## 7                            Austria     26   18     33     35    86     22
    ## 8                         Azerbaijan      5    6      5     15    26      5
    ## 9                            Bahamas     15    5      2      5    12      0
    ## 10                           Bahrain      8    0      0      1     1      0
    ## 11                          Barbados     11    0      0      1     1      0
    ## 12                           Belarus      5   12     24     39    75      6
    ## 13                           Belgium     25   37     52     53   142     20
    ## 14                           Bermuda     17    0      0      1     1      7
    ## 15                           Bohemia      3    0      1      3     4      0
    ## 16                          Botswana      9    0      1      0     1      0
    ## 17                            Brazil     21   23     30     55   108      7
    ## 18               British West Indies      1    0      0      2     2      0
    ## 19                          Bulgaria     19   51     85     78   214     19
    ## 20                           Burundi      5    1      0      0     1      0
    ## 21                          Cameroon     13    3      1      1     5      1
    ## 22                            Canada     25   59     99    121   279     22
    ## 23                             Chile     22    2      7      4    13     16
    ## 24                             China      9  201    146    126   473     10
    ## 25                          Colombia     18    2      6     11    19      1
    ## 26                        Costa Rica     14    1      1      2     4      6
    ## 27                       Ivory Coast     12    0      1      0     1      0
    ## 28                           Croatia      6    6      7     10    23      7
    ## 29                              Cuba     19   72     67     70   209      0
    ## 30                            Cyprus      9    0      1      0     1     10
    ## 31                    Czech Republic      5   14     15     15    44      6
    ## 32                    Czechoslovakia     16   49     49     45   143     16
    ## 33                           Denmark     26   43     68     68   179     13
    ## 34                          Djibouti      7    0      0      1     1      0
    ## 35                Dominican Republic     13    3      2      1     6      0
    ## 36                           Ecuador     13    1      1      0     2      0
    ## 37                             Egypt     21    7      9     10    26      1
    ## 38                           Eritrea      4    0      0      1     1      0
    ## 39                           Estonia     11    9      9     15    33      9
    ## 40                          Ethiopia     12   21      7     17    45      2
    ## 41                           Finland     24  101     84    117   302     22
    ## 42                            France     27  202    223    246   671     22
    ## 43                             Gabon      9    0      1      0     1      0
    ## 44                           Georgia      5    6      5     14    25      6
    ## 45                           Germany     15  174    182    217   573     11
    ## 46            United Team of Germany      3   28     54     36   118      3
    ## 47                      East Germany      5  153    129    127   409      6
    ## 48                      West Germany      5   56     67     81   204      6
    ## 49                             Ghana     13    0      1      3     4      1
    ## 50                     Great Britain     27  236    272    272   780     22
    ## 51                            Greece     27   30     42     39   111     18
    ## 52                           Grenada      8    1      0      0     1      0
    ## 53                         Guatemala     13    0      1      0     1      1
    ## 54                            Guyana     16    0      0      1     1      0
    ## 55                             Haiti     14    0      1      1     2      0
    ## 56                         Hong Kong     15    1      1      1     3      4
    ## 57                           Hungary     25  167    144    165   476     22
    ## 58                           Iceland     19    0      2      2     4     17
    ## 59                             India     23    9      6     11    26      9
    ## 60                         Indonesia     14    6     10     11    27      0
    ## 61                              Iran     15   15     20     25    60     10
    ## 62                              Iraq     13    0      0      1     1      0
    ## 63                           Ireland     20    9      8     12    29      6
    ## 64                            Israel     15    1      1      5     7      6
    ## 65                             Italy     26  198    166    185   549     22
    ## 66                           Jamaica     16   17     30     20    67      7
    ## 67                             Japan     21  130    126    142   398     20
    ## 68                        Kazakhstan      5   16     17     19    52      6
    ## 69                             Kenya     13   25     32     29    86      3
    ## 70                       North Korea      9   14     12     21    47      8
    ## 71                       South Korea     16   81     82     80   243     17
    ## 72                            Kuwait     12    0      0      2     2      0
    ## 73                        Kyrgyzstan      5    0      1      2     3      6
    ## 74                            Latvia     10    3     11      5    19     10
    ## 75                           Lebanon     16    0      2      2     4     16
    ## 76                     Liechtenstein     16    0      0      0     0     18
    ## 77                         Lithuania      8    6      5     10    21      8
    ## 78                        Luxembourg     22    1      1      0     2      8
    ## 79                         Macedonia      5    0      0      1     1      5
    ## 80                          Malaysia     12    0      3      3     6      0
    ## 81                         Mauritius      8    0      0      1     1      0
    ## 82                            Mexico     22   13     21     28    62      8
    ## 83                           Moldova      5    0      2      5     7      6
    ## 84                          Mongolia     12    2      9     13    24     13
    ## 85                        Montenegro      2    0      1      0     1      2
    ## 86                           Morocco     13    6      5     11    22      6
    ## 87                        Mozambique      9    1      0      1     2      0
    ## 88                           Namibia      6    0      4      0     4      0
    ## 89                       Netherlands     25   77     85    104   266     20
    ## 90              Netherlands Antilles     13    0      1      0     1      2
    ## 91                       New Zealand     22   42     18     39    99     15
    ## 92                             Niger     11    0      0      1     1      0
    ## 93                           Nigeria     15    3      8     12    23      0
    ## 94                            Norway     24   56     49     43   148     22
    ## 95                          Pakistan     16    3      3      4    10      2
    ## 96                            Panama     16    1      0      2     3      0
    ## 97                          Paraguay     11    0      1      0     1      1
    ## 98                              Peru     17    1      3      0     4      2
    ## 99                       Philippines     20    0      2      7     9      4
    ## 100                           Poland     20   64     82    125   271     22
    ## 101                         Portugal     23    4      8     11    23      7
    ## 102                      Puerto Rico     17    0      2      6     8      6
    ## 103                            Qatar      8    0      0      4     4      0
    ## 104                          Romania     20   88     94    119   301     20
    ## 105                           Russia      5  132    121    142   395      6
    ## 106                   Russian Empire      3    1      4      3     8      0
    ## 107                     Soviet Union      9  395    319    296  1010      9
    ## 108                     Unified Team      1   45     38     29   112      1
    ## 109                     Saudi Arabia     10    0      1      2     3      0
    ## 110                          Senegal     13    0      1      0     1      5
    ## 111                           Serbia      3    1      2      4     7      2
    ## 112            Serbia and Montenegro      3    2      4      3     9      3
    ## 113                        Singapore     15    0      2      2     4      0
    ## 114                         Slovakia      5    7      9      8    24      6
    ## 115                         Slovenia      6    4      6      9    19      7
    ## 116                     South Africa     18   23     26     27    76      6
    ## 117                            Spain     22   37     59     35   131     19
    ## 118                        Sri Lanka     16    0      2      0     2      0
    ## 119                            Sudan     11    0      1      0     1      0
    ## 120                         Suriname     11    1      0      1     2      0
    ## 121                           Sweden     26  143    164    176   483     22
    ## 122                      Switzerland     27   47     73     65   185     22
    ## 123                            Syria     12    1      1      1     3      0
    ## 124                   Chinese Taipei     13    2      7     12    21     11
    ## 125                       Tajikistan      5    0      1      2     3      4
    ## 126                         Tanzania     12    0      2      0     2      0
    ## 127                         Thailand     15    7      6     11    24      3
    ## 128                             Togo      9    0      0      1     1      1
    ## 129                            Tonga      8    0      1      0     1      1
    ## 130              Trinidad and Tobago     16    2      5     11    18      3
    ## 131                          Tunisia     13    3      3      4    10      0
    ## 132                           Turkey     21   39     25     24    88     16
    ## 133                           Uganda     14    2      3      2     7      0
    ## 134                          Ukraine      5   33     27     55   115      6
    ## 135             United Arab Emirates      8    1      0      0     1      0
    ## 136                    United States     26  976    757    666  2399     22
    ## 137                          Uruguay     20    2      2      6    10      1
    ## 138                       Uzbekistan      5    5      5     10    20      6
    ## 139                        Venezuela     17    2      2      8    12      4
    ## 140                          Vietnam     14    0      2      0     2      0
    ## 141                   Virgin Islands     11    0      1      0     1      7
    ## 142                       Yugoslavia     16   26     29     28    83     14
    ## 143 Independent Olympic Participants      1    0      1      2     3      0
    ## 144                           Zambia     12    0      1      1     2      0
    ## 145                         Zimbabwe     12    3      4      1     8      1
    ## 146                       Mixed team      3    8      5      4    17      0
    ##     Gold.1 Silver.1 Bronze.1 Total.1 Games Gold.2 Silver.2 Bronze.2
    ## 1        0        0        0       0    13      0        0        2
    ## 2        0        0        0       0    15      5        2        8
    ## 3        0        0        0       0    41     18       24       28
    ## 4        0        0        0       0    11      1        2        9
    ## 5        0        0        0       0     2      3        4        5
    ## 6        5        3        4      12    43    144      155      181
    ## 7       59       78       81     218    48     77      111      116
    ## 8        0        0        0       0    10      6        5       15
    ## 9        0        0        0       0    15      5        2        5
    ## 10       0        0        0       0     8      0        0        1
    ## 11       0        0        0       0    11      0        0        1
    ## 12       6        4        5      15    11     18       28       44
    ## 13       1        1        3       5    45     38       53       56
    ## 14       0        0        0       0    24      0        0        1
    ## 15       0        0        0       0     3      0        1        3
    ## 16       0        0        0       0     9      0        1        0
    ## 17       0        0        0       0    28     23       30       55
    ## 18       0        0        0       0     1      0        0        2
    ## 19       1        2        3       6    38     52       87       81
    ## 20       0        0        0       0     5      1        0        0
    ## 21       0        0        0       0    14      3        1        1
    ## 22      62       56       52     170    47    121      155      173
    ## 23       0        0        0       0    38      2        7        4
    ## 24      12       22       19      53    19    213      168      145
    ## 25       0        0        0       0    19      2        6       11
    ## 26       0        0        0       0    20      1        1        2
    ## 27       0        0        0       0    12      0        1        0
    ## 28       4        6        1      11    13     10       13       11
    ## 29       0        0        0       0    19     72       67       70
    ## 30       0        0        0       0    19      0        1        0
    ## 31       7        9        8      24    11     21       24       23
    ## 32       2        8       15      25    32     51       57       60
    ## 33       0        1        0       1    39     43       69       68
    ## 34       0        0        0       0     7      0        0        1
    ## 35       0        0        0       0    13      3        2        1
    ## 36       0        0        0       0    13      1        1        0
    ## 37       0        0        0       0    22      7        9       10
    ## 38       0        0        0       0     4      0        0        1
    ## 39       4        2        1       7    20     13       11       16
    ## 40       0        0        0       0    14     21        7       17
    ## 41      42       62       57     161    46    143      146      174
    ## 42      31       31       47     109    49    233      254      293
    ## 43       0        0        0       0     9      0        1        0
    ## 44       0        0        0       0    11      6        5       14
    ## 45      78       78       53     209    26    252      260      270
    ## 46       8        6        5      19     6     36       60       41
    ## 47      39       36       35     110    11    192      165      162
    ## 48      11       15       13      39    11     67       82       94
    ## 49       0        0        0       0    14      0        1        3
    ## 50      10        4       12      26    49    246      276      284
    ## 51       0        0        0       0    45     30       42       39
    ## 52       0        0        0       0     8      1        0        0
    ## 53       0        0        0       0    14      0        1        0
    ## 54       0        0        0       0    16      0        0        1
    ## 55       0        0        0       0    14      0        1        1
    ## 56       0        0        0       0    19      1        1        1
    ## 57       0        2        4       6    47    167      146      169
    ## 58       0        0        0       0    36      0        2        2
    ## 59       0        0        0       0    32      9        6       11
    ## 60       0        0        0       0    14      6       10       11
    ## 61       0        0        0       0    25     15       20       25
    ## 62       0        0        0       0    13      0        0        1
    ## 63       0        0        0       0    26      9        8       12
    ## 64       0        0        0       0    21      1        1        5
    ## 65      37       34       43     114    48    235      200      228
    ## 66       0        0        0       0    23     17       30       20
    ## 67      10       17       18      45    41    140      143      160
    ## 68       1        3        3       7    11     17       20       22
    ## 69       0        0        0       0    16     25       32       29
    ## 70       0        1        1       2    17     14       13       22
    ## 71      26       17       10      53    33    107       99       90
    ## 72       0        0        0       0    12      0        0        2
    ## 73       0        0        0       0    11      0        1        2
    ## 74       0        4        3       7    20      3       15        8
    ## 75       0        0        0       0    32      0        2        2
    ## 76       2        2        5       9    34      2        2        5
    ## 77       0        0        0       0    16      6        5       10
    ## 78       0        2        0       2    30      1        3        0
    ## 79       0        0        0       0    10      0        0        1
    ## 80       0        0        0       0    12      0        3        3
    ## 81       0        0        0       0     8      0        0        1
    ## 82       0        0        0       0    30     13       21       28
    ## 83       0        0        0       0    11      0        2        5
    ## 84       0        0        0       0    25      2        9       13
    ## 85       0        0        0       0     4      0        1        0
    ## 86       0        0        0       0    19      6        5       11
    ## 87       0        0        0       0     9      1        0        1
    ## 88       0        0        0       0     6      0        4        0
    ## 89      37       38       35     110    45    114      123      139
    ## 90       0        0        0       0    15      0        1        0
    ## 91       0        1        0       1    37     42       19       39
    ## 92       0        0        0       0    11      0        0        1
    ## 93       0        0        0       0    15      3        8       12
    ## 94     118      111      100     329    46    174      160      143
    ## 95       0        0        0       0    18      3        3        4
    ## 96       0        0        0       0    16      1        0        2
    ## 97       0        0        0       0    12      0        1        0
    ## 98       0        0        0       0    19      1        3        0
    ## 99       0        0        0       0    24      0        2        7
    ## 100      6        7        7      20    42     70       89      132
    ## 101      0        0        0       0    30      4        8       11
    ## 102      0        0        0       0    23      0        2        6
    ## 103      0        0        0       0     8      0        0        4
    ## 104      0        0        1       1    40     88       94      120
    ## 105     49       40       35     124    11    181      161      177
    ## 106      0        0        0       0     3      1        4        3
    ## 107     78       57       59     194    18    473      376      355
    ## 108      9        6        8      23     2     54       44       37
    ## 109      0        0        0       0    10      0        1        2
    ## 110      0        0        0       0    18      0        1        0
    ## 111      0        0        0       0     5      1        2        4
    ## 112      0        0        0       0     6      2        4        3
    ## 113      0        0        0       0    15      0        2        2
    ## 114      2        2        1       5    11      9       11        9
    ## 115      2        4        9      15    13      6       10       18
    ## 116      0        0        0       0    24     23       26       27
    ## 117      1        0        1       2    41     38       59       36
    ## 118      0        0        0       0    16      0        2        0
    ## 119      0        0        0       0    11      0        1        0
    ## 120      0        0        0       0    11      1        0        1
    ## 121     50       40       54     144    48    193      204      230
    ## 122     50       40       48     138    49     97      113      113
    ## 123      0        0        0       0    12      1        1        1
    ## 124      0        0        0       0    24      2        7       12
    ## 125      0        0        0       0     9      0        1        2
    ## 126      0        0        0       0    12      0        2        0
    ## 127      0        0        0       0    18      7        6       11
    ## 128      0        0        0       0    10      0        0        1
    ## 129      0        0        0       0     9      0        1        0
    ## 130      0        0        0       0    19      2        5       11
    ## 131      0        0        0       0    13      3        3        4
    ## 132      0        0        0       0    37     39       25       24
    ## 133      0        0        0       0    14      2        3        2
    ## 134      2        1        4       7    11     35       28       59
    ## 135      0        0        0       0     8      1        0        0
    ## 136     96      102       84     282    48   1072      859      750
    ## 137      0        0        0       0    21      2        2        6
    ## 138      1        0        0       1    11      6        5       10
    ## 139      0        0        0       0    21      2        2        8
    ## 140      0        0        0       0    14      0        2        0
    ## 141      0        0        0       0    18      0        1        0
    ## 142      0        3        1       4    30     26       32       29
    ## 143      0        0        0       0     1      0        1        2
    ## 144      0        0        0       0    12      0        1        1
    ## 145      0        0        0       0    13      3        4        1
    ## 146      0        0        0       0     3      8        5        4
    ##     Combined.total  ID
    ## 1                2 AFG
    ## 2               15 ALG
    ## 3               70 ARG
    ## 4               12 ARM
    ## 5               12 ANZ
    ## 6              480 AUS
    ## 7              304 AUT
    ## 8               26 AZE
    ## 9               12 BAH
    ## 10               1 BRN
    ## 11               1 BAR
    ## 12              90 BLR
    ## 13             147 BEL
    ## 14               1 BER
    ## 15               4 BOH
    ## 16               1 BOT
    ## 17             108 BRA
    ## 18               2 BWI
    ## 19             220 BUL
    ## 20               1 BDI
    ## 21               5 CMR
    ## 22             449 CAN
    ## 23              13 CHI
    ## 24             526 CHN
    ## 25              19 COL
    ## 26               4 CRC
    ## 27               1 CIV
    ## 28              34 CRO
    ## 29             209 CUB
    ## 30               1 CYP
    ## 31              68 CZE
    ## 32             168 TCH
    ## 33             180 DEN
    ## 34               1 DJI
    ## 35               6 DOM
    ## 36               2 ECU
    ## 37              26 EGY
    ## 38               1 ERI
    ## 39              40 EST
    ## 40              45 ETH
    ## 41             463 FIN
    ## 42             780 FRA
    ## 43               1 GAB
    ## 44              25 GEO
    ## 45             782 GER
    ## 46             137 EUA
    ## 47             519 GDR
    ## 48             243 FRG
    ## 49               4 GHA
    ## 50             806 GBR
    ## 51             111 GRE
    ## 52               1 GRN
    ## 53               1 GUA
    ## 54               1 GUY
    ## 55               2 HAI
    ## 56               3 HKG
    ## 57             482 HUN
    ## 58               4 ISL
    ## 59              26 IND
    ## 60              27 INA
    ## 61              60 IRI
    ## 62               1 IRQ
    ## 63              29 IRL
    ## 64               7 ISR
    ## 65             663 ITA
    ## 66              67 JAM
    ## 67             443 JPN
    ## 68              59 KAZ
    ## 69              86 KEN
    ## 70              49 PRK
    ## 71             296 KOR
    ## 72               2 KUW
    ## 73               3 KGZ
    ## 74              26 LAT
    ## 75               4 LIB
    ## 76               9 LIE
    ## 77              21 LTU
    ## 78               4 LUX
    ## 79               1 MKD
    ## 80               6 MAS
    ## 81               1 MRI
    ## 82              62 MEX
    ## 83               7 MDA
    ## 84              24 MGL
    ## 85               1 MNE
    ## 86              22 MAR
    ## 87               2 MOZ
    ## 88               4 NAM
    ## 89             376 NED
    ## 90               1 AHO
    ## 91             100 NZL
    ## 92               1 NIG
    ## 93              23 NGR
    ## 94             477 NOR
    ## 95              10 PAK
    ## 96               3 PAN
    ## 97               1 PAR
    ## 98               4 PER
    ## 99               9 PHI
    ## 100            291 POL
    ## 101             23 POR
    ## 102              8 PUR
    ## 103              4 QAT
    ## 104            302 ROU
    ## 105            519 RUS
    ## 106              8 RU1
    ## 107           1204 URS
    ## 108            135 EUN
    ## 109              3 KSA
    ## 110              1 SEN
    ## 111              7 SRB
    ## 112              9 SCG
    ## 113              4 SIN
    ## 114             29 SVK
    ## 115             34 SLO
    ## 116             76 RSA
    ## 117            133 ESP
    ## 118              2 SRI
    ## 119              1 SUD
    ## 120              2 SUR
    ## 121            627 SWE
    ## 122            323 SUI
    ## 123              3 SYR
    ## 124             21 TPE
    ## 125              3 TJK
    ## 126              2 TAN
    ## 127             24 THA
    ## 128              1 TOG
    ## 129              1 TGA
    ## 130             18 TRI
    ## 131             10 TUN
    ## 132             88 TUR
    ## 133              7 UGA
    ## 134            122 UKR
    ## 135              1 UAE
    ## 136           2681 USA
    ## 137             10 URU
    ## 138             21 UZB
    ## 139             12 VEN
    ## 140              2 VIE
    ## 141              1 ISV
    ## 142             87 YUG
    ## 143              3 IOP
    ## 144              2 ZAM
    ## 145              8 ZIM
    ## 146             17 ZZX

Для кожного наступного питання напишіть функцію, яка повертає вказаний
результат. Назви функції “answer\_one” для питання 1, “answer\_two” для
питання 2 і т.д.

Питання 1 Котра країна виграла найбільшу кількість золотих нагород на
літніх іграх? Функція повинна повернути одне текстове значення.

``` r
answer_one <-  function(){
  r <- d$Country[which.max(d$Gold)]
  return (r)
}
answer_one()
```

    ## [1] "United States"

Питання 2 Яка країна має найбільшу різницю між кількістю нагород на
літніх та зимових іграх?

``` r
answer_two <- d$Country[which.max(abs(d$Total - d$Total.1))]
answer_two
```

    ## [1] "United States"

Питання 3 В якій крайні найбільша різниця між літніми та зимовими
золотими нагородами відносно до загальної кількості нагород (Summer Gold
- Winter Gold) / Total Gold. Врахувати тільки країни які мають як
мінімум по одній нагороді в літніх та зимових іграх. Функція повинна
повернути одне текстове значення.

``` r
answer_three <- function(){
  cond <- d[d$Gold > 0 & d$Gold.1 > 0,]
  r <- cond$Country[which.max((cond$Gold - cond$Gold.1)/((cond$Gold + cond$Gold.1)))]
    return(r)
}
answer_three()
```

    ## [1] "Bulgaria"

Питання 4 Необхідно знайти кількість балів по кожній крайні. Бали
рахуються наступним чином: Золота нагорода Gold.2 це три бали, срібна
Silver.2 - 2 бали та бронзова Bronze.2 – 1 бал. Функція повинна
повертати дата фрейм довжиною 146, який складається з двох колонок:
“Country”, “Points”.

``` r
answer_four <- function(){
  POINTS = d$Gold.2*3 + d$Silver.2*2 + d$Bronze.2
  r <- data.frame(d$Country, POINTS)
  return(r)
}
answer_four()
```

    ##                            d.Country POINTS
    ## 1                        Afghanistan      2
    ## 2                            Algeria     27
    ## 3                          Argentina    130
    ## 4                            Armenia     16
    ## 5                        Australasia     22
    ## 6                          Australia    923
    ## 7                            Austria    569
    ## 8                         Azerbaijan     43
    ## 9                            Bahamas     24
    ## 10                           Bahrain      1
    ## 11                          Barbados      1
    ## 12                           Belarus    154
    ## 13                           Belgium    276
    ## 14                           Bermuda      1
    ## 15                           Bohemia      5
    ## 16                          Botswana      2
    ## 17                            Brazil    184
    ## 18               British West Indies      2
    ## 19                          Bulgaria    411
    ## 20                           Burundi      3
    ## 21                          Cameroon     12
    ## 22                            Canada    846
    ## 23                             Chile     24
    ## 24                             China   1120
    ## 25                          Colombia     29
    ## 26                        Costa Rica      7
    ## 27                       Ivory Coast      2
    ## 28                           Croatia     67
    ## 29                              Cuba    420
    ## 30                            Cyprus      2
    ## 31                    Czech Republic    134
    ## 32                    Czechoslovakia    327
    ## 33                           Denmark    335
    ## 34                          Djibouti      1
    ## 35                Dominican Republic     14
    ## 36                           Ecuador      5
    ## 37                             Egypt     49
    ## 38                           Eritrea      1
    ## 39                           Estonia     77
    ## 40                          Ethiopia     94
    ## 41                           Finland    895
    ## 42                            France   1500
    ## 43                             Gabon      2
    ## 44                           Georgia     42
    ## 45                           Germany   1546
    ## 46            United Team of Germany    269
    ## 47                      East Germany   1068
    ## 48                      West Germany    459
    ## 49                             Ghana      5
    ## 50                     Great Britain   1574
    ## 51                            Greece    213
    ## 52                           Grenada      3
    ## 53                         Guatemala      2
    ## 54                            Guyana      1
    ## 55                             Haiti      3
    ## 56                         Hong Kong      6
    ## 57                           Hungary    962
    ## 58                           Iceland      6
    ## 59                             India     50
    ## 60                         Indonesia     49
    ## 61                              Iran    110
    ## 62                              Iraq      1
    ## 63                           Ireland     55
    ## 64                            Israel     10
    ## 65                             Italy   1333
    ## 66                           Jamaica    131
    ## 67                             Japan    866
    ## 68                        Kazakhstan    113
    ## 69                             Kenya    168
    ## 70                       North Korea     90
    ## 71                       South Korea    609
    ## 72                            Kuwait      2
    ## 73                        Kyrgyzstan      4
    ## 74                            Latvia     47
    ## 75                           Lebanon      6
    ## 76                     Liechtenstein     15
    ## 77                         Lithuania     38
    ## 78                        Luxembourg      9
    ## 79                         Macedonia      1
    ## 80                          Malaysia      9
    ## 81                         Mauritius      1
    ## 82                            Mexico    109
    ## 83                           Moldova      9
    ## 84                          Mongolia     37
    ## 85                        Montenegro      2
    ## 86                           Morocco     39
    ## 87                        Mozambique      4
    ## 88                           Namibia      8
    ## 89                       Netherlands    727
    ## 90              Netherlands Antilles      2
    ## 91                       New Zealand    203
    ## 92                             Niger      1
    ## 93                           Nigeria     37
    ## 94                            Norway    985
    ## 95                          Pakistan     19
    ## 96                            Panama      5
    ## 97                          Paraguay      2
    ## 98                              Peru      9
    ## 99                       Philippines     11
    ## 100                           Poland    520
    ## 101                         Portugal     39
    ## 102                      Puerto Rico     10
    ## 103                            Qatar      4
    ## 104                          Romania    572
    ## 105                           Russia   1042
    ## 106                   Russian Empire     14
    ## 107                     Soviet Union   2526
    ## 108                     Unified Team    287
    ## 109                     Saudi Arabia      4
    ## 110                          Senegal      2
    ## 111                           Serbia     11
    ## 112            Serbia and Montenegro     17
    ## 113                        Singapore      6
    ## 114                         Slovakia     58
    ## 115                         Slovenia     56
    ## 116                     South Africa    148
    ## 117                            Spain    268
    ## 118                        Sri Lanka      4
    ## 119                            Sudan      2
    ## 120                         Suriname      4
    ## 121                           Sweden   1217
    ## 122                      Switzerland    630
    ## 123                            Syria      6
    ## 124                   Chinese Taipei     32
    ## 125                       Tajikistan      4
    ## 126                         Tanzania      4
    ## 127                         Thailand     44
    ## 128                             Togo      1
    ## 129                            Tonga      2
    ## 130              Trinidad and Tobago     27
    ## 131                          Tunisia     19
    ## 132                           Turkey    191
    ## 133                           Uganda     14
    ## 134                          Ukraine    220
    ## 135             United Arab Emirates      3
    ## 136                    United States   5684
    ## 137                          Uruguay     16
    ## 138                       Uzbekistan     38
    ## 139                        Venezuela     18
    ## 140                          Vietnam      4
    ## 141                   Virgin Islands      2
    ## 142                       Yugoslavia    171
    ## 143 Independent Olympic Participants      4
    ## 144                           Zambia      3
    ## 145                         Zimbabwe     18
    ## 146                       Mixed team     38
