@echo off
cd C:\development\memocast-test
call robot -d results/win8-chrome/suit07 -v BROWSER:chrome tests/07_LoginPassword.robot
