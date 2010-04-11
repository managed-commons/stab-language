@ECHO OFF

ECHO Compiling source code...

java -jar bin\stabc.jar -runtimelib:bin\stabrt.jar -al:bin\stabal.jar -cp:bin\asm-3.2.jar -out:compiler\classes compiler\sources\parser\*.stab compiler\sources\helpers\*.stab compiler\sources\syntaxtree\*.stab compiler\sources\bytecode\*.stab compiler\sources\bytecode\signature\*.stab compiler\sources\compiler\*.stab

ECHO Creating stabc.jar

xcopy /S /Y /Q compiler\resources\* compiler\classes\
jar cfm compiler\stabc.jar compiler\MANIFEST.MF -C compiler\classes .

ECHO Done.
