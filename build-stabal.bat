@ECHO OFF

ECHO Compiling source code...

java -jar bin\stabc.jar -runtimelib:bin\stabrt.jar -out:annotated\classes annotated\sources\*.stab

ECHO Creating stabal.jar

jar cf annotated\stabal.jar -C annotated\classes .

ECHO Done.
