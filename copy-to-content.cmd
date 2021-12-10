@echo off
@FOR /F "eol=#" %%i IN (content-files.txt) DO @echo copy /y reveal.js\%%i content\%%i

@FOR /F "eol=#" %%i IN (content-files.txt) DO copy /y reveal.js\%%i content\%%i
