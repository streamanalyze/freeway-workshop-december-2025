@echo off

sa.engine -f SA -x -o "models:test('bus_stats')" -o "quit;"
if %ERRORLEVEL% neq 0 goto fail

goto ok
:fail
echo "***********************************************"
echo "*******   ERROR IN BUS_STATS REGRESS   ********"
echo "***********************************************"
echo errorlevel is %ERRORLEVEL%
exit /b %ERRORLEVEL%

:ok
exit /b 0
