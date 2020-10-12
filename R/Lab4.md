


<div class="container-fluid main-container">




<div class="fluid-row" id="header">



<h1 class="title toc-ignore">Lab4</h1>

</div>


<div id="виконала-бокань-вероніка" class="section level3">
<h3>Виконала: <em>Бокань Вероніка</em></h3>
</div>
<div id="для-лабораторної-роботи-необхідно-завантажити-файл-з-даними-за-посиланням-httpswww.dropbox.coms8k1gjgk8cflmpb6hw1_data.csvdl0.в-rstudio-файл-необхідно-прочитати-за-допомогою-команди-read.csv." class="section level3">
<h3>Для лабораторної роботи необхідно завантажити файл з даними за посиланням: «<a href="https://www.dropbox.com/s/8k1gjgk8cflmpb6/hw1_data.csv?dl=0" class="uri">https://www.dropbox.com/s/8k1gjgk8cflmpb6/hw1_data.csv?dl=0</a>».В RStudio файл необхідно прочитати за допомогою команди read.csv.</h3>
<pre class="r"><code class="hljs"><span class="hljs-keyword">library</span>(readr)
data &lt;- read_csv(<span class="hljs-string">"hw1_data.csv"</span>)</code></pre>
<pre><code class="hljs">## 
## -- Column specification -------------------------------------------------------------------------------------------
## cols(
##   Ozone = col_double(),
##   Solar.R = col_double(),
##   Wind = col_double(),
##   Temp = col_double(),
##   Month = col_double(),
##   Day = col_double()
## )</code></pre>
<pre class="r"><code class="hljs">data </code></pre>
<pre><code class="hljs">## # A tibble: 153 x 6
##    Ozone Solar.R  Wind  Temp Month   Day
##    &lt;dbl&gt;   &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt;
##  1    41     190   7.4    67     5     1
##  2    36     118   8      72     5     2
##  3    12     149  12.6    74     5     3
##  4    18     313  11.5    62     5     4
##  5    NA      NA  14.3    56     5     5
##  6    28      NA  14.9    66     5     6
##  7    23     299   8.6    65     5     7
##  8    19      99  13.8    59     5     8
##  9     8      19  20.1    61     5     9
## 10    NA     194   8.6    69     5    10
## # ... with 143 more rows</code></pre>
</div>
<div id="в-лабораторній-необхідно-відповісти-на-запитання" class="section level3">
<h3>В лабораторній необхідно відповісти на запитання:</h3>
</div>
<div id="які-назви-стовпців-файлу-даних" class="section level3">
<h3>1. Які назви стовпців файлу даних?</h3>
<pre class="r"><code class="hljs">names(data)</code></pre>
<pre><code class="hljs">## [1] "Ozone"   "Solar.R" "Wind"    "Temp"    "Month"   "Day"</code></pre>
</div>
<div id="виведіть-перші-6-строк-фрейму-даних." class="section level3">
<h3>2. Виведіть перші 6 строк фрейму даних.</h3>
<pre class="r"><code class="hljs">data[<span class="hljs-number">1</span>:<span class="hljs-number">6</span>,]</code></pre>
<pre><code class="hljs">## # A tibble: 6 x 6
##   Ozone Solar.R  Wind  Temp Month   Day
##   &lt;dbl&gt;   &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt;
## 1    41     190   7.4    67     5     1
## 2    36     118   8      72     5     2
## 3    12     149  12.6    74     5     3
## 4    18     313  11.5    62     5     4
## 5    NA      NA  14.3    56     5     5
## 6    28      NA  14.9    66     5     6</code></pre>
</div>
<div id="скільки-спостерігань-строк-в-дата-фреймі" class="section level3">
<h3>3. Скільки спостерігань (строк) в дата фреймі?</h3>
<pre class="r"><code class="hljs">nrow(data)</code></pre>
<pre><code class="hljs">## [1] 153</code></pre>
</div>
<div id="виведіть-останні-10-строк-дата-фрейму." class="section level3">
<h3>4. Виведіть останні 10 строк дата фрейму.</h3>
<pre class="r"><code class="hljs">tail(data,<span class="hljs-number">10</span>)</code></pre>
<pre><code class="hljs">## # A tibble: 10 x 6
##    Ozone Solar.R  Wind  Temp Month   Day
##    &lt;dbl&gt;   &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt;
##  1    13     238  12.6    64     9    21
##  2    23      14   9.2    71     9    22
##  3    36     139  10.3    81     9    23
##  4     7      49  10.3    69     9    24
##  5    14      20  16.6    63     9    25
##  6    30     193   6.9    70     9    26
##  7    NA     145  13.2    77     9    27
##  8    14     191  14.3    75     9    28
##  9    18     131   8      76     9    29
## 10    20     223  11.5    68     9    30</code></pre>
</div>
<div id="як-багато-значень-na-в-стовпці-ozone" class="section level3">
<h3>5. Як багато значень «NA» в стовпці «Ozone»?</h3>
<pre class="r"><code class="hljs">bad &lt;- is.na(data[,<span class="hljs-string">"Ozone"</span>])
sum(bad)</code></pre>
<pre><code class="hljs">## [1] 37</code></pre>
</div>
<div id="яке-середнє-mean-стовпця-ozone.-виключити-na-значення." class="section level3">
<h3>6. Яке середнє (mean) стовпця «Ozone». Виключити «NA» значення.</h3>
<pre class="r"><code class="hljs">bad &lt;- is.na(data[,<span class="hljs-string">"Ozone"</span>])
o &lt;- data[,<span class="hljs-string">"Ozone"</span>]
mean(o[!bad])</code></pre>
<pre><code class="hljs">## [1] 42.12931</code></pre>
</div>
<div id="виведіть-частину-набору-даних-subset-зі-значенням-ozone-31-та-temp-90.-яке-середнє-mean-значень-solar.r-в-цьому-наборі-даних-subset" class="section level3">
<h3>7. Виведіть частину набору даних (subset) зі значенням «Ozone» &gt; 31 та «Temp» &gt; 90. Яке середнє (mean) значень «Solar.R» в цьому наборі даних (subset)?</h3>
<pre class="r"><code class="hljs">o1 &lt;- data[,<span class="hljs-string">"Temp"</span>]
s &lt;-  subset.data.frame(data, o&gt;<span class="hljs-number">31</span> &amp; o1&gt;<span class="hljs-number">90</span>)
s</code></pre>
<pre><code class="hljs">## # A tibble: 10 x 6
##    Ozone Solar.R  Wind  Temp Month   Day
##    &lt;dbl&gt;   &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt;
##  1    97     267   6.3    92     7     8
##  2    97     272   5.7    92     7     9
##  3    76     203   9.7    97     8    28
##  4   118     225   2.3    94     8    29
##  5    84     237   6.3    96     8    30
##  6    85     188   6.3    94     8    31
##  7    96     167   6.9    91     9     1
##  8    78     197   5.1    92     9     2
##  9    73     183   2.8    93     9     3
## 10    91     189   4.6    93     9     4</code></pre>
<pre class="r"><code class="hljs">mean(s$Solar.R, na.rm = <span class="hljs-literal">TRUE</span>)</code></pre>
<pre><code class="hljs">## [1] 212.8</code></pre>
</div>
<div id="яке-середнє-значення-mean-для-temp-для-червня-month-дорівнює-6" class="section level3">
<h3>8. Яке середнє значення (mean) для «Temp» для червня («Month» дорівнює 6)?</h3>
<pre class="r"><code class="hljs">w &lt;- subset.data.frame(data, Month == <span class="hljs-number">6</span>)
mean(w$Temp, na.rm = <span class="hljs-literal">TRUE</span>)</code></pre>
<pre><code class="hljs">## [1] 79.1</code></pre>
</div>
<div id="яке-максимальне-значення-ozone-для-травня-month-дорівнює-5" class="section level3">
<h3>9. Яке максимальне значення «Ozone» для травня («Month» дорівнює 5)?</h3>
<pre class="r"><code class="hljs">w2 &lt;- subset.data.frame(data, Month == <span class="hljs-number">5</span>)
w2</code></pre>
<pre><code class="hljs">## # A tibble: 31 x 6
##    Ozone Solar.R  Wind  Temp Month   Day
##    &lt;dbl&gt;   &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt;
##  1    41     190   7.4    67     5     1
##  2    36     118   8      72     5     2
##  3    12     149  12.6    74     5     3
##  4    18     313  11.5    62     5     4
##  5    NA      NA  14.3    56     5     5
##  6    28      NA  14.9    66     5     6
##  7    23     299   8.6    65     5     7
##  8    19      99  13.8    59     5     8
##  9     8      19  20.1    61     5     9
## 10    NA     194   8.6    69     5    10
## # ... with 21 more rows</code></pre>
<pre class="r"><code class="hljs">max(w2$Ozone, na.rm = <span class="hljs-literal">TRUE</span>)</code></pre>
<pre><code class="hljs">## [1] 115</code></pre>
</div>




</div>















