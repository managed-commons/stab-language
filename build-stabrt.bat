@ECHO OFF

ECHO Compiling source code...

java -jar bin\stabc.jar -al:bin\stabal.jar -doc:runtime\doc.xml -out:runtime\classes runtime\sources\lang\*.stab runtime\sources\query\*.stab

ECHO Creating stabrt.jar

jar cf runtime\stabrt.jar -C runtime\classes .

ECHO Done.
