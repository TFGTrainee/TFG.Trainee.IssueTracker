@echo off

::Here is source connection information - Flow Database
set sourceServer=sdzyuban-pc
set sourceDB=Test


set targetFormName="Test Form"


set rootDirectory=%~dp0


set isql=C:\Program Files\Microsoft SQL Server\110\Tools\Binn\SQLCMD.EXE

rem echo %isql%
::del err.txt log.txt

DATE /T 
DATE /T >log.txt
DATE /T >err.txt

TIME /T 
TIME /T >>log.txt
TIME /T >>err.txt
                                                                   

for  %%f IN ("%rootDirectory%/01.DDL/*.sql") do (echo %%f 
echo ----- %%f ----- >>log.txt
echo ----- %%f ----- >>err.txt
IF %%~zf GTR 2 "%isql%" -S %sourceServer%  -d %sourceDB% -r1 -e  -i "%%f" >>log.txt  2>>err.txt)
if not "%errorlevel%" == "0" set BatchExitCode=%errorlevel%
::pause

for  %%f IN ("%rootDirectory%/02.Domain/*.sql") do (echo %%f 
echo ----- %%f ----- >>log.txt
echo ----- %%f ----- >>err.txt
IF %%~zf GTR 2 "%isql%" -S %sourceServer%  -d %sourceDB% -r1 -e  -i "%%f" >>log.txt  2>>err.txt)
if not "%errorlevel%" == "0" set BatchExitCode=%errorlevel%
::pause

for  %%f IN ("%rootDirectory%/03.Sample/*.sql") do (echo %%f 
echo ----- %%f ----- >>log.txt
echo ----- %%f ----- >>err.txt
IF %%~zf GTR 2 "%isql%" -S %sourceServer%  -d %sourceDB% -r1 -e  -i "%%f" >>log.txt  2>>err.txt)
if not "%errorlevel%" == "0" set BatchExitCode=%errorlevel%
::pause



exit /b %BatchExitCode%

start err.txt

goto :EOF

:Usage
echo "Usage: CreateDB <sql sourceServer> <database name>"
echo "All parameters are required."

