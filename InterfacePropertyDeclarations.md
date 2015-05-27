# Interface property declaration #
The syntax to declare a property in an interface is specified by:
<em><pre>
interface-property-declaration:<br>
annotationsopt type identifier *{* interface-accessors *}*<br>
</pre></em>
<em><pre>
interface-accessors:<br>
annotationsopt *get ;*<br>
annotationsopt *set ;*<br>
annotationsopt *get ;* annotationsopt *set ;*<br>
annotationsopt *set ;* annotationsopt *get ;*<br>
</pre></em>
The specified accessors are implicitly `public` and `abstract`.

Some valid property declarations:
```
interface A {
    int P1 { get; } // read-only
    long P2 { get; set; } // read-write
    A P3 { set; } // write-only
}
```