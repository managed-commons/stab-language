# Interface indexer declaration #
The syntax to declare a indexer in an interface is specified by:
<em><pre>
interface-property-declaration:<br>
annotationsopt type *this* [ formal-parameter-list ] *{* interface-accessors *}*<br>
</pre></em>
The specified accessors are implicitly `public` and `abstract`.

Some valid indexer declarations:
```
using java.lang;
interface A {
    int this[int i] { get; }
    String this[String s] { get; set; }
    String this[int i, String s] { set; }
}
```