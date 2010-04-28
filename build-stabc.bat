@ECHO OFF

ECHO Compiling source code...

java -jar bin\stabc.jar -al:bin\stabal.jar -cp:bin\stabrt.jar;bin\asm-3.2.jar -resources:compiler\resources -manifest:compiler\MANIFEST.MF -out:compiler\stabc.jar compiler\sources\parser\*.stab compiler\sources\helpers\*.stab compiler\sources\syntaxtree\*.stab compiler\sources\bytecode\*.stab compiler\sources\bytecode\signature\*.stab compiler\sources\compiler\*.stab

ECHO Done.
