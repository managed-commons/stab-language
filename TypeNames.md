# Type names #
The syntax to write a type name is specified by:
<pre>_<br>
type:<br>
primitive-type<br>
array-type<br>
type-name<br>
_</pre>
<pre>_<br>
class-type:<br>
type-name<br>
_</pre>
<pre>_<br>
primitive-type:<br>
*One of: boolean byte short char int long float double*<br>
_</pre>
<pre>_<br>
return-type:<br>
type<br>
*void*<br>
<br>
package-or-type-name:<br>
type-name<br>
_</pre>
<pre>_<br>
type-name:<br>
identifier type-argument-listopt<br>
type-name *.* identifier type-argument-listopt<br>
_</pre>
<pre>_<br>
type-argument-list:<br>
*<* type-arguments *>*<br>
_</pre>
<pre>_<br>
type-arguments:<br>
type-argument<br>
type-arguments *,* type-argument<br>
<br>
type-argument:<br>
array-type<br>
type-name<br>
type-name *: ?*<br>
*?*<br>
*? :* type-name<br>
<br>
array-type:<br>
non-array-type rank-specifiers<br>
<br>
non-array-type:<br>
primitive-type<br>
type-name<br>
_</pre>
<pre>_<br>
rank-specifiers:<br>
rank-specifier<br>
rank-specifiers rank-specifier<br>
_</pre>
<pre>_<br>
rank-specifier:<br>
[]<br>
_</pre>
Some examples of type names used to declare variables:
```
int v1; // an integer
char[] v2; // an array of characters
java.lang.Class<?> v3; // a class of any type
java.util.List<int[]> v4; // a list of arrays of integers
java.util.List<? : java.util.Date> v5; // a list of dates, or subclasses of dates
java.util.List<java.sql.Date : ?> v6; // a list of SQL dates, or superclasses of SQL dates
```