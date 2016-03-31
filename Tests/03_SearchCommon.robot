*** Settings ***
Documentation    Suite description: Common  Search part of site
Library  Selenium2Library  0.5  10	    # Sets default timeout to 0.5 seconds and default implicit_wait to 10 seconds
Library	Screenshot
Resource  ../Resources/Common.robot     # Common resources keep in Common.robot
# executable Terminal string
#robot -d results tests/03_SearchCommon.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Variables ***
# Tester can reset GLOBAL Variables for particular TestSuita
#${BROWSER} =  ff                    # ie=Internet Explorer, ff=FireFox, gc=Google Chrome
#${START_URL} =  http://www2.memocast.com
#${LOGIN} =   novikov6455@gmail.com
#${PASSWORD} =  5906455
${FILM_TO_TRY} =  admiral 2008
${active_player} =  divMemocastFlashPlayer
${orig timeout} =  0.5 seconds

*** Test Cases ***
User can search a Movies via Search line
    [Tags]    DEBUG 03.1
    #robot -d results -t "User can search a Movies via Search line" tests/03_SearchCommon.robot
    Given clear element text  id=ctl34_tbSearch
    Then input text  id=ctl34_tbSearch  ${FILM_TO_TRY}
    Then click button  id=ctl34_Button1         # Submit search
    Then wait until element is visible  id=cphMain_lblSearchResults
    And element should not contain  id=cphMain_lblSearchResults  0
    Then click link  xpath=.//*[@id='cphMain_gwData']/tbody/tr[2]/td[1]/a
    Then wait until page contains element  id=${active_player}  20
    Then Open page that loads slowly
    Then capture page screenshot
    Then wait until page contains element  xpath=.//*[@id='divMemocastFlashPlayer']  30
    ${active_displey} =  get webelement  xpath=.//*[@id='divMemocastFlashPlayer']
    click element  ${active_displey}
    #Then wait until page contains element  css=#divMemocastFlashPlayer_jwplayer_controlbar_playButton  40
    Then capture page screenshot

User can search Movies and choose some of them from drop down preview table
    [Documentation]  During the search for the movie via Search line User can choose some of them from drop down preview table.
    [Tags]    DEBUG 03.2 ff only
    #robot -d results -t "User can search Movies and choose some of them from drop down preview table" tests/03_SearchCommon.robot

    Comment  In this test we use additional Locator Strategy to handle Flash Player
    Add Location Strategy    custom    Custom Locator Strategy  # don't work for ie and gc  because Flash player wrapped
    # but for ff work both strategy Locator as ff can open java script automatically

    Comment  Clear search field befo looking for film
    Given clear element text  id=ctl34_tbSearch
    When input text  id=ctl34_tbSearch  ${FILM_TO_TRY}
    And wait until element is visible  xpath=.//*[@id='suggestions']  30
    Then click image  xpath=.//*[@id='suggestions']/div/div[1]/div[1]/img   # Submit search
    Then wait until page contains element  id=${active_player}  20
    Then Check if elements from Flash Player exist

    Comment  Exampl of working Custom Locator Strategy
    ${active_handle} =  get webelement  custom=divMemocastFlashPlayer_wrapper
    click element  ${active_handle}
    Then Open page that loads slowly
    Then capture page screenshot
    #${active_handle} =  get webelement  custom=divMemocastFlashPlayer_jwplayer_controlbar_fullscreenButton
    #click element  ${active_handle}

    Comment  The common Locator strategy work in ff also
    Then wait until page contains element  xpath=.//*[@id='divMemocastFlashPlayer']  30
    ${active_displey} =  get webelement  xpath=.//*[@id='divMemocastFlashPlayer']
    click element  ${active_displey}
    #Then wait until page contains element  css=#divMemocastFlashPlayer_jwplayer_controlbar_playButton  40
    Then capture page screenshot

*** Keywords ***

Custom Locator Strategy
    [Arguments]    ${BROWSER}    ${criteria}    ${tag}    ${constraints}
    [Documentation]    Custom Locator Strategy
    ${retVal}=    Execute Javascript    return window.document.getElementById('${criteria}') || [];
    [Return]    ${retVal}

Check if elements from Flash Player exist
    Page Should Contain Element    custom=divMemocastFlashPlayer_wrapper   # only for ie gc
    #Page Should Contain Element    custom=divMemocastFlashPlayer_displayarea
    #Page Should Contain Element    custom=divMemocastFlashPlayer_jwplayer_display
    #Page Should Contain Element    custom=divMemocastFlashPlayer_jwplayer_controlbar_playButton
    #Page Should Contain Element    custom=divMemocastFlashPlayer_jwplayer_controlbar_fullscreenButton
    #Page Should Contain Element    custom=divMemocastFlashPlayer_jwplayer_controlbar_pauseButton
    #Page Should Contain Element    custom=divMemocastFlashPlayer_jwplayer_controlbar_normalscreenButton
    Page Should Contain Element    custom=divMemocastFlashPlayer

Open page that loads slowly
	Set Selenium Timeout	20 seconds
	set selenium implicit wait  	20 seconds

Return to original Timeout
    Set Selenium Timeout	${orig timeout}
    set selenium implicit wait  	10 seconds
