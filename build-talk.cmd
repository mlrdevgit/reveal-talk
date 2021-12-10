@echo off

setlocal

set scriptdir=%~dp0
pushd %scriptdir%

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
call copy-from-content.cmd
if not "%errorlevel%"=="0" (
  echo Failed to `copy-from-content.cmd`
  exit /b 1
)

echo start with:
echo pushd reveal.js
echo npm start
echo start http://localhost:8000
echo.
echo You can edit the files under reveal.js, then update with `copy-to-content.cmd`
echo The files that are copied back and forth are in `content-files.txt`

exit /b 0
