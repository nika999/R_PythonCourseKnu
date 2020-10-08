


<div class="container-fluid main-container">




<div class="fluid-row" id="header">



<h1 class="title toc-ignore">lab3</h1>

</div>


<div id="лабораторна-робота-1" class="section level1">
<h1>Лабораторна робота # 1</h1>
<div id="виконала-бокань-вероніка" class="section level3">
<h3>Виконала: <em>Бокань Вероніка</em></h3>
</div>
<div id="в-лабораторній-роботі-необхідно-виконати-наступні-дії" class="section level3">
<h3>В лабораторній роботі необхідно виконати наступні дії:</h3>
</div>
<div id="в-лабораторній-роботі-необхідно-написати-наступні-функції-на-мові-r-та-вивести-результат-роботи-цих-функцій-на-довільних-даних" class="section level3">
<h3>В лабораторній роботі необхідно написати наступні функції на мові R та вивести результат роботи цих функцій на довільних даних:</h3>
</div>
<div id="функція-add2x-y-яка-повертає-суму-двох-чисел." class="section level3">
<h3>1. Функція add2(x, y), яка повертає суму двох чисел.</h3>
<pre class="r"><code class="hljs">add2 &lt;- <span class="hljs-keyword">function</span>(x,y){print(x+y)}
add2(<span class="hljs-number">2</span>,<span class="hljs-number">1</span>)</code></pre>
<pre><code class="hljs">## [1] 3</code></pre>
</div>
<div id="функція-abovex-n-яка-приймає-вектор-та-число-n-та-повертає-всі-елементі-вектору-які-більше-n.-по-замовчуванню-n-10." class="section level3">
<h3>2. Функція above(x, n), яка приймає вектор та число n, та повертає всі елементі вектору, які більше n.&nbsp;По замовчуванню n = 10.</h3>
<pre class="r"><code class="hljs">above &lt;-<span class="hljs-keyword">function</span>(x,n){
  r &lt;- x[x&gt;n]
  print (r)
}
above(<span class="hljs-number">8</span>:<span class="hljs-number">12</span>,<span class="hljs-number">10</span>)</code></pre>
<pre><code class="hljs">## [1] 11 12</code></pre>
</div>
<div id="функція-my_ifelsex-exp-n-яка-приймає-вектор-x-порівнює-всі-його-елементи-за-допомогою-exp-з-n-та-повертає-елементи-вектору-які-відповідають-умові-expression.-наприклад-my_ifelsex-0-повертає-всі-елементи-x-які-більші-0.-exp-може-дорівнювати-.-якщо-exp-не-співпадає-ні-з-одним-з-цих-виразів-повертається-вектор-x." class="section level3">
<h3>3. Функція my_ifelse(x, exp, n), яка приймає вектор x, порівнює всі його елементи за допомогою exp з n, та повертає елементи вектору, які відповідають умові expression. Наприклад, my_ifelse(x, “&gt;”, 0) повертає всі елементи x, які більші 0. Exp може дорівнювати “&lt;”, “&gt;”, “&lt;=”, “&gt;=”, “==”. Якщо exp не співпадає ні з одним з цих виразів, повертається вектор x.</h3>
<pre class="r"><code class="hljs">my_ifelse &lt;- <span class="hljs-keyword">function</span>(x, exp, n){
  <span class="hljs-keyword">if</span> (exp==<span class="hljs-string">"&lt;"</span>){ 
    r &lt;- x[x&lt;n] 
    print(r) }
  <span class="hljs-keyword">else</span> <span class="hljs-keyword">if</span>(exp==<span class="hljs-string">"&lt;="</span>){ r &lt;- x[x&lt;=n]
  print(r)}
  <span class="hljs-keyword">else</span> <span class="hljs-keyword">if</span>(exp==<span class="hljs-string">"&gt;="</span>){ r &lt;- x[x&gt;=n]
  print(r)}
  <span class="hljs-keyword">else</span> <span class="hljs-keyword">if</span>(exp==<span class="hljs-string">"&gt;"</span>){ r &lt;- x[x&gt;n]
  print(r)}
  
  <span class="hljs-keyword">else</span> print(x)
}
my_ifelse(<span class="hljs-number">8</span>:<span class="hljs-number">12</span>,<span class="hljs-string">"&lt;"</span>,<span class="hljs-number">10</span>)</code></pre>
<pre><code class="hljs">## [1] 8 9</code></pre>
<pre class="r"><code class="hljs">my_ifelse(<span class="hljs-number">8</span>:<span class="hljs-number">12</span>,<span class="hljs-string">"&lt;="</span>,<span class="hljs-number">10</span>)</code></pre>
<pre><code class="hljs">## [1]  8  9 10</code></pre>
<pre class="r"><code class="hljs">my_ifelse(<span class="hljs-number">8</span>:<span class="hljs-number">12</span>,<span class="hljs-string">"&gt;"</span>,<span class="hljs-number">10</span>)</code></pre>
<pre><code class="hljs">## [1] 11 12</code></pre>
<pre class="r"><code class="hljs">my_ifelse(<span class="hljs-number">8</span>:<span class="hljs-number">12</span>,<span class="hljs-string">"&gt;="</span>,<span class="hljs-number">10</span>)</code></pre>
<pre><code class="hljs">## [1] 10 11 12</code></pre>
<pre class="r"><code class="hljs">my_ifelse(<span class="hljs-number">8</span>:<span class="hljs-number">12</span>,<span class="hljs-string">"ttt"</span>,<span class="hljs-number">10</span>)</code></pre>
<pre><code class="hljs">## [1]  8  9 10 11 12</code></pre>
</div>
<div id="функція-columnmeanx-removena-яка-розраховує-середнє-значення-mean-по-кожному-стовпцю-матриці-або-data-frame.-логічний-параметр-removena-вказує-чи-видаляти-na-значення.-по-замовчуванню-він-дорівнює-true." class="section level3">
<h3>4. Функція columnmean(x, removeNA), яка розраховує середнє значення (mean) по кожному стовпцю матриці, або data frame. Логічний параметр removeNA вказує, чи видаляти NA значення. По замовчуванню він дорівнює TRUE.</h3>
<pre class="r"><code class="hljs">x &lt;- data.frame(a = <span class="hljs-number">1</span>:<span class="hljs-number">4</span>, b = <span class="hljs-number">1</span>,<span class="hljs-literal">NA</span>,<span class="hljs-number">2</span>,<span class="hljs-literal">NA</span>) 
bad &lt;- is.na(x)
columnmean &lt;- <span class="hljs-keyword">function</span>(x, removeNA = <span class="hljs-literal">TRUE</span>){
<span class="hljs-keyword">if</span> (removeNA == <span class="hljs-literal">FALSE</span>){ na.rm = <span class="hljs-literal">FALSE</span>
  mean(x)}
  <span class="hljs-keyword">else</span> mean(x[!bad])
}
columnmean(x, <span class="hljs-literal">TRUE</span>)</code></pre>
<pre><code class="hljs">## [1] 1.833333</code></pre>
<pre class="r"><code class="hljs">columnmean(x)</code></pre>
<pre><code class="hljs">## [1] 1.833333</code></pre>
<pre class="r"><code class="hljs">columnmean(x, <span class="hljs-literal">FALSE</span>)</code></pre>
<pre><code class="hljs">## Warning in mean.default(x): argument is not numeric or logical: returning NA</code></pre>
<pre><code class="hljs">## [1] NA</code></pre>
</div>
</div>




</div>















