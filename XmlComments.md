

# XML Comments #
Types, fields and methods can be documented using XML comments. An [option of the command line compiler](StabCompiler#doc.md) can be used to extract these comments from the source files.

XML comments are comments starting with `///` or `/**` just preceding the type, field or method to document. The contents of an XML comment must be XML valid otherwise a warning is emitted and it is skipped.

## Specials tags ##
Some tags are processed by the compiler. Other ones are just copied to the output file.

### param and paramref ###
The compiler checks that the value of the `name` attribute matches a parameter of the method, otherwise there is a warning.

`<param>` is processed if it is a top level element. `<paramref>` is processed if it is a nested element.
```
class C {
    /// <summary>Method description <paramref name="p"/></summary>
    /// <param name="p">Parameter description</param>
    void m(int p) {}
}
```

### typeparam and typeparamref ###
The compiler checks that the value of the `name` attribute matches a type parameter of the type, otherwise there is a warning.

`<typeparam>` is processed if it is a top level element. `<typeparamref>` is processed if it is a nested element.
```
/// <summary>Type description <typeparamref name="T"/></summary>
/// <typeparam name="T">Type parameter description</param>
class C<T> {
}
```

### seealso and see ###
The compiler checks that the value of the `cref` attribute can be resolved to a type, a field or a method.

`<seealso>` is processed if it is a top level element. `<see>` is processed if it is a nested element.
```
/// <seealso cref="D.m"/>
class C {
}
class D {
    int f;
    /// <summary><see cref="f"></summary>
    void m() {}
}
```

### exception ###
The compiler checks that the value of the `cref` attribute can be resolved to a throwable type.
```
class C {
    /// <exception cref="java.io.IOException">Why the exception is thrown</exception>
    void m() {}
}
```

### include ###
This element is replaced in the XML comment by the elements of an external file.
The selection of the elements to include is specified by an XPath expression.
```
/// <include file="externaldoc.xml" path='comments/comment[@name="C"]'/>
class C {
}
```
If the contents of `externaldoc.xml` is:
```
<comments>
  <comment name="C">
   <summary>Class C</summary>
   <remarks>Some details...</remarks>
  </comment>
</comments>
```
The source code of C is equivalent to:
```
/// <summary>Class C</summary>
/// <remarks>Some details...</remarks>
class C {
}
```