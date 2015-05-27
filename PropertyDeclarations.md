# Property declaration #
The syntax to declare a property is specified by:
<pre>_<br>
property-declaration:<br>
annotationsopt property-modifiersopt type identifier *{* accessor-declarations *}*<br>
_</pre>

# Property modifiers #
<pre>_<br>
property-modifiers:<br>
property-modifier<br>
property-modifiers property-modifier<br>
<br>
property-modifier:<br>
*One of public protected private synchronized native strictfp final abstract virtual override static*<br>
_</pre>
Each accessor can be declared with a more restrictive accessibility than the property:
<pre>_<br>
accessor-modifiers:<br>
accessor-modifier<br>
accessor-modifiers accessor-modifier<br>
<br>
accessor-modifier:<br>
*One of public protected private*<br>
_</pre>

# Accessor declarations #
<pre>_<br>
accessor-declarations:<br>
get-accessor-declaration set-accessor-declarationopt<br>
set-accessor-declaration get-accessor-declarationopt<br>
<br>
get-accessor-declaration:<br>
annotationsopt accessor-modifiersopt *get* accessor-body<br>
<br>
set-accessor-declaration:<br>
annotationsopt accessor-modifiersopt *set* accessor-body<br>
<br>
accessor-body:<br>
block<br>
;<br>
_</pre>

The sample:
```
public class C {
    private int prop;
    public int Prop {
        get {
            return prop;
        }
        protected set {
            prop = value;
        }
    }
}
```
is equivalent to the program with an automatically implemented property:
```
public class C {
    public int Prop {
        get;
        protected set;
    }
}
```
In this case the compiler generates a private inaccessible field.

The previous examples are equivalent to the following Java program:
```
public class C {
    private int prop;
    @stab.lang.PropertyGet
    public final int getProp() {
        return prop;
    }
    @stab.lang.PropertySet
    protected final void setProp(int value) {
        prop = value;
    }
}
```