@ECHO OFF

ECHO Compiling source code...

java -jar bin\stabc.jar -cp:bin\stabrt.jar -out:annotated\stabal.jar annotated\sources\*.stab

ECHO Done.
