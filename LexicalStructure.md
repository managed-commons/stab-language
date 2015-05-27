

# Lexical analysis #
The process of scanning a source file is described by the grammar productions:
<em><pre>
input:<br>
input-sectionopt<br>
<br>
input-section:<br>
input-section-part<br>
input-section input-section-part<br>
<br>
input-section-part:<br>
input-elementsopt<br>
pp-directive<br>
<br>
input-elements:<br>
input-element<br>
input-elements input-element<br>
<br>
input-element:<br>
whitespace<br>
comment<br>
token<br>
</pre></em>

# Newlines #
<em><pre>
new-line-character:<br>
*Carriage return (U+000D)*<br>
*Line feed (U+000A)*<br>
*Next line (U+0085)*<br>
*Line separator (U+2028)*<br>
*Paragraph separator (U+2029)*<br>
<br>
new-line:<br>
*Carriage return (U+000D)*<br>
*Line feed (U+000A)*<br>
*Carriage return (U+000D) immediately followed by Line feed (U+000A)*<br>
*Next line (U+0085)*<br>
*Line separator (U+2028)*<br>
*Paragraph separator (U+2029)*<br>
</pre></em>

# Whitespaces #
<em><pre>
whitespace:<br>
*Space (U+0020)*<br>
*Horizontal tab (U+0009)*<br>
*Vertical tab (U+000B)*<br>
*Form feed (U+000C)*<br>
</pre></em>

# Comments #
The language supports traditional C++ comments:
<em><pre>
comment:<br>
single-line-comment<br>
delimited-comment<br>
<br>
single-line-comment:<br>
*//* input-charactersopt<br>
<br>
input-characters:<br>
input-character<br>
input-characters input-character<br>
<br>
input-character:<br>
*Any Unicode character except a* new-line-character<br>
<br>
delimited-comment:<br>
*/* Any Unicode characters except the */ sequence */*<br>
</pre></em>

# Tokens #
<em><pre>
token:<br>
identifier<br>
*@* identifier<br>
keyword<br>
*@* keyword<br>
integer-literal<br>
real-literal<br>
character-literal<br>
string-literal<br>
separator<br>
</pre></em>

## Unicode escape sequences ##
Unicode escape sequences can be part of identifiers, strings and character.
<em><pre>
unicode-escape-sequence:<br>
*\u* hex-digit hex-digit hex-digit hex-digit<br>
*\U* hex-digit hex-digit hex-digit hex-digit hex-digit hex-digit hex-digit hex-digit<br>
</pre></em>

## Identifiers ##
The @ character can be added before an identifier or a keyword. The resulting token is an identifier without the @ character.
It is useful to use keywords as identifiers when a library has been written in Java.
<em><pre>
identifier:<br>
identifier-start identifier-partsopt<br>
<br>
identifier-start:<br>
*Any character or* unicode-escape-sequence *where java.lang.Character.isJavaIdentifierStart() is true*<br>
<br>
identifier-parts:<br>
identifier-part<br>
identifier-parts identifier-part<br>
<br>
identifier-part:<br>
*Any character or* unicode-escape-sequence *where java.lang.Character.isJavaIdentifierPart() is true*<br>
</pre></em>

## Keywords ##
The following tokens cannot be used as identifier except when prefixed with @:
<tt>
<table><thead><th> abstract </th><th> as </th><th> boolean </th><th> break </th><th> byte </th><th> case </th><th> catch </th></thead><tbody>
<tr><td> char     </td><td> class </td><td> continue </td><td> default </td><td> delegate </td><td> double </td><td> do    </td></tr>
<tr><td> else     </td><td> enum </td><td> false   </td><td> final </td><td> finally </td><td> float </td><td> for   </td></tr>
<tr><td> foreach  </td><td> goto </td><td> if      </td><td> in    </td><td> instanceof </td><td> int  </td><td> interface </td></tr>
<tr><td> long     </td><td> package </td><td> native  </td><td> new   </td><td> null </td><td> override </td><td> params </td></tr>
<tr><td> partial  </td><td> private </td><td> protected </td><td> public </td><td> return </td><td> short </td><td> sizeof </td></tr>
<tr><td> static   </td><td> strictfp </td><td> super   </td><td> switch </td><td> synchronized </td><td> this </td><td> throw </td></tr>
<tr><td> transient </td><td> true </td><td> try     </td><td> typeof </td><td> using </td><td> virtual </td><td> void  </td></tr>
<tr><td> volatile </td><td> where </td><td> while   </td></tr>
</tt></tbody></table>

These identifiers are considered as keywords when used in some places in the code:
<tt>
<table><thead><th> ascending </th><th> by </th><th> descending </th><th> equals </th><th> from </th><th> get </th><th> group </th></thead><tbody>
<tr><td> into      </td><td> join </td><td> let        </td><td> on     </td><td> orderby </td><td> select </td><td> set   </td></tr>
<tr><td> value     </td><td> var </td><td> where      </td><td> yield  </td></tr>
</tt></tbody></table>

## Integer literals ##
Values of types `int` and `long` can be represented as integer literals:
<em><pre>
integer-literal:<br>
decimal-digits long-typeopt<br>
0x hex-digits long-typeopt<br>
0X hex-digits long-typeopt<br>
<br>
decimal-digits:<br>
decimal-digit<br>
decimal-digits decimal-digit<br>
<br>
decimal-digit:<br>
*One of 0 1 2 3 4 5 6 7 8 9*<br>
<br>
hex-digits:<br>
hex-digit<br>
hex-digits hex-digit<br>
<br>
hex-digit:<br>
*One of 0 1 2 3 4 5 6 7 8 9 A B C D E F a b c d e f*<br>
<br>
long-type:<br>
*One of l L*<br>
</pre></em>
The values without the optional 'L' suffix and outside of the range of `int` values are considered as `long` literals.

## Real literals ##
Values of types `float` and `double` can be represented as real literals:
<em><pre>
real-literal:<br>
decimal-digits . decimal-digits exponent-partopt real-typeopt<br>
. decimal-digits exponent-partopt real-typeopt<br>
decimal-digits exponent-part real-typeopt<br>
decimal-digits real-type<br>
<br>
exponent-part:<br>
*e +*opt decimal-digits<br>
*e -*opt decimal-digits<br>
*E +*opt decimal-digits<br>
*E -*opt decimal-digits<br>
<br>
real-type:<br>
*One of f F d D*<br>
</pre></em>

## Character literals ##
Values of type `char` can be represented as character literals:
<em><pre>
character-literal:<br>
*'* character *'*<br>
<br>
character:<br>
*Any character except quote (U+0027), backslash (U+005C), and* new-line-character<br>
simple-escape-sequence<br>
hexadecimal-escape-sequence<br>
unicode-escape-sequence<br>
<br>
simple-escape-sequence:<br>
*One of \' \" \\ \0 \a \b \f \n \r \t \v*<br>
<br>
hexadecimal-escape-sequence:<br>
*\x* hex-digit hex-digitopt hex-digitopt hex-digitopt<br>
</pre></em>
The characters represented by simple escape sequences are:
| **Escape sequence** | **Unicode** |
|:--------------------|:------------|
| \'                  | U+0027      |
| \"                  | U+0022      |
| \\                  | U+005C      |
| \0                  | U+0000      |
| \a                  | U+0007      |
| \b                  | U+0008      |
| \f                  | U+000C      |
| \n                  | U+000A      |
| \r                  | U+000D      |
| \t                  | U+0009      |
| \v                  | U+000B      |

## String literals ##
Values of type `java.lang.String` can be represented as string literals:
<em><pre>
string-literal:<br>
*"* string-literal-charactersopt *"*<br>
*@"* verbatim-string-charactersopt *"*<br>
<br>
string-literal-characters:<br>
string-literal-character<br>
string-literal-characters string-literal-character<br>
<br>
string-literal-character:<br>
*Any character except double quote (U+0022), backslash (U+005C), and* new-line-character<br>
simple-escape-sequence<br>
hexadecimal-escape-sequence<br>
unicode-escape-sequence<br>
<br>
verbatim-string-characters:<br>
verbatim-string-character<br>
verbatim-string-characters verbatim-string-character<br>
<br>
verbatim-string-character:<br>
*Any character except double quote (U+0022)*<br>
*""*<br>
</pre></em>
Verbatim string literals can be used to represent strings that would otherwise require a lot of escape sequences if represented using the traditional format:
```
var s1 = @"C:\tmp\f.txt";
var s2 = @"line 1
line 2
line 3";
```

## Separators ##
<tt>
<table><thead><th> { </th><th> } </th><th> [ </th><th> ] </th><th> ( </th><th> ) </th><th> . </th><th> , </th><th> : </th><th> ; </th></thead><tbody>
<tr><td> + </td><td> - </td><td> <code>*</code> </td><td> / </td><td> % </td><td> & </td><td> | </td><td> ^ </td><td> ! </td><td> ~ </td></tr>
<tr><td> = </td><td> < </td><td> > </td><td> ? </td><td> ?? </td><td> :: </td><td> ++</td><td> -- </td><td> &&  </td><td> | | </td></tr>
<tr><td> == </td><td> != </td><td> <= </td><td> >= </td><td> += </td><td> -= </td><td> <b>=</b></td><td> /= </td><td> %= </td><td> &= </td></tr>
<tr><td> |= </td><td> ^= </td><td> << </td><td> <<= </td><td> => </td></tr>
</tt></tbody></table>

To avoid ambiguities in generic parameter lists:
  * >> is the composition of two >
  * >>= is the composition of > and >=.
  * >>> is the composition of three >
  * >>>= is the composition of >, > and >=

# Pre-processing directives #
The preprocessor support in Stab is directly borrowed from the mecanism described in the [C# specification](http://msdn.microsoft.com/en-us/library/aa645596(v=VS.71).aspx).

Symbols can be defined externally using the `-d` option of the compiler. For example the option to define S1 and S2 symbols is `-d:S1;S2`.