


<div class="container-fluid main-container">




<div class="fluid-row" id="header">




</div>


<div id="лабораторна-робота-1" class="section level1">
<h1>Лабораторна робота # 1</h1>
</div>
<div id="виконала-бокань-вероніка" class="section level1">
<h1>Виконала: <em>Бокань Вероніка</em></h1>
<div id="в-лабораторній-роботі-необхідно-виконати-наступні-дії" class="section level3">
<h3>В лабораторній роботі необхідно виконати наступні дії:</h3>
</div>
<div id="створити-змінні-базових-atomic-типів.-базові-типи-character-numeric" class="section level3">
<h3>1. Створити змінні базових (atomic) типів. Базові типи: character, numeric,</h3>
</div>
<div id="integer-complex-logical." class="section level3">
<h3>integer, complex, logical.</h3>
<div id="character" class="section level4">
<h4>Character:</h4>
<pre class="r"><code class="hljs">y &lt;- <span class="hljs-string">"hello"</span>
class(y)</code></pre>
<pre><code class="hljs">## [1] "character"</code></pre>
</div>
<div id="numeric" class="section level4">
<h4>Numeric:</h4>
<pre class="r"><code class="hljs">x &lt;- <span class="hljs-number">1</span>
class(x)</code></pre>
<pre><code class="hljs">## [1] "numeric"</code></pre>
</div>
<div id="integer" class="section level4">
<h4>Integer:</h4>
<pre class="r"><code class="hljs">z &lt;- <span class="hljs-number">0</span>:<span class="hljs-number">5</span>
class(z)</code></pre>
<pre><code class="hljs">## [1] "integer"</code></pre>
</div>
<div id="complex" class="section level4">
<h4>Complex:</h4>
<pre class="r"><code class="hljs">t &lt;- c(<span class="hljs-number">1</span>+<span class="hljs-number">0i</span>, <span class="hljs-number">2</span>+<span class="hljs-number">4i</span>)
class(t)</code></pre>
<pre><code class="hljs">## [1] "complex"</code></pre>
</div>
<div id="logical" class="section level4">
<h4>Logical:</h4>
<pre class="r"><code class="hljs">w &lt;- c(<span class="hljs-literal">TRUE</span>, <span class="hljs-literal">FALSE</span>)
class(w)</code></pre>
<pre><code class="hljs">## [1] "logical"</code></pre>
</div>
</div>
<div id="створити-вектори-які" class="section level3">
<h3>2. Створити вектори, які:</h3>
<div id="містить-послідовність-з-5-до-75" class="section level4">
<h4>містить послідовність з 5 до 75;</h4>
<pre class="r"><code class="hljs">i &lt;- c(<span class="hljs-number">5</span>:<span class="hljs-number">75</span>)
i</code></pre>
<pre><code class="hljs">##  [1]  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29
## [26] 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54
## [51] 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75</code></pre>
</div>
<div id="містить-числа-3.142.71-0-13" class="section level4">
<h4>містить числа 3.14,2.71, 0, 13;</h4>
<pre class="r"><code class="hljs">i &lt;- c(<span class="hljs-number">3.14</span>,<span class="hljs-number">2.71</span>, <span class="hljs-number">0</span>,<span class="hljs-number">13</span> )
i</code></pre>
<pre><code class="hljs">## [1]  3.14  2.71  0.00 13.00</code></pre>
</div>
<div id="значень-true." class="section level4">
<h4>100 значень TRUE.</h4>
<pre class="r"><code class="hljs">f &lt;-  rep(c(<span class="hljs-literal">T</span>), length.out = <span class="hljs-number">100</span>)
f</code></pre>
<pre><code class="hljs">##   [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
##  [16] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
##  [31] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
##  [46] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
##  [61] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
##  [76] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
##  [91] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE</code></pre>
</div>
</div>
<div id="створити-наступну-матрицю-за-допомогою-matrix-та-за-допомогою-cbind-або-rbind" class="section level3">
<h3>3. Створити наступну матрицю за допомогою matrix, та за допомогою cbind або rbind</h3>
<pre class="r"><code class="hljs">m &lt;- matrix( c(<span class="hljs-number">0.5</span>, <span class="hljs-number">3.9</span>, <span class="hljs-number">0</span>,<span class="hljs-number">2</span>,<span class="hljs-number">1.3</span>,<span class="hljs-number">131</span>,<span class="hljs-number">2.2</span>,<span class="hljs-number">7</span>,<span class="hljs-number">3.5</span>,<span class="hljs-number">2.8</span>,<span class="hljs-number">4.6</span>,<span class="hljs-number">5.1</span>), ncol = <span class="hljs-number">3</span>,  nrow = <span class="hljs-number">4</span>)
m</code></pre>
<pre><code class="hljs">##      [,1]  [,2] [,3]
## [1,]  0.5   1.3  3.5
## [2,]  3.9 131.0  2.8
## [3,]  0.0   2.2  4.6
## [4,]  2.0   7.0  5.1</code></pre>
<pre class="r"><code class="hljs">v &lt;- cbind(c(<span class="hljs-number">0.5</span>, <span class="hljs-number">3.9</span>, <span class="hljs-number">0</span>,<span class="hljs-number">2</span>),c(<span class="hljs-number">1.3</span>,<span class="hljs-number">131</span>,<span class="hljs-number">2.2</span>,<span class="hljs-number">7</span>), c(<span class="hljs-number">3.5</span>,<span class="hljs-number">2.8</span>,<span class="hljs-number">4.6</span>,<span class="hljs-number">5.1</span>))
v</code></pre>
<pre><code class="hljs">##      [,1]  [,2] [,3]
## [1,]  0.5   1.3  3.5
## [2,]  3.9 131.0  2.8
## [3,]  0.0   2.2  4.6
## [4,]  2.0   7.0  5.1</code></pre>
<pre class="r"><code class="hljs">l &lt;- rbind(c(<span class="hljs-number">0.5</span>,  <span class="hljs-number">1.3</span>,  <span class="hljs-number">3.5</span>),c(<span class="hljs-number">3.9</span>, <span class="hljs-number">131.0</span>,  <span class="hljs-number">2.8</span>), c(<span class="hljs-number">0.0</span>,   <span class="hljs-number">2.2</span>,  <span class="hljs-number">4.6</span>),c(<span class="hljs-number">2.0</span>,   <span class="hljs-number">7.0</span>,  <span class="hljs-number">5.1</span>) )
l</code></pre>
<pre><code class="hljs">##      [,1]  [,2] [,3]
## [1,]  0.5   1.3  3.5
## [2,]  3.9 131.0  2.8
## [3,]  0.0   2.2  4.6
## [4,]  2.0   7.0  5.1</code></pre>
</div>
<div id="створити-довільний-список-list-в-який-включити-всі-базові-типи." class="section level3">
<h3>4. Створити довільний список (list), в який включити всі базові типи.</h3>
<pre class="r"><code class="hljs">x &lt;- list(<span class="hljs-number">1</span>, <span class="hljs-string">"a"</span>, <span class="hljs-literal">TRUE</span>, <span class="hljs-number">1</span> + <span class="hljs-number">4i</span>, <span class="hljs-number">0</span>:<span class="hljs-number">5</span>)
x</code></pre>
<pre><code class="hljs">## [[1]]
## [1] 1
## 
## [[2]]
## [1] "a"
## 
## [[3]]
## [1] TRUE
## 
## [[4]]
## [1] 1+4i
## 
## [[5]]
## [1] 0 1 2 3 4 5</code></pre>
<pre class="r"><code class="hljs">x &lt;- list(class(<span class="hljs-number">1</span>), class(<span class="hljs-string">"a"</span>), class(<span class="hljs-literal">TRUE</span>), class(<span class="hljs-number">1</span> + <span class="hljs-number">4i</span>),class(<span class="hljs-number">0</span>:<span class="hljs-number">5</span>))
x</code></pre>
<pre><code class="hljs">## [[1]]
## [1] "numeric"
## 
## [[2]]
## [1] "character"
## 
## [[3]]
## [1] "logical"
## 
## [[4]]
## [1] "complex"
## 
## [[5]]
## [1] "integer"</code></pre>
</div>
<div id="створити-фактор-з-трьома-рівнями-baby-child-adult." class="section level3">
<h3>5. Створити фактор з трьома рівнями «baby», «child», «adult».</h3>
<pre class="r"><code class="hljs">x &lt;- factor(c(<span class="hljs-string">"baby"</span>, <span class="hljs-string">"child"</span>, <span class="hljs-string">"adult"</span>))
x</code></pre>
<pre><code class="hljs">## [1] baby  child adult
## Levels: adult baby child</code></pre>
</div>
<div id="знайти-індекс-першого-значення-na-в-векторі-1-2-3-4-na-6-7-na-9-na-11." class="section level3">
<h3>6. Знайти індекс першого значення NA в векторі 1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11.</h3>
<pre class="r"><code class="hljs">a &lt;- c( <span class="hljs-number">1</span>, <span class="hljs-number">2</span>, <span class="hljs-number">3</span>, <span class="hljs-number">4</span>, <span class="hljs-literal">NA</span>, <span class="hljs-number">6</span>, <span class="hljs-number">7</span>, <span class="hljs-literal">NA</span>, <span class="hljs-number">9</span>, <span class="hljs-literal">NA</span>, <span class="hljs-number">11</span>)
a</code></pre>
<pre><code class="hljs">##  [1]  1  2  3  4 NA  6  7 NA  9 NA 11</code></pre>
<pre class="r"><code class="hljs">match(c(<span class="hljs-literal">NA</span>),a)</code></pre>
<pre><code class="hljs">## [1] 5</code></pre>
</div>
<div id="знайти-кількість-значень-na." class="section level3">
<h3>Знайти кількість значень NA.</h3>
<pre class="r"><code class="hljs">sum(is.na (a))</code></pre>
<pre><code class="hljs">## [1] 3</code></pre>
</div>
<div id="створити-довільний-data-frame-та-вивести-в-консоль." class="section level3">
<h3>7. Створити довільний data frame та вивести в консоль.</h3>
<pre class="r"><code class="hljs">x &lt;- data.frame(a = <span class="hljs-number">1</span>:<span class="hljs-number">4</span>, b = <span class="hljs-number">4</span>:<span class="hljs-number">1</span>)
x</code></pre>
<pre><code class="hljs">##   a b
## 1 1 4
## 2 2 3
## 3 3 2
## 4 4 1</code></pre>
</div>
<div id="змінити-імена-стовпців-цього-data-frame." class="section level3">
<h3>8. Змінити імена стовпців цього data frame.</h3>
<pre class="r"><code class="hljs">names(x) &lt;- c(<span class="hljs-string">"ttt"</span>, <span class="hljs-string">"ooo"</span>)
x</code></pre>
<pre><code class="hljs">##   ttt ooo
## 1   1   4
## 2   2   3
## 3   3   2
## 4   4   1</code></pre>
</div>
</div>




</div>















