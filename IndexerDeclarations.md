# Indexer declaration #
The syntax to declare an indexer is specified by:
<pre>_<br>
indexer-declaration:<br>
annotationsopt property-modifiersopt type *this [* formal-parameter-list *] {* accessor-declarations *}*<br>
_</pre>

The sample:
```
public class C {
    private double[] table;
    public double this[int i] {
        get {
            return table[i];
        }
        protected set {
            table[i] = value;
        }
    }
}
```
is equivalent to the following Java program:
```
public class C {
    private double[] table;
    @stab.lang.IndexerGet
    public final double getItem(int i) {
        return table[i];
    }
    @stab.lang.IndexerSet
    protected final void setItem(int i, double value) {
        table[i] = value;
    }
}
```