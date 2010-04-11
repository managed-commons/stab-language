@ECHO OFF

ECHO Compiling source code...

java -jar bin\stabc.jar -runtimelib:bin\stabal.jar -out:runtime\classes runtime\sources\lang\*.stab runtime\sources\query\*.stab

ECHO Creating stabrt.jar

jar cf runtime\stabrt.jar -C runtime\classes .

ECHO Done.
