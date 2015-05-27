# Interface method declaration #
The syntax to declare a method in an interface is specified by:
<em><pre>
interface-method-declaration:<br>
annotationsopt return-type identifier type-parameter-listopt *(* formal-parameter-listopt *)*<br>
type-parameter-constraints-clausesopt default-valueopt *;*<br>
</pre></em>
The method is implicitly `public` and `abstract`.

# Default value #
When an interface implements `java.lang.annotation.Annotation`, the methods it introduces can declare a default value.
<pre>_<br>
default-value:<br>
*=* annotation-value<br>
_</pre>
For example:
```
interface Decoration : java.lang.annotation.Annotation {
    java.lang.String name() = "";
}
```
is equivalent to the Java code:
```
@interface Decoration {
    java.lang.String name() default "";
}
```