

# Enum declaration #
The syntax to declare an enum is specified by:
<em><pre>
enum-declaration:<br>
annotationsopt enum-modifiersopt *enum* identifier type-baseopt enum-body *;*opt<br>
</pre></em>
An enum is a special kind of class derived from `java.lang.Enum` and providing a special syntax to declare static fields of that type.

# Enum modifiers #
The enum modifiers in Stab have the same usage and semantic as the enum modifiers in Java.
<em><pre>
enum-modifiers:<br>
enum-modifier<br>
enum-modifiers enum-modifier<br>
<br>
enum-modifier:<br>
*One of public protected private*<br>
</pre></em>

# Enum body #
The enum body is the place where the members of an enum are declared.
<em><pre>
enum-body:<br>
*{* enum-constant-declarationsopt *,*opt enum-member-declarationsopt *}*<br>
</pre></em>
<em><pre>
enum-member-declarations:<br>
*;*opt class-member-declarations<br>
</pre></em>

## Enum constant declarations ##
An enum constant is a static field holding an instance of the enum type.
<em><pre>
enum-constant-declarations:<br>
enum-constant-declaration<br>
enum-constant-declarations *,* enum-constant-declaration<br>
<br>
enum-constant-declaration:<br>
annotationsopt identifier argument-listopt<br>
</pre></em>