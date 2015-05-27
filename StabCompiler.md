

# Jar files #

The compiler is contained in `stabc.jar`. The main class is `stab.tools.compiler.Application`. It depends on `asm-3.2.jar` and `stabrt.jar` (the runtime library for the Stab language).

The command line to invoke the compiler is:
```
> java -cp asm-3.2.jar;stabrt.jar;stabc.jar stab.tools.compiler.Application <options> <files>
```
`stabc.jar` is an executable jar, alternatively you can type:
```
> java -jar stabc.jar <options> <files>
```

# Options #

## help ##
`-help` displays a short summary for each option of the compiler.

## classpath ##
`-classpath:<paths>` or `-cp:<paths>` is used to specify the jar/ZIP files or directories containing the classes referenced by the program to compile.
The runtime library must always be included using this option:
```
> java -cp asm-3.2.jar;stabrt.jar;stabc.jar stab.tools.compiler.Application -cp:stabrt.jar Test.stab 
```
The first `-cp` (without colon) is a java option, the second is the option for Stab.

## annotatedlibs ##
`-annotatedlibs:<paths>` or `-al:<paths>` is used to specify the jar/ZIP files or directories containing the classes used to add annotations to external libraries.
See AnnotatedLibs for more details.

A jar (`stabal.jar`) is provided to decorate some JDK classes. For example it allows indexers to be used on `java.util.Map`, and `java.io.Closeable` to be automatically closed by `using` statements.
A command that use it looks like that:
```
> java -cp asm-3.2.jar;stabrt.jar;stabc.jar stab.tools.compiler.Application -al:stabal.jar -cp:stabrt.jar Test.stab
```

## define ##
`-define:<symbols>` or `-d:<symbols>` is used to define symbols for the preprocessor:
```
> java -jar stabc.jar -d:FLAG1;FLAG2 Test.stab
```

## doc ##
`-doc:<file>` is used to extract [XML comments](XmlComments.md) from the input files:
```
> java -jar stabc.jar -doc:documentation.xml Test.stab
```

## out ##
`-out:<file>` is used to specify a filename for the generated jar file. By default the base name of the first input file is used.
```
> java -jar stabc.jar -out:Test.jar Test.stab
```

## manifest ##
`-manifest:<file>` or `-m:<file>` is used to specify a manifest file to include in the jar file, for example to make it an executable jar.
```
> java -jar stabc.jar -m:manifest.mf Test.stab
```