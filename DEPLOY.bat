@echo off
setlocal
echo ==================================================
echo   Sanika Portfolio  -  Deploy to GitHub + Netlify
echo ==================================================
echo.
if not exist "index.html" goto wrong
if not exist "netlify.toml" goto wrong
if exist "portfolio-phase5" goto wrong
if exist "index_phase8_backup.html" goto wrong
echo Folder check: OK  (index.html + gallery are right here)
echo.
if exist ".git" rmdir /s /q ".git"
git init
git add -A
git commit -m "Phase 9.2 deploy - flattened, fixed gallery paths"
git branch -M main
git remote remove origin 2>nul
git remote add origin https://github.com/SanikaTribhuvan/portfolio.git
git push -f origin main
echo.
echo ==================================================
echo   DONE. Open Netlify - it will redeploy in seconds.
echo ==================================================
pause
exit /b

:wrong
echo  !!!  WRONG FOLDER  !!!
echo.
echo  DEPLOY.bat must sit INSIDE the extracted portfolio-deploy folder
echo  (the one that directly contains index.html, netlify.toml,
echo   the gallery folder, and the videos folder).
echo.
echo  Extract the zip again and double-click DEPLOY.bat from in there.
echo.
pause
exit /b
