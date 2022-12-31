::===============================================================
:: This scripts converst a .md (markdown) file to a .pdf
::
::===============================================================
echo off
:: Command line parameter check 
REM IF NOT ERRORLEVEL 1 GOTO Syntax
IF "%~1"=="" GOTO Syntax
IF "%~2"=="" GOTO Syntax
:: Check sourefile exists
set sourcefile=%~1
if not exist "%sourcefile%" (
    echo Cannot find source file %1
    goto:EOF
)

:: Pandoc conversion
echo converting %~1 to %~2 please wait...
pandoc "%~1" ^
 "-f" "gfm" ^
 "--include-in-header" "chapter_break.tex" ^
 "-V" "linkcolor:blue" ^
 "-V" "geometry:a4paper" ^
 "-V" "geometry:margin=2cm" ^
 "-V" "mainfont=DejaVu Serif" ^
 "-V" "monofont=DejaVu Sans Mono" ^
 "--pdf-engine=xelatex" "-o" "%~2"
echo conversion completed
:: pandoc "%~1" "-f" "gfm" "--include-in-header" "chapter_break.tex" "-V" "linkcolor:blue" "-V" "geometry:a4paper" "-V" "geometry:margin=2cm" "-V" "mainfont=DejaVu Serif" "-V" "monofont=DejaVu Sans Mono" "--pdf-engine=xelatex" "-o" "%~2"

goto:EOF
:Syntax 
ECHO Convert markdown to pdf 
ECHO Usage: md2pdf [ markdownsourcefile ] [ pdfFileName]