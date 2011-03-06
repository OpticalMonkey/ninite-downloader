@ECHO OFF
ECHO.
ECHO [ND] Ninite Downloader 1.0
ECHO.===============================================================================
ECHO.

:PREP
SETLOCAL
SET TOOLS-BIN=.\bin
SET NINITELOC=.\Ninite
SET USERAGENT=GetRight/6.3e
SET WGET32URL=http://users.ugent.be/~bpuype/cgi-bin/fetch.pl?dl=wget/wget.exe

:CHECKPREREQ
IF NOT EXIST %NINITELOC%\. MD %NINITELOC%
IF NOT EXIST %TOOLS-BIN%\wget.exe GOTO :PREREQ

:QUEUE
ECHO START: %DATE% %TIME%
ECHO. & ECHO Downloading Ninite Antimalware Installers:
CALL :DOWNLOAD adaware
CALL :DOWNLOAD malwarebytes
CALL :DOWNLOAD spybot
CALL :DOWNLOAD super
ECHO. & ECHO Downloading Ninite Antivirus Installers:
CALL :DOWNLOAD avast-malwarebytes
CALL :DOWNLOAD avg-malwarebytes
CALL :DOWNLOAD essentials-malwarebytes
ECHO. & ECHO Downloading Ninite Browser Installers:
CALL :DOWNLOAD chrome
CALL :DOWNLOAD firefox
CALL :DOWNLOAD opera
CALL :DOWNLOAD safari
ECHO. & ECHO Downloading Ninite File Sharing Installers:
CALL :DOWNLOAD emule-utorrent
ECHO. & ECHO Downloading Ninite Web Runtime Installers:
CALL :DOWNLOAD air-flash-flashie
CALL :DOWNLOAD dotnet-silverlight
CALL :DOWNLOAD java
CALL :DOWNLOAD air-flash-flashie-dotnet-silverlight-java
ECHO. & ECHO Downloading Ninite Messaging Installers:
CALL :DOWNLOAD aim
CALL :DOWNLOAD googletalk
CALL :DOWNLOAD messenger
CALL :DOWNLOAD skype
CALL :DOWNLOAD yahoo
ECHO. & ECHO Downloading Ninite Multi-Messaging Installers:
CALL :DOWNLOAD digsby
CALL :DOWNLOAD pidgin
ECHO. & ECHO Downloading Ninite Viewer Installers:
CALL :DOWNLOAD klitecodecs-mediamonkey-picasa-vlc-winamp
CALL :DOWNLOAD reader
ECHO. & ECHO Downloading Ninite Archive Installers:
CALL :DOWNLOAD imgburn-sevenzip-winrar
ECHO. & ECHO Downloading Ninite Remote Access Installers:
CALL :DOWNLOAD putty-realvnc-teamviewer
ECHO. & ECHO Downloading Ninite Remote Transfer Installers:
CALL :DOWNLOAD filezilla-teracopy-winscp
ECHO. & ECHO Downloading Ninite Piriform Installers:
CALL :DOWNLOAD ccleaner-defraggler-recuva
ECHO.
ECHO FINISH: %DATE% %TIME%
GOTO :END

:DOWNLOAD
ECHO * Downloading %1... & START /WAIT /MIN %TOOLS-BIN%\wget.exe --user-agent=%USERAGENT% --output-document=%NINITELOC%\%1-ninite.exe http://ninite.com/%1/ninite.exe
GOTO :EOF

:PREREQ
IF EXIST .\wget.exe (
	IF NOT EXIST %TOOLS-BIN%\. MD %TOOLS-BIN%
	MOVE /Y .\wget.exe %TOOLS-BIN%\>:NULL 2>&1
	GOTO :QUEUE
) ELSE (
	IF NOT EXIST %TOOLS-BIN%\wget.exe GOTO :PREREQMISSING
)

:PREREQMISSING
ECHO ERROR: WGET.EXE is missing.
ECHO.
ECHO WGET is essential for aquiring all other files required by this script.
ECHO The latest Win32 port of WGET can be downloaded from here:
ECHO.
ECHO    %WGET32URL%
ECHO.
ECHO You must download and save WGET.EXE into the same directory as this script,
ECHO and try again. For your convenience, the hyperlink above will now be activated.
ECHO.
PAUSE
START %WGET32URL%
ECHO.
ECHO Please re-run this script when WGET.EXE has finished downloading, and has been
ECHO saved or copied into this directory.
GOTO :END

:END
ENDLOCAL
REM 5678901234567890123456789012345678901234567890123456789012345678901234567890
REM This script is free to USE and MODIFY, or REDISTRIBUTE in its' ORIGINAL FORM;
REM as long as this REM'd passage is always included.
ECHO.
ECHO.===============================================================================
ECHO Copyright 2011, Micheal Espinola Jr (micheal@espinola.net)
ECHO.

:EOF
