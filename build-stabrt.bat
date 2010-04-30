@ECHO OFF

ECHO Compiling source code...

java -jar bin\stabc.jar -al:bin\stabal.jar -doc:runtime\doc.xml -out:runtime\stabrt.jar runtime\sources\lang\*.stab runtime\sources\query\*.stab runtime\sources\tree\*.stab

ECHO Done.
