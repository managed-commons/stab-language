

# Class declaration #
The syntax to declare a class is specified by:
<em><pre>
class-declaration:<br>
annotationsopt class-modifiersopt *partial*opt *class* identifier type-parameter-listopt type-baseopt<br>
type-parameter-constraints-clausesopt class-body *;*opt<br>
</pre></em>

# Class modifiers #
The class modifiers in Stab have the same usage and semantic as the class modifiers in Java, except the `static` modifier which means that a class is the container of extension methods.
<em><pre>
class-modifiers:<br>
class-modifier<br>
class-modifiers class-modifier<br>
<br>
class-modifier:<br>
*One of public protected private abstract final static*<br>
</pre></em>

# Type parameter list #
The type parameter list specifies the type parameters of a generic type.
<em><pre>
type-parameter-list:<br>
*<* identifier-list *>*<br>
<br>
identifier-list:<br>
identifier<br>
identifier-list *,* identifier<br>
</pre></em>
For example:
```
class C<T, U> {}
```

# Type base specification #
The type base specification is the base class followed by the implemented interfaces. If the base class is omitted, the superclass is `java.lang.Object`.
<em><pre>
type-base:<br>
*:* type-list<br>
<br>
type-list:<br>
class-type<br>
type-list *,* class-type<br>
</pre></em>
For example:
```
class A {}
interface B {}
class C : A, B {} // C extends A and implements B
```

# Type parameter constraints clauses #
The type parameter constraints clauses defines the base types of the type parameters of the class.
<em><pre>
type-parameter-constraints-clauses:<br>
type-parameter-constraints-clause<br>
type-parameter-constraints-clauses type-parameter-constraints-clause<br>
<br>
type-parameter-constraints-clause:<br>
*where* identifier *:* type-base<br>
</pre></em>
The type parameter of a generic class can be constrained to implement `java.lang.Runnable` the following way:
```
using java.lang;
class C<T> where T : Runnable {}
```

# Class body #
The class body is the place where the members of a class are declared.
<em><pre>
class-body:<br>
*{* class-member-declarationsopt *}*<br>
<br>
class-member-declarations:<br>
class-member-declaration<br>
class-member-declarations class-member-declaration<br>
<br>
class-member-declaration:<br>
field-declaration<br>
method-declaration<br>
property-declaration<br>
indexer-declaration<br>
constructor-declaration<br>
destructor-declaration<br>
static-constructor-declaration<br>
class-declaration<br>
interface-declaration<br>
enum-declaration<br>
delegate-declaration<br>
</pre></em>