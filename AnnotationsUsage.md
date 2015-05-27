# Annotations #
The syntax to annotate packages, types, type members or method parameters is specified by:
<pre>_<br>
annotations:<br>
annotation-section<br>
annotations annotation-section<br>
<br>
annotation-section:<br>
*[* annotation-list , opt *]*<br>
<br>
annotation-list:<br>
annotation<br>
annotation-list *,* annotation<br>
<br>
annotation:<br>
class-type annotation-argumentsopt<br>
<br>
annotation-arguments:<br>
*(* annotation-value *)*<br>
*(* annotation-named-values *)*<br>
<br>
annotation-named-values:<br>
annotation-named-value<br>
annotation-named-values *,* annotation-named-value<br>
_</pre>
<pre>_<br>
annotation-named-value:<br>
identifier *=* annotation-value<br>
_</pre>
Specifying a single unnamed argument:
```
[AnnotationType("Annotation value")]
```
is equivalent to:
```
[AnnotationType(value = "Annotation value")]
```

# Annotation values #
<pre>_<br>
annotation-value:<br>
conditional-expression<br>
annotation-section<br>
annotation-array-value<br>
<br>
annotation-array-value:<br>
*{* annotation-value-list , opt *}*<br>
<br>
annotation-value-list:<br>
annotation-value<br>
annotation-value-list *,* annotation-value<br>
_</pre>