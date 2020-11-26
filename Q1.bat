::===============================================
:: Target:: Create a script to copy all files under C:\ with name being with "A" and end with ".txt" files to "C:\temp\I2_Result\"
::===============================================

@echo OFF

:: If C:\temp does not exist, create C:\temp folder
IF NOT EXIST "C:\temp\" (mkdir "C:\temp")

:: If C:\temp\I2_Result does not exist, create C:\temp\I2_Result folder
IF NOT EXIST "C:\temp\I2_Result\" (mkdir "C:\temp\I2_Result")

:: Delete Log C:\temp\I2_Result\Q1.log
del C:\temp\I2_Result\Q1.log /F

echo Copying Files...
:: Copy files begin with "A" and end with ".txt" to C:\temp\I2_Result with sub-directories with log file Q1.log
::robocopy C:\ C:\temp\I2_Result A*.txt /S /XD C:\$Recycle.Bin /UNILOG:C:\temp\I2_Result\Q1.log

:: Copy files begin with "A" and end with ".txt" to C:\temp\I2_Result with sub-directories with log file Q1.log (Exclude Recycle Bin)
::robocopy C:\ C:\temp\I2_Result A*.txt /S /XD C:\$Recycle.Bin /UNILOG:C:\temp\I2_Result\Q1.log

:: Copy files begin with "A" and end with ".txt" to C:\temp\I2_Result with log file Q1.log
FOR /R "C:\" %%F IN ("A*.txt") DO (
	echo %%F
	echo %%F >> C:\temp\I2_Result\Q1.log
	COPY /V /Y "%%F" "C:\temp\I2_Result" > NUL
)

::xcopy C:\A*.txt C:\temp\I2_Result\* /C /S /V /L /Y > C:\temp\I2_Result\Q1.log
echo End. Please find the logs in C:\temp\I2_Result\Q1.log
:: Open File Explorer to C:\temp\I2_Result
::explorer.exe C:\temp\I2_Result
pause

