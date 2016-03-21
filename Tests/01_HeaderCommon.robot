*** Settings ***
Documentation    Suite description: Common  HEAD part of site
Library  Selenium2Library  0  10	    # Sets default timeout to 0 seconds and default implicit_wait to 10 seconds
Resource  ../Resources/Common.robot     # Common resources keep in Common.robot
# Executable Terminal strings examples:
#robot -d results tests/01_HeaderCommon.robot
#robot -d results -t "User can change interface languages" tests/01_HeaderCommon.robot
#robot -d results -t "User can search a Movies" tests/01_HeaderCommon.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Variables ***
# Tester can reset GLOBAL Variables for particular TestSuita
#${BROWSER} =  ie                    # ie=Internet Explorer, ff=FireFox, gc=Google Chrome
#${START_URL} =  http://www2.memocast.com
#${LOGIN} =   novikov6455@gmail.com
#${PASSWORD} =  5906455
${FILM_TO_TRY} =  admiral 2008

*** Test Cases ***
User can LogIn with Valid Credentials
    [Tags]    DEBUG 01.1
    #Given page should contain  Logout
    And click link  css=#ctl34_aLogout           # reset conditions for start condition
    Then Login with valid credentials

User can change interface languages
    [Tags]    DEBUG 01.2
    #robot -d results -t "User can change interface languages" tests/01_HeaderCommon.robot
    Change interface languages

User can search a Movies
    [Tags]    DEBUG 01.3
    #robot -d results -t "User can search a Movies" tests/01_HeaderCommon.robot
    Given clear element text  id=ctl34_tbSearch
    Then input text  id=ctl34_tbSearch  ${FILM_TO_TRY}
    Then click button  id=ctl34_Button1         # Submit search
    Then wait until element is visible  id=cphMain_lblSearchResults
    And element should not contain  id=cphMain_lblSearchResults  0

User can open the Home page via Logotype
    [Tags]    DEBUG 01.4
    #robot -d results -t "User can open the Home page via Logotype" tests/01_HeaderCommon.robot
    #Given User should be log in
    When element should be visible  id=ctl34_HyperLink1
    Then click element  id=ctl34_HyperLink1
    Then wait until element is visible  id=ctl34_A1

User can make Subscription via Become Gold Member button
    [Tags]    DEBUG 01.5
    #robot -d results -t "User can make Subscription via Become Gold Member button" tests/01_HeaderCommon.robot
    #Given User should be log in
    When element should be visible  id=ctl34_aBecomeGold
    Then click element  id=ctl34_aBecomeGold
    #Then wait until element is enabled  id=cphMain_cphMain_content_ctl00_ctriTitle
    Then wait until element is visible  css=#cphMain_cphMain_content_ctl00_ctriTitle>span
    Then log  Functionality of Page will be tested in special tests

Anyone can buy service for anybody via Make a Gift button
        [Tags]    DEBUG 01.6
    #robot -d results -t "Anyone can buy service for anybody via Make a Gift button" tests/01_HeaderCommon.robot
    When element should be visible  id=ctl34_aMakeGift
    Then click element  id=ctl34_aMakeGift
    #Then wait until element is enabled  id=cphMain_cphMain_content_ctl00_ctriTitle
    Then wait until element is visible  css=.pagetitle>span
    Then click element  css=#cphMain_upMain>input
    Then go back
    Then log  Functionality of Page will be tested in special tests

*** Keywords ***


