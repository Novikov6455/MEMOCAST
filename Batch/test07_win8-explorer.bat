@echo off
cd C:\development\memocast-test
call robot -d results/win8-explorer/suit07 -v BROWSER:ie tests/07_LoginPassword.robot
