@echo off
cd C:\development\memocast-test
call robot -d results/win8-firefox/suit03 -v BROWSER:ff tests/03_SearchCommon.robot
