


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
<pre class="{r}"><code class="hljs">y &lt;- "hello"
class(y)</code></pre>
</div>
<div id="numeric" class="section level4">
<h4>Numeric:</h4>
<pre class="{r}"><code class="hljs">x &lt;- 1
class(x)</code></pre>
</div>
<div id="integer" class="section level4">
<h4>Integer:</h4>
<pre class="{r}"><code class="hljs">z &lt;- 0:5
class(z)</code></pre>
</div>
<div id="complex" class="section level4">
<h4>Complex:</h4>
<pre class="{r}"><code class="hljs">t &lt;- c(1+0i, 2+4i)
class(t)</code></pre>
</div>
<div id="logical" class="section level4">
<h4>Logical:</h4>
<pre class="{r}"><code class="hljs">w &lt;- c(TRUE, FALSE)
class(w)</code></pre>
</div>
</div>
<div id="створити-вектори-які" class="section level3">
<h3>2. Створити вектори, які:</h3>
<div id="містить-послідовність-з-5-до-75" class="section level4">
<h4>містить послідовність з 5 до 75;</h4>
<pre class="{r}"><code class="hljs">i &lt;- c(5:75)
i</code></pre>
</div>
<div id="містить-числа-3.142.71-0-13" class="section level4">
<h4>містить числа 3.14,2.71, 0, 13;</h4>
<pre class="{r}"><code class="hljs">i &lt;- c(3.14,2.71, 0,13 )
i</code></pre>
</div>
<div id="значень-true." class="section level4">
<h4>100 значень TRUE.</h4>
<pre class="{r}"><code class="hljs">f &lt;-  rep(c(T), length.out = 100)
f</code></pre>
</div>
</div>
<div id="створити-наступну-матрицю-за-допомогою-matrix-та-за-допомогою-cbind-або-rbind" class="section level3">
<h3>3. Створити наступну матрицю за допомогою matrix, та за допомогою cbind або rbind</h3>
<pre class="{r}"><code class="hljs">m &lt;- matrix( c(0.5, 3.9, 0,2,1.3,131,2.2,7,3.5,2.8,4.6,5.1), ncol = 3,  nrow = 4)
m</code></pre>
<pre class="{r}"><code class="hljs">v &lt;- cbind(c(0.5, 3.9, 0,2),c(1.3,131,2.2,7), c(3.5,2.8,4.6,5.1))
v</code></pre>
<pre class="{r}"><code class="hljs">l &lt;- rbind(c(0.5,  1.3,  3.5),c(3.9, 131.0,  2.8), c(0.0,   2.2,  4.6),c(2.0,   7.0,  5.1) )
l</code></pre>
</div>
<div id="створити-довільний-список-list-в-який-включити-всі-базові-типи." class="section level3">
<h3>4. Створити довільний список (list), в який включити всі базові типи.</h3>
<pre class="{r}"><code class="hljs">x &lt;- list(1, "a", TRUE, 1 + 4i, 0:5)
x
x &lt;- list(class(1), class("a"), class(TRUE), class(1 + 4i),class(0:5))
x</code></pre>
</div>
<div id="створити-фактор-з-трьома-рівнями-baby-child-adult." class="section level3">
<h3>5. Створити фактор з трьома рівнями «baby», «child», «adult».</h3>
<pre class="{r}"><code class="hljs">x &lt;- factor(c("baby", "child", "adult"))
x</code></pre>
</div>
<div id="знайти-індекс-першого-значення-na-в-векторі-1-2-3-4-na-6-7-na-9-na-11." class="section level3">
<h3>6. Знайти індекс першого значення NA в векторі 1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11.</h3>
<pre class="{r}"><code class="hljs">a &lt;- c( 1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11)
a
match(c(NA),a)</code></pre>
</div>
<div id="знайти-кількість-значень-na." class="section level3">
<h3>Знайти кількість значень NA.</h3>
<pre class="{r}"><code class="hljs">sum(is.na (a))</code></pre>
</div>
<div id="створити-довільний-data-frame-та-вивести-в-консоль." class="section level3">
<h3>7. Створити довільний data frame та вивести в консоль.</h3>
<pre class="{r}"><code class="hljs">x &lt;- data.frame(a = 1:4, b = 4:1)
x</code></pre>
</div>
<div id="змінити-імена-стовпців-цього-data-frame." class="section level3">
<h3>8. Змінити імена стовпців цього data frame.</h3>
<pre class="{r}"><code class="hljs">names(x) &lt;- c("ttt", "ooo")
x</code></pre>
</div>
</div>




</div>















