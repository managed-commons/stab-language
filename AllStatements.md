

# Statements #
The production of the grammar representing statements is:
<pre>_<br>
statement:<br>
labeled-statement<br>
local-declaration-statement<br>
embedded-statement<br>
<br>
embedded-statement:<br>
block<br>
empty-statement<br>
expression-statement<br>
if-statement<br>
switch-statement<br>
while-statement<br>
do-statement<br>
for-statement<br>
foreach-statement<br>
break-statement<br>
continue-statement<br>
goto-statement<br>
return-statement<br>
throw-statement<br>
try-statement<br>
synchronized-statement<br>
using-statement<br>
yield-statement<br>
_</pre>
<pre>_<br>
statement-list:<br>
statement<br>
statement-list statement<br>
_</pre>

## Labeled statements ##
A label can be added to a statement. This label can be used by a `goto` statement to transfer control to this statement.
<pre>_<br>
labeled-statement:<br>
identifier *:* statement<br>
_</pre>

## Local declaration statements ##
The local declaration statement is used to declare and optionally initialize one or more local variables.
<pre>_<br>
local-declaration-statement:<br>
type local-declarators *;*<br>
*var* identifier *=* local-initializer *;*<br>
_</pre>
<pre>_<br>
local-declarators:<br>
local-declarator<br>
local-declarators *,* local-declarator<br>
_</pre>
<pre>_<br>
local-declarator:<br>
identifier<br>
identifier *=* local-initializer<br>
_</pre>
<pre>_<br>
local-initializer:<br>
expression<br>
array-initializer<br>
_</pre>

## Block statements ##
The block statement is used where a statement is required to perform multiple actions.
<pre>_<br>
block:<br>
*{* statement-listopt *}*<br>
_</pre>

## Empty statements ##
The empty statement is used where a statement is required but no actions have to be performed.
<pre>_<br>
empty-statement:<br>
*;*<br>
_</pre>

## Expression statements ##
The expression statement is used where a statement is required to evaluate an expression. Only method calls and assignments are allowed.
<pre>_<br>
expression-statement:<br>
invocation-expression<br>
object-creation-expression<br>
assignement<br>
post-decrement-expression<br>
post-increment-expression<br>
pre-decrement-expression<br>
pre-increment-expression<br>
_</pre>

## `if` statements ##
The `if` statement execute a statement based on the evaluation of a boolean expression.
<pre>_<br>
if-statement:<br>
*if (* expression *)* embedded-statement<br>
*if (* expression *)* embedded-statement *else* embedded-statement<br>
_</pre>

## `switch` statements ##
The `switch` statement executes a statement based on the evaluation of an ordinal or string expression.
<pre>_<br>
switch-statement:<br>
*switch (* expression *) {* switch-sectionsopt *}*<br>
_</pre>
<pre>_<br>
switch-sections:<br>
switch-section<br>
switch-sections switch-section<br>
_</pre>
<pre>_<br>
switch-section:<br>
switch-labels statement-list<br>
_</pre>
<pre>_<br>
switch-labels:<br>
switch-label<br>
switch-labels switch-label<br>
_</pre>
<pre>_<br>
switch-label:<br>
*case* expression *:*<br>
*default :*<br>
_</pre>

The following code:
```
void m(String s) {
    switch (s) {
    case "A":
    case "B":
        System.out.println("A or B");
        break;
    case "C":
        System.out.println("C");
        break;
    }
}
```
is equivalent to:
```
void m(String s) {
    var tmp = s;
    if (tmp.equals("A") || tmp.equals("B")) {
        System.out.println("A or B");
    } else if (tmp.equals("C")) {
        System.out.println("C");
    }
}
```

When the number of case is greater or equal to 7:
```
void m(String s) {
    switch (s) {
    case "A":
    case "B":
        System.out.println("A or B");
        break;
    case "C":
        System.out.println("C");
        break;
    case "D":
    case "E":
    case "F":
        System.out.println("D or E or F");
        break;
    case "G":
        System.out.println("G");
        break;
    }
}
```
the code is equivalent to:
```
private static HashMap<String, Integer> switchCases;
void m(String s) {
    var map = switchCases;
    if (map == null) {
        map = new HashMap<String, Integer>();
        map["A"] = Integer.valueOf(0);
        map["B"] = Integer.valueOf(1);
        map["C"] = Integer.valueOf(2);
        map["D"] = Integer.valueOf(3);
        map["E"] = Integer.valueOf(4);
        map["F"] = Integer.valueOf(5);
        map["G"] = Integer.valueOf(6);
        switchCases = map;
    }
    switch (map[s].intValue()) {
    case 0:
    case 1:
        System.out.println("A or B");
        break;
    case 2:
        System.out.println("C");
        break;
    case 3:
    case 4:
    case 5:
        System.out.println("D or E or F");
        break;
    case 6:
        System.out.println("G");
        break;
    }
}
```

## `while` statements ##
The `while` statement executes repeatedly a statement based on the evaluation of a boolean expression.
<pre>_<br>
while-statement:<br>
*while (* expression *)* embedded-statement<br>
_</pre>

## `do` statements ##
The `do` statement executes one or more times a statement based on the evaluation of boolean expression.
<pre>_<br>
do-statement:<br>
*do* embedded-statement *while (* expression *);*<br>
_</pre>

## `for` statements ##
The `for` statement executes an initialization statement and then execute repeatedly a statement and an iterator statement based on the evaluation of a boolean expression.
<pre>_<br>
for-statement:<br>
*for (* local-declaration-statementopt *;* expressionopt *;* expression-statement-listopt *)* embedded-statement<br>
_</pre>
<pre>_<br>
expression-statement-list:<br>
expression-statement<br>
expression-statement-list expression-statement<br>
_</pre>

## `foreach` statements ##
The `foreach` statements executes a statement for each element of an array, or for each value of an instance of `java.lang.Iterable<T>`.
<pre>_<br>
foreach-statement:<br>
*foreach (* type identifier *in* expression *)* embedded-statement<br>
*foreach ( var* identifier *in* expression *)* embedded-statement<br>
_</pre>

## `break` statements ##
The `break` statement transfers control just after the most nested enclosing loop or `switch`.
<pre>_<br>
break-statement:<br>
*break ;*<br>
_</pre>

## `continue` statements ##
The `continue` statement ends the current iteration of the most nested enclosing loop.
<pre>_<br>
continue-statement:<br>
*continue ;*<br>
_</pre>

## `goto` statements ##
The `goto` statement transfers control to a label. `goto case` and `goto default` forms transfer control inside the most nested enclosing `switch`.
<pre>_<br>
goto-statement:<br>
*goto* identifier *;*<br>
*goto case* expression *;*<br>
*goto default*<br>
_</pre>

## `return` statements ##
A `return` statement sets the result, if any, of the current method and stops its execution. Control is transfered to the caller of the method.
<pre>_<br>
*return* expressionopt *;*<br>
_</pre>

## `throw` statements ##
The `throw` statement throws an exception. The short form of the statement must be called inside a `catch` block to throw the handled exception.
<pre>_<br>
throw-statement:<br>
*throw* expressionopt *;*<br>
_</pre>

## `try` statements ##
The `try` statement is used to handle exceptions.
<pre>_<br>
try-statement:<br>
*try* block catch-clauses<br>
*try* block *finally* block<br>
*try* block catch-clauses *finally* block<br>
_</pre>
<pre>_<br>
catch-clauses:<br>
specific-catch-clauses general-catch-clauseopt<br>
specific-catch-clausesopt general-catch-clause<br>
_</pre>
<pre>_<br>
specific-catch-clauses:<br>
specific-catch-clause<br>
specific-catch-clauses specific-catch-clause<br>
_</pre>
<pre>_<br>
specific-catch-clause:<br>
*catch (* class-type identifieropt *)* block<br>
_</pre>
<pre>_<br>
general-catch-clause:<br>
*catch* block<br>
_</pre>

## `synchronized` statements ##
The `synchronized` statement obtains a mutual-exclusion lock, executes a statement and release the lock.
<pre>_<br>
synchronized-statement:<br>
*synchronized (* expression *)* embedded-statement<br>
_</pre>

## `using` statements ##
The `using` statement executes a statement and release some specified resources.
<pre>_<br>
using-statement:<br>
*using (* local-declaration-statement *)* embedded-statement<br>
*using (* expression *)* embedded-statement<br>
_</pre>
The compiler use the `stab.lang.Dispose` annotation to determine which method must be called to dispose the object. The compiler is shipped with a library that adds this annotation to `java.io.Closeable` (see [StabCompiler#annotatedlibs](StabCompiler#annotatedlibs.md)).

The code sample:
```
int c;
using (var reader = new FileReader("file.txt")) {
    c = reader.read();
}
```
is equivalent to:
```
int c;
var reader = new FileReader("file.txt");
try {
    c = reader.read();
} finally {
    if (reader != null) reader.close();
}
```
## `yield` statements ##
A `yield return` statement sets the value of an iteration inside an iterator block. A `yield break` statement exits the iterator block. Both `java.lang.Iterable<T>` and `java.util.Iterator<T>` can be returned by an iterator block.
<pre>_<br>
yield-statement:<br>
*yield return* expression *;*<br>
*yield break ;*<br>
_</pre>

For example to declare a method which returns the elements of a list of strings in reverse order in an Iterable, just write:
```
public Iterable<String> reverse(List<String> list) {
    for (int i = list.size() - 1; i >= 0; --i) {
        yield return list.get(i);
    }
}
```

Support of primitive type iterators are supported by using `stab.lang.IntIterable`, `stab.lang.DoubleIterable`, etc...

This method provides an iterator over a range of integer values without involving any boxing/unboxing:
```
    IntIterable range(int start, int count) {
        while (count-- > 0) {
            yield return start++;
        }
    }
```

It can then be used as the source iterator of a `foreach` statement:
```
    foreach (var i in range(0, 10)) {
        System.out.println("i = " + i);
    }
```