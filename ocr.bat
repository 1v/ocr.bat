@echo off

set path1=OCR
set path2=OUT

if "%~1"=="-h" GOTO Help
if not "%~1"=="-h" GOTO Job

:Help
echo.
echo 	░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
echo 	▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ Справка ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
echo 	░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
echo 	Djvu файлы из FR должны быть помещены в папку OCR.
echo 	Оригинальные djvu файлы (с теми же именами) должны
echo 	быть помещены в папку OUT.
echo 	В итоге должна получиться структура:
echo 		/OCR/Book.djvu
echo 		/OUT/Book.djvu
echo 		/fr11DTLcrutch03.exe
echo 		/ocr.bat
if "%~1"=="-h" GOTO EndOfAll
GOTO Question

:Job
echo.
echo 	Выберите опцию:
echo 		1. Преобразовать в папке %path1%
echo 		2. Преобразовать из папки %path1% в %path2%
echo 		3. Справка
echo 		4. Выход

:Question
echo.
<nul set /p =█	Введите номер: 
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
echo 	Обработка: из %path1%\%%~nxf	в	%path2%\%%~nxf
"fr11DTLcrutch03.exe" ".\%path1%\%%~nxf" -s ".\%path2%\%%~nxf"
)

IF "%method%"=="Convert" (
echo 	Обработка: %path1%\%%~nxf
"fr11DTLcrutch03.exe" ".\%path1%\%%~nxf"
)

)

echo.
echo 	Завершено
echo.
echo 	Выйти
echo 		1. Да
echo 		2. Нет
echo.
<nul set /p =█	Введите номер: 
CHOICE /C 12 /N

IF ERRORLEVEL 2 GOTO Job

:EndOfAll