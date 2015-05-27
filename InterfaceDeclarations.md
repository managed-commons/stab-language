

# Interface declaration #
The syntax to declare an interface is specified by:
<em><pre>
interface-declaration:<br>
annotationsopt interface-modifiersopt *interface* identifier type-parameter-listopt type-baseopt<br>
type-parameter-constraints-clausesopt interface-body *;*opt<br>
</pre></em>

# Interface modifiers #
The interface modifiers in Stab have the same usage and semantic as the interface modifiers in Java.
<em><pre>
interface-modifiers:<br>
interface-modifier<br>
interface-modifiers interface-modifier<br>
<br>
interface-modifier:<br>
*One of public protected private*<br>
</pre></em>

# Type base specification #
In the case of interfaces, the type base is a list of interfaces.

# Interface body #
The interface body is the place where the members of an interface are declared. Only methods, properties, and indexer can be declared.
<em><pre>
interface-body:<br>
*{* interface-member-declarationsopt *}*<br>
<br>
interface-member-declarations:<br>
interface-member-declaration<br>
interface-member-declarations interface-member-declaration<br>
<br>
interface-member-declaration:<br>
interface-method-declaration<br>
interface-property-declaration<br>
interface-indexer-declaration<br>
</pre></em>