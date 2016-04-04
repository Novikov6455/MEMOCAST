@echo off
cd C:\development\memocast-test
call robot -d results/win8-chrome/suit03 -v BROWSER:chrome tests/03_SearchCommon.robot
