@echo off
cd C:\development\memocast-test
call robot -d results/win8-firefox/suit01 -v BROWSER:ff tests/01_HeaderCommon.robot
