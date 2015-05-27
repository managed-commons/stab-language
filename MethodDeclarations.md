# Method declaration #
The syntax to declare a method is specified by:
<pre>_<br>
method-declaration:<br>
annotationsopt method-modifiersopt *partial* return-type identifier type-parameter-listopt *(* formal-parameter-listopt *)*<br>
type-parameter-constraints-clausesopt method-body<br>
_</pre>
<pre>_<br>
method-body:<br>
block<br>
*;*<br>
_</pre>

# Method modifiers #
The method modifiers in Stab have the same usage and semantic as in Java. Without modifiers, a method is considered to be `final`. The `virtual` modifier must be explicitly specified to declare a virtual method. The `override` modifier must be explicitly specified to override a virtual method.
<pre>_<br>
method-modifiers:<br>
method-modifier<br>
method-modifiers method-modifier<br>
<br>
method-modifier:<br>
*One of public protected private final abstract virtual override static synchronized native strictfp*<br>
_</pre>

# Method parameters #
This production of the grammar is also used to parse the parameters of constructors, indexers and delegates.
<pre>_<br>
formal-parameter-list:<br>
fixed-parameters<br>
this-parameter fixed-parameters<br>
fixed-parameters *,* parameter-array<br>
this-parameter fixed-parameters *,* parameter-array<br>
parameter-array<br>
<br>
fixed-parameters:<br>
fixed-parameter<br>
fixed-parameters *,* fixed-parameter<br>
<br>
fixed-parameter:<br>
annotationsopt type identifier<br>
<br>
this-parameter:<br>
annotationsopt *this* type identifier<br>
<br>
parameter-array:<br>
annotationsopt *params* array-type identifier<br>
_</pre>

## This parameter ##
A parameter prefixed by `this` is used to declare an extension method.
An extension method is a static method which can be called using the instance method call syntax:
```
using java.lang;
static class Strings {
    static String capitalize(this String s) {
        return Character.toUpperCase(s[0]) + s.substring(1);
    }
}
public class Test {
    public static void main(String[] args) {
        System.out.println(args[0].capitalize());
    }
}
```

## Parameter array ##
A parameter prefixed with **params** allows a method to be called with a variable number of arguments:
```
using java.lang;
class Test {
    static String concat(params String[] strings) {
        var sb = new StringBuilder();
        foreach (var s in strings) {
            sb.append(s);
        }
        return sb.toString();
    }
    public static void main(String[] args) {
        System.out.println(concat("a", "b", "c"));
    }
}
```