# Constructor declaration #
The syntax to declare a constructor is specified by:
<em><pre>
constructor-declaration:<br>
annotationsopt constructor-modifiersopt identifier type-parameter-listopt *(* formal-parameter-listopt *)*<br>
constructor-initializeropt type-parameter-constraints-clausesopt constructor-body<br>
</pre></em>
<em><pre>
constructor-body:<br>
block<br>
*;*<br>
</pre></em>

# Constructor modifiers #
The constructor modifiers in Stab have the same usage and semantics that the constructor modifiers in Java.
<em><pre>
constructor-modifiers:<br>
constructor-modifier<br>
constructor-modifiers constructor-modifier<br>
<br>
constructor-modifier:<br>
*One of public protected private synchronized native strictfp*<br>
</pre></em>
# Constructor initializer #
The constructor initializer is used to call a base constructor or a constructor of this class.
<pre>_<br>
constructor-initializer:<br>
*: super (* argument-listopt *)*<br>
*: this (* argument-listopt *)*<br>
_</pre>
For example:
```
class A {
    A(int i) {}
}
class B : A {
    B(int i) : super(i) {}
    B() : this(0) {}
}
```