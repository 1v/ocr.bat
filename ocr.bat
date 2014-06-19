@echo off

set path1=OCR
set path2=OUT

if "%~1"=="-h" GOTO Help
if not "%~1"=="-h" GOTO Job

:Help
echo.
echo 	��������������������������������������������������������
echo 	���������������������� ��ࠢ�� �������������������������
echo 	��������������������������������������������������������
echo 	Djvu 䠩�� �� FR ������ ���� ����饭� � ����� OCR.
echo 	�ਣ������ djvu 䠩�� (� ⥬� �� �������) ������
echo 	���� ����饭� � ����� OUT.
echo 	� �⮣� ������ ��������� �������:
echo 		/OCR/Book.djvu
echo 		/OUT/Book.djvu
echo 		/fr11DTLcrutch03.exe
echo 		/ocr.bat
if "%~1"=="-h" GOTO EndOfAll
GOTO Question

:Job
echo.
echo 	�롥�� ����:
echo 		1. �८�ࠧ����� � ����� %path1%
echo 		2. �८�ࠧ����� �� ����� %path1% � %path2%
echo 		3. ��ࠢ��
echo 		4. ��室

:Question
echo.
<nul set /p =�	������ �����: 
CHOICE /C 1234 /N

IF ERRORLEVEL 4 GOTO EndOfAll
IF ERRORLEVEL 3 GOTO Help
IF ERRORLEVEL 2 GOTO Transfer
IF ERRORLEVEL 1 GOTO Convert

:Convert
set method=Convert
GOTO StartFor

:Transfer
set method=Transfer
GOTO StartFor

:StartFor
echo.
for %%f in (".\%path1%\*.djvu") do (

IF "%method%"=="Transfer" (
echo 	��ࠡ�⪠: �� %path1%\%%~nxf	�	%path2%\%%~nxf
"fr11DTLcrutch03.exe" ".\%path1%\%%~nxf" -s ".\%path2%\%%~nxf"
)

IF "%method%"=="Convert" (
echo 	��ࠡ�⪠: %path1%\%%~nxf
"fr11DTLcrutch03.exe" ".\%path1%\%%~nxf"
)

)

echo.
echo 	�����襭�
echo.
echo 	���
echo 		1. ��
echo 		2. ���
echo.
<nul set /p =�	������ �����: 
CHOICE /C 12 /N

IF ERRORLEVEL 2 GOTO Job

:EndOfAll