@echo off

setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

set scriptdir=%~dp0
set copy_all=0
set generate_index=0
set single_file=0
set content_dir=%scriptdir%content
pushd %scriptdir%

if "%1"=="/?" goto :showhelp
if "%1"=="-?" goto :showhelp
if "%1"=="-help" goto :showhelp
if "%1"=="--help" goto :showhelp

if not "%1"=="" (
  set content_dir=%1
  set copy_all=1
)

if /I "%content_dir:~-3%"==".md" (
  set single_file=1
)

if not exist %content_dir% (
  echo Content directory does not exist: %content_dir%
  exit /b 1
)

if exist reveal.js goto :skipgit
echo Cloning reveal.js ...
git clone https://github.com/hakimel/reveal.js.git
if not "%errorlevel%"=="0" (
  echo Failed to `git clone https://github.com/hakimel/reveal.js.git`
  exit /b 1
)

:skipgit
echo Installing reveal.js ...
pushd reveal.js
call npm install
if not "%errorlevel%"=="0" (
  echo Failed to `npm install`
  exit /b 1
)
popd

:copycontent
echo Copying from content ...
if "%copy_all%"=="1" (
  if "%single_file%"=="0" (
    xcopy %content_dir%\* %scriptdir%reveal.js /E /Y /F
  ) else (
    copy %content_dir% %scriptdir%reveal.js /Y
    cscript //Nologo %scriptdir%BuildIndex.js %content_dir% %scriptdir%content\index.html %scriptdir%reveal.js\index.html
  )
) else (
  call copy-from-content.cmd
)
if not "%errorlevel%"=="0" (
  echo Failed to copy from content directory.
  exit /b 1
)

echo start with:
echo pushd %scriptdir%reveal.js
echo npm start
echo start http://localhost:8000
echo.
echo You can edit the files under reveal.js, then update with `copy-to-content.cmd`
echo The files that are copied back and forth are in `content-files.txt`

exit /b 0

:showhelp

echo.
echo build-talk [content-dir]
echo.
echo   content-dir: directory with content for presentation, defaults to %content_dir%
echo.
echo When content-dir is specified, all files in there are copied over into the talk.
echo.
