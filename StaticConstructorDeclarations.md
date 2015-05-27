# Static constructor declaration #
The syntax to declare a static constructor is specified by:
<em><pre>
static-constructor-declaration:<br>
annotationsopt *static* identifier ( ) block<br>
</pre></em>
Static constructors are mapped to the `<clinit>` method of the JVM. There is no restrictions on `final` field modifications in constructors.
```
class C {
    public final static int Field;
    static C() {
        int i = this.Field; // it is OK because all fields are initialized to 0
        this.Field++; // final fields can be modified without restrictions
    }
}
```