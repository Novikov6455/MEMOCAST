@echo off
cd C:\development\memocast-test
call robot -d results/win8-chrome/suit01 -v BROWSER:chrome tests/01_HeaderCommon.robot
call robot -d results/win8-chrome/suit02 -v BROWSER:chrome tests/02_FooterCommon.robot
call robot -d results/win8-chrome/suit03 -v BROWSER:chrome tests/03_SearchCommon.robot
call robot -d results/win8-chrome/suit04 -v BROWSER:chrome tests/04_HomePage.robot
call robot -d results/win8-chrome/suit05 -v BROWSER:chrome tests/05_BrowseMovies.robot
call robot -d results/win8-chrome/suit06 -v BROWSER:chrome tests/06_MyProfile.robot
call robot -d results/win8-chrome/suit07 -v BROWSER:chrome tests/07_LoginPassword.robot