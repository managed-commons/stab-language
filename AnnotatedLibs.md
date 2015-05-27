# annotatedlibs command line option #

The [StabCompiler#annotatedlibs](StabCompiler#annotatedlibs.md) option can be used to add annotations to libraries written in Java, or only available in binary form.

This is done by creating classes or interfaces with the same name as the class to decorate, but with a naming convention on the package.

## Compiler annotations ##
The annotation recognized by the compiler are:
  * `stab.lang.PropertyGet`: mark a method as a property getter.
  * `stab.lang.PropertySet`: mark a method as a property setter.
  * `stab.lang.IndexerGet`: mark a method as an indexer getter.
  * `stab.lang.IndexerSet`: mark a method as an indexer setter.
  * `stab.lang.Dispose`: indicates that a method can be called to dispose an object at the end of a `using` statement.
  * `stab.lang.StaticClass` / `stab.lang.ExtensionMethod`: see the next section.

## Example: Using `org.apache.commons.lang.WordUtils.capitalize()` as an extension method ##

When the Stab compiler is generating an extension method, it is decorated with a `stab.lang.ExtensionMethod` annotation. Extension methods must be members of static classes. A static class is annotated with `stab.lang.StaticClass`.

To have the compiler to consider `capitalize()` as an extension method, create this interface in a file `Commons.stab`:
```
using java.lang;
using stab.lang;
package stab.annotated.org.apache.commons.lang {
    [StaticClass]
    public interface WordUtils {
        [ExtensionMethod]
        String capitalize(String s);
    }
}
```
Note: `WordUtils` can also be an abstract class instead of an interface, it doesn't matter. Abstract classes are needed to decorate nested classes because in Stab interfaces cannot be nested.

Compile the file:
```
> java -jar stabc.jar -cp:stabrt.jar Commons.stab
```
It produces `Commons.jar`

Now create `Test.stab`:
```
using java.lang;
using org.apache.commons.lang;
public class Test {
    public static void main(String[] args) {
        System.out.println("Capitalized test: " + "test".capitalize());
    }
}
```

Compile it:
```
> java -jar stabc.jar -cp:stabrt.jar;commons-lang-2.5.jar -al:Commons.jar Test.stab
```

Run the test:
```
> java -cp stabrt.jar;commons-lang-2.5.jar;Test.jar Test
Capitalized test: Test
```
`Commons.jar` is not needed at runtime since it is just containing metadata for the compiler.