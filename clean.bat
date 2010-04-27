@ECHO OFF

IF EXIST annotated\stabal.jar DEL /Q annotated\stabal.jar
IF EXIST compiler\stabc.jar DEL /Q compiler\stabc.jar
IF EXIST runtime\stabrt.jar DEL /Q runtime\stabrt.jar
IF EXIST runtime\doc.xml DEL /Q runtime\doc.xml
IF EXIST tests\tests.jar DEL /Q tests\tests.jar
IF EXIST tests\resources\ExpressionsTest\generated RMDIR /S /Q tests\resources\ExpressionsTest\generated
IF EXIST tests\resources\LibraryTest\generated RMDIR /S /Q tests\resources\LibraryTest\generated
IF EXIST tests\resources\NotCommittedTest\generated RMDIR /S /Q tests\resources\NotCommittedTest\generated
IF EXIST tests\resources\ObjectModelTest\generated RMDIR /S /Q tests\resources\ObjectModelTest\generated
IF EXIST tests\resources\ParseCompilationUnitTest\generated RMDIR /S /Q tests\resources\ParseCompilationUnitTest\generated
IF EXIST tests\resources\ParseExpressionTest\generated RMDIR /S /Q tests\resources\ParseExpressionTest\generated
IF EXIST tests\resources\PreprocessorTest\generated RMDIR /S /Q tests\resources\PreprocessorTest\generated
IF EXIST tests\resources\StatementsTest\generated RMDIR /S /Q tests\resources\StatementsTest\generated
IF EXIST tests\resources\TypeBuilderTest\stab RMDIR /S /Q tests\resources\TypeBuilderTest\stab
IF EXIST tests\resources\TypeSystemTest\generated RMDIR /S /Q tests\resources\TypeSystemTest\generated
IF EXIST tests\resources\QueryTranslatorTest\generated RMDIR /S /Q tests\resources\QueryTranslatorTest\generated
