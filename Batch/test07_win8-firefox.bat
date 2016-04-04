@echo off
cd C:\development\memocast-test
call robot -d results/win8-firefox/suit07 -v BROWSER:ff tests/07_LoginPassword.robot
