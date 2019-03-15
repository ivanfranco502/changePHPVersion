:: renameDirectories.bat
@echo off
SETLOCAL


set pathPHP=C:\Users\ifranco\Desktop\rename\
set pathPHP71=php71
set pathPHP72=php72

:: verify the php folder exists
if not exist "%pathPHP%php" ( echo "ERROR: Directory %pathPHP%php Not Found" & goto endofscript )

:: verify the second file exists
if not exist "%pathPHP%%pathPHP71%" ( 
	set pathChange=%pathPHP71%
	set pathToPHP=%pathPHP72%
)
if not exist "%pathPHP%%pathPHP72%" ( 
	set pathChange=%pathPHP72%
	set pathToPHP=%pathPHP71%)

:: Create a guaranteed unique string for temporarily naming one file
set instance=%date:~-4,4%%date:~-10,2%%date:~-7,2%
set instance=%instance%-%time:~0,2%%time:~3,2%%time:~6,2%%time:~9,2%
set instance=%instance%-%RANDOM%

:: rename the first file to a temporary name
ren "%pathPHP%php" "php%instance%"
:: rename the second file to the first file name
ren "%pathPHP%%pathToPHP%" "php"
:: rename teh first file to the second file name
ren "%pathPHP%php%instance%" "%pathChange%"

:endofscript
