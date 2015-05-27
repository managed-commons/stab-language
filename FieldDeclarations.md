# Field declaration #
The syntax to declare a field is specified by:
<pre>_<br>
field-declaration:<br>
annotationsopt field-modifiersopt type variable-declarators *;*<br>
_</pre>
<pre>_<br>
variable-declarators:<br>
variable-declarator<br>
variable-declarators *,* variable-declarator<br>
<br>
variable-declarator:<br>
identifier<br>
identifier *=* expression<br>
identifier *=* array-initializer<br>
_</pre>

# Field modifiers #
The field modifiers in Stab have the same usage and semantics as in Java.
<pre>_<br>
field-modifiers:<br>
field-modifier<br>
field-modifiers field-modifier<br>
<br>
field-modifier:<br>
*One of public protected private final static transient volatile*<br>
_</pre>