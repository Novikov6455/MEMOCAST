@echo off
cd C:\development\memocast-test
call robot -d results/win8-chrome/suit05 -v BROWSER:chrome tests/05_BrowseMovies.robot
