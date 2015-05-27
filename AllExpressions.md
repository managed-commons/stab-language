

# Expressions #
The grammar of expressions is specified by the following production:
<pre>_<br>
expression:<br>
lambda-expression<br>
assignment-expression<br>
conditional-expression<br>
query-expression<br>
_</pre>

## Lambda expressions ##
A lambda expression defines is a concise syntax to define delegates, simple interfaces or expression trees.
<pre>_<br>
lambda-expression:<br>
lambda-signature *=>* expression<br>
lambda-signature *=>* block<br>
_</pre>
<pre>_<br>
lambda-signature:<br>
*(* explicit-lambda-parameter-listopt *)*<br>
*(* identifier-listopt *)*<br>
identifier<br>
_</pre>
<pre>_<br>
explicit-lambda-parameter-list:<br>
explicit-lambda-parameter<br>
explicit-lambda-parameter-list *,* explicit-lambda-parameter<br>
_</pre>
<pre>_<br>
explicit-lambda-parameter:<br>
type identifier<br>
_</pre>

## Assignment expressions ##
An assignment expression modify the value of a variable or the value of a property.
<pre>_<br>
assignment-expression:<br>
unary-expression assignment-operator expression<br>
_</pre>
<pre>_<br>
assignment-operator:<br>
*One of: = += -= *= /= %= &= |= ^= <<= >>= >>>=*<br>
_</pre>

## Conditional expressions ##
A conditional expression evaluates an expression based on the value of a boolean expression.
<pre>_<br>
conditional-expression:<br>
null-coalescing-expression<br>
null-coalescing-expression *?* expression *:* expression<br>
_</pre>

## Null coalescing expressions ##
A null coalescing expression returns the evaluation of a first expression if non-null, otherwise the evaluation of a second expression.
<pre>_<br>
null-coalescing-expression:<br>
conditional-or-expression<br>
conditional-or-expression *??* null-coalescing-expression<br>
_</pre>

## Conditional or expressions ##
A conditional or expression returns the evaluation of a first boolean expression if true, otherwise the evaluation of a second expression.
<pre>_<br>
conditional-or-expression:<br>
conditional-and-expression<br>
conditional-or-expression *||* conditional-and-expression<br>
_</pre>

## Conditional and expressions ##
A conditional and expression returns the evaluation of a first boolean expression if false, otherwise the evaluation of a second expression.
<pre>_<br>
conditional-and-expression:<br>
inclusive-or-expression<br>
conditional-and-expression *&&* inclusive-or-expression<br>
_</pre>

## Inclusive or expressions ##
An inclusive or expression returns true if one of the boolean expression operands evaluates to true. If operands are of an integral type, a bitwise operation is performed.
<pre>_<br>
inclusive-or-expression:<br>
exclusive-or-expression<br>
inclusive-or-expression *|* exclusive-or-expression<br>
_</pre>

## Exclusive or expressions ##
An exclusive or expression returns true if the boolean expression operands evaluates to the different values. If operands are of an integral type, a bitwise operation is performed.
<pre>_<br>
exclusive-or-expression:<br>
and-expression<br>
exclusive-or-expression *^* and-expression<br>
_</pre>

## And expressions ##
The and expression returns true if both boolean expression operands evaluates to true. If operands are of an integral type, a bitwise operation is performed.
<pre>_<br>
and-expression:<br>
equality-expression<br>
and-expression *&* equality-expression<br>
_</pre>

## Equality expressions ##
An equality expression tests whether operand expressions are considered equal or different.
<pre>_<br>
equality-expression:<br>
relational-expression<br>
equality-expression *==* relational-expression<br>
equality-expression *!=* relational-expression<br>
_</pre>

## Relational expressions ##
A relational expression tests the order relation of operand expressions. When the operator is `instanceof` or `as` the left operand is compared to a specified type.
<pre>_<br>
relational-expression:<br>
shift-expression<br>
relational-expression *<* shift-expression<br>
relational-expression *>* shift-expression<br>
relational-expression *<=* shift-expression<br>
relational-expression *>=* shift-expression<br>
relational-expression *instanceof* type<br>
relational-expression *as* type<br>
_</pre>

## Shift expressions ##
A shift expression is used to shift the bits of an integral type.
<pre>_<br>
shift-expression:<br>
additive-expression<br>
shift-expression *<<* additive-expression<br>
shift-expression *>>* additive-expression<br>
shift-expression *>>>* additive-expression<br>
_</pre>

## Additive expressions ##
An additive expression adds or subtracts numeric types or delegate types. The addition is also used to build strings.
<pre>_<br>
additive-expression:<br>
multiplicative-expression<br>
additive-expression *+* multiplicative-expression<br>
additive-expression *-* multiplicative-expression<br>
_</pre>

## Multiplicative expressions ##
A multiplicative expression multiplies or divides numeric types.
<pre>_<br>
multiplicative-expression:<br>
unary-expression<br>
multiplicative-expression *** unary-expression<br>
multiplicative-expression */* unary-expression<br>
multiplicative-expression *%* unary-expression<br>
_</pre>

## Unary expression ##
An unary expression applies an unary operator to an expression.
<pre>_<br>
unary-expression:<br>
primary-expression<br>
*+* unary-expression<br>
*-* unary-expression<br>
*!* unary-expression<br>
*~* unary-expression<br>
*(* type *)* unary-expression<br>
pre-decrement-expression<br>
pre-increment-expression<br>
_</pre>
<pre>_<br>
pre-decrement-expression:<br>
*--* unary-expression<br>
_</pre>
<pre>_<br>
pre-increment-expression:<br>
*++* unary-expression<br>
_</pre>

## Primary expressions ##
A primary expression is the building block or more complex expressions.
<pre>_<br>
primary-expression:<br>
no-array-creation-expression<br>
*new* array-dimensions array-initializer<br>
*new* type array-sizes array-dimensionsopt array-initializeropt<br>
_</pre>
<pre>_<br>
array-dimensions:<br>
*[ ]*<br>
array-dimensions *[ ]*<br>
_</pre>
<pre>_<br>
array-sizes:<br>
*[* expression *]*<br>
array-sizes *[* expression *]*<br>
_</pre>
<pre>_<br>
array-initializer:<br>
*{* expression-listopt *}*<br>
*{* expression-list ,opt *}*<br>
_</pre>
<pre>_<br>
no-array-creation-expression:<br>
literal<br>
identifier type-argument-listopt<br>
*(* expression *)*<br>
primary-expression *.* identifier type-argument-listopt<br>
class-name *.* identifier type-argument-listopt<br>
primary-expression *(* argument-listopt *)*<br>
no-array-creation-expression *[* argument-list *]*<br>
*this*<br>
*super .* identifier<br>
*super [* argument-list *]*<br>
*new* type *(* argument-listopt *)* object-or-collection-initializeropt<br>
*new* type object-or-collection-initializer<br>
*new* anonymous-object-initializer<br>
*typeof (* type *)*<br>
*typeof ( void )*<br>
*sizeof (* expression *)*<br>
post-decrement-expression<br>
post-increment-expression<br>
_</pre>
<pre>_<br>
object-or-collection-initializer:<br>
object-initializer<br>
collection-initializer<br>
_</pre>
<pre>_<br>
object-initializer:<br>
*{* member-initializer-listopt *}*<br>
*{* member-initializer-list *,*opt *}*<br>
_</pre>
<pre>_<br>
member-initializer-list:<br>
member-initializer<br>
member-initializer-list *,* member-initializer<br>
_</pre>
<pre>_<br>
member-initializer:<br>
identifier *=* expression<br>
identifier *=* object-or-collection-initializer<br>
_</pre>
<pre>_<br>
collection-initializer:<br>
*{* element-initializer-listopt *}*<br>
*{* element-initializer-list *,*opt *}*<br>
_</pre>
<pre>_<br>
element-initializer-list:<br>
element-initializer<br>
element-initializer-list *,* element-initializer<br>
_</pre>
<pre>_<br>
element-initializer:<br>
conditional-expression<br>
lambda-expression<br>
query-expression<br>
*{* expression-list *}*<br>
_</pre>
<pre>_<br>
expression-list:<br>
expression<br>
expression-list *,* expression<br>
_</pre>
<pre>_<br>
post-decrement-expression:<br>
unary-expression *--*<br>
_</pre>
<pre>_<br>
post-increment-expression:<br>
unary-expression *++*<br>
_</pre>
<pre>_<br>
argument-list:<br>
expression<br>
argument-list *,* expression<br>
_</pre>

### Literals ###
Literals are used to represent values directly.
<pre>_<br>
literal:<br>
*true*<br>
*false*<br>
*null*<br>
integer-literal<br>
real-literal<br>
character-literal<br>
string-literal<br>
_</pre>

### Anonymous object creation ###
Anonymous objects are simple objects specified and created directly inside a method.
<pre>_<br>
anonymous-object-initializer:<br>
*{* member-declarator-listopt *}*<br>
*{* member-declarator-list *,*opt *}*<br>
_</pre>
<pre>_<br>
member-declarator-list:<br>
member-declarator<br>
member-declarator-list *,* member-declarator<br>
_</pre>
<pre>_<br>
member-declarator:<br>
identifier<br>
primary-expression *.* identifier<br>
class-name *.* identifier<br>
_</pre>
In the example
```
var obj1 = new { Name = "Smith", Age = 30 };
var obj2 = new { obj1.Name, Age = 40 };
var obj3 = new { obj2.Name, obj1.Age };
```
a single class is automatically created by the compiler because all three objects have the same properties defined in the same order:
```
using java.lang;
class C {
    C(String name, int age) {
        this.Name = name;
        this.Age = age;
    }

    public String Name { get; private set; }
    public int Age { get; private set; }

    public override boolean equals(Object obj) {
        if (!(obj instanceof C)) return false;
        C other = (C)obj;
        if (!this.Name.equals(other.Name)) return false;
        if (this.Age != other.Age) return false;
        return true;
    }
    public override int hashCode() {
        int result = this.Name.hashCode();
        result ^= this.Age;
        return result;
    }
}
```
where `C` is an inaccessible generated name.
`equals` and `hashCode` are overriden in order to be able to compare anonymous object instances.

### `typeof` expressions ###
A `typeof` expression retrieves the runtime class of the evaluation of an expression.
```
var c = typeof(java.lang.String);
```
is equivalent to the Java code:
```
Class<String> c = String.class;
```

### `sizeof` expressions ###
A `sizeof` expression computes the number of elements of an array.
In the example
```
var size = sizeof(new int[3]);
```
the value of `size` is 3.
It is equivalent to the Java code:
```
int size = (new int[3]).length;
```