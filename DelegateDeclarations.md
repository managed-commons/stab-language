# Delegate declaration #
The syntax to declare a delegate is specified by:
<em><pre>
delegate-declaration:<br>
annotationsopt delegate-modifiersopt *delegate* return-type identifier type-parameter-listopt *(* formal-parameter-listopt *)*<br>
type-parameter-constraints-clausesopt ;<br>
</pre></em>
A delegate type is an abstract class derived from `stab.lang.Delegate`. It defines an abstract method named `invoke` with the same signature as the delegate.

# Delegate modifiers #
The delegate modifiers control the access to the type. Only nested delegates can be `protected` or `private`.
<em><pre>
delegate-modifiers:<br>
delegate-modifier<br>
delegate-modifiers delegate-modifier<br>
<br>
delegate-modifier:<br>
*One of public protected private*<br>
</pre></em>