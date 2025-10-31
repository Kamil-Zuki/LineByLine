@echo off
echo ================================================
echo  LineByLine Documentation Generator
echo ================================================
echo.
echo Converting PLATFORM_VISION.md to multiple formats...
echo.

REM Change to project directory
cd /d "%~dp0"

REM Generate basic HTML
echo [1/3] Generating HTML...
pandoc PLATFORM_VISION.md -o PLATFORM_VISION.html --standalone --toc --toc-depth=3 --metadata title="LineByLine: Platform Vision Document"
if %errorlevel% neq 0 (
    echo ERROR: HTML generation failed
    pause
    exit /b 1
)
echo     ✓ PLATFORM_VISION.html created

REM Generate styled HTML
echo [2/3] Generating styled HTML...
pandoc PLATFORM_VISION.md -o PLATFORM_VISION_styled.html --standalone --toc --toc-depth=3 --css=pandoc-style.css --metadata title="LineByLine: Platform Vision Document" --metadata author="LineByLine Product Team" --metadata date="%date%"
if %errorlevel% neq 0 (
    echo ERROR: Styled HTML generation failed
    pause
    exit /b 1
)
echo     ✓ PLATFORM_VISION_styled.html created

REM Generate DOCX
echo [3/3] Generating DOCX...
pandoc PLATFORM_VISION.md -o PLATFORM_VISION.docx --toc --toc-depth=3 --metadata title="LineByLine: Platform Vision Document"
if %errorlevel% neq 0 (
    echo ERROR: DOCX generation failed
    pause
    exit /b 1
)
echo     ✓ PLATFORM_VISION.docx created

echo.
echo ================================================
echo  ✓ All formats generated successfully!
echo ================================================
echo.
echo Generated files:
echo   • PLATFORM_VISION.html
echo   • PLATFORM_VISION_styled.html (recommended for viewing)
echo   • PLATFORM_VISION.docx
echo.
echo To generate PDF:
echo   1. Open PLATFORM_VISION_styled.html in Chrome
echo   2. Press Ctrl+P and select "Save as PDF"
echo.
pause

