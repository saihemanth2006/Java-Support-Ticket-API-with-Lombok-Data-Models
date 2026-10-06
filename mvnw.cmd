@ECHO OFF
SETLOCAL
SET BASE_DIR=%~dp0
SET MAVEN_VERSION=3.9.9
SET MAVEN_HOME=%BASE_DIR%.mvn\wrapper\apache-maven-%MAVEN_VERSION%
SET MAVEN_BIN=%MAVEN_HOME%\bin\mvn.cmd
WHERE mvn >NUL 2>NUL
IF %ERRORLEVEL% EQU 0 (
  mvn %*
  EXIT /B %ERRORLEVEL%
)
IF NOT EXIST "%MAVEN_BIN%" (
  SET ARCHIVE=%BASE_DIR%.mvn\wrapper\apache-maven-%MAVEN_VERSION%-bin.zip
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -UseBasicParsing 'https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/%MAVEN_VERSION%/apache-maven-%MAVEN_VERSION%-bin.zip' -OutFile '%BASE_DIR%.mvn\wrapper\apache-maven-%MAVEN_VERSION%-bin.zip'"
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Expand-Archive -Force '%BASE_DIR%.mvn\wrapper\apache-maven-%MAVEN_VERSION%-bin.zip' '%BASE_DIR%.mvn\wrapper'"
  DEL /Q "%BASE_DIR%.mvn\wrapper\apache-maven-%MAVEN_VERSION%-bin.zip"
)
CALL "%MAVEN_BIN%" %*
ENDLOCAL
EXIT /B %ERRORLEVEL%