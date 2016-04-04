@echo off
cd C:\development\memocast-test
call robot -d results/win8-firefox/suit05 -v BROWSER:ff tests/05_BrowseMovies.robot
