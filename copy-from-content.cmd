@echo off
@FOR /F "eol=#" %%i IN (content-files.txt) DO @echo copy /y content\%%i reveal.js\%%i

@FOR /F "eol=#" %%i IN (content-files.txt) DO copy /y content\%%i reveal.js\%%i

