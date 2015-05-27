# Destructor declaration #
The syntax to declare a destructor is specified by:
<em><pre>
destructor-declaration:<br>
annotationsopt ~ identifier *( )* block<br>
</pre></em>
Declaring a destructor in a Stab class:
```
using java.lang;
class C {
    ~C() {
        System.out.println("C finalization");
    }
}
```
is equivalent to the Java code:
```
class C {
    protected void finalize() {
        try {
            System.out.println("C finalization");
        } finally {
            super.finalize();
        }
    }
}
```