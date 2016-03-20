*** Settings ***
Documentation    Suite description: Common  Home Page Menu Navigation part of site
Library  Selenium2Library  1.5  10	    # Sets default timeout to 1.5 seconds and default implicit_wait to 10 seconds
Resource  ../Resources/Common.robot     # Common resources keep in Common.robot
# executable Terminal string
#robot -d results tests/04_SearchCommon.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Variables ***
# Tester can reset GLOBAL Variables for particular TestSuita
#${BROWSER} =  ff                    # ie=Internet Explorer, ff=FireFox, gc=Google Chrome
#${START_URL} =  http://www2.memocast.com
#${USER_NAME} =  novikov6455@gmail.com
#${PASSWORD} =  5906455
${FILM_TO_TRY} =  admiral 2008
${active_player} =  divMemocastFlashPlayer
${orig timeout} =  0.5 seconds

*** Test Cases ***
Home Page should contain items
    [Tags]    DEBUG 04.1
    #robot -d results -t "Home Page should contain items" tests/04_HomePage.robot
    Element Should Be Visible   	ctl34_A1
    Element Should Be Visible   	xpath=(.//span[contains(normalize-space(@class), "col-header")])[1]
    Element Should Be Visible   	left-menu-specials
    Element Should Be Visible   	cphMain_cphLeft_ctl00_divTags
    Element Should Be Visible   	left-menu-movies
    Element Should Be Visible   	left-menu-music
    Element Should Be Visible   	xpath=.//div[contains(normalize-space(@class), "central")]
    Element Should Be Visible   	xpath=(.//div[contains(normalize-space(@class), "my-feed-item")])[1]
    Element Should Be Visible   	xpath=(.//div[contains(normalize-space(@class), "my-feed-item")])[last()]
    Element Should Be Visible   	cphMain_cphMain_Feed1_feed_ctl00_0_img_0
    Element Should Be Visible   	cphMain_cphMain_Feed1_feed_ctl00_1_img_1
    Element Should Be Visible   	xpath=.//div[contains(normalize-space(@class), "new-rel")]
    Element Should Be Visible   	xpath=.//div[contains(normalize-space(@class), "top-movies left-align")]
    Element Should Be Visible   	xpath=.//div[contains(normalize-space(@class), "top-music left-align")]

User can open and see menu Memocast Specials
    [Tags]    DEBUG 04.2
    #robot -d results -t "User can open and see menu Memocast Specials" tests/04_HomePage.robot
    ${element_language}  get text  css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language
    Focus   	xpath=.//span[contains(normalize-space(.), 'Memocast Specials')]
    #click element  xpath=.//span[contains(normalize-space(.), 'Memocast Specials')]
    Element Should Be Visible   	xpath=.//span[contains(normalize-space(.), 'Memocast Specials')]
    Element Should Be Visible   	xpath=(.//li[contains(normalize-space(.), 'Oscar nominees')])[1]
    Element Should Be Visible   	xpath=(.//li[contains(normalize-space(.), 'Free Collection')])[1]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Payment options')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Movies with subtitles')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Russian TV Channels')]
    click element                   xpath=.//span[contains(normalize-space(.), 'Memocast Specials')]
    element should not be visible   xpath=(.//li[contains(normalize-space(.), 'Oscar nominees')])[1]
    click element                   xpath=.//span[contains(normalize-space(.), 'Memocast Specials')]
    Element Should Be Visible   	xpath=(.//li[contains(normalize-space(.), 'Oscar nominees')])[1]

User can choose Oscar nominees film via Memocast Specials
    [Tags]    DEBUG 04.21
    #robot -d results -t "User can choose Oscar nominees film via Memocast Specials" tests/04_HomePage.robot
    ${element_language}  get text  css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language
    Focus   	                    xpath=.//span[contains(normalize-space(.), 'Memocast Specials')]
    #click element                  xpath=.//span[contains(normalize-space(.), 'Memocast Specials')]
    Element Should Be Visible   	xpath=(.//li[contains(normalize-space(.), 'Oscar nominees')])[1]
    Then click element              xpath=(.//li[contains(normalize-space(.), 'Oscar nominees')])[1]
    And wait until page contains    Browse / Movies / Oscar nominees
    #And wait until page contains   	All
    And Page Should Contain        	М
    Focus                          	xpath=(.//a[contains(normalize-space(.), 'М')])[1]
    #Mouse Over   	xpath=(.//a[contains(normalize-space(.), 'М')])[1]
    #Press Key   	xpath=(.//a[contains(normalize-space(.), 'М')])[1]   	\\13
    Then click element              xpath=(.//a[contains(normalize-space(.), 'М')])[1]
    wait until element is visible   xpath=.//a[contains(normalize-space(.), '1991')]
    Then click element              xpath=.//a[contains(normalize-space(.), '1991')]
    wait until element is visible 	cphMain_cphMain_ctl00_repMovies_ctl00_0_divImgThumb_0
    Then click element              cphMain_cphMain_ctl00_repMovies_ctl00_0_divImgThumb_0
    Element Should Be Visible   	xpath=.//div[contains(normalize-space(@class), "pagetitle ny2013")]
    Element Should Be Visible   	xpath=.//div[contains(normalize-space(@class), "mmc-pl-mes-margin")]
    Then capture page screenshot

User can choose Free collection film via Memocast Specials
    [Tags]    DEBUG 04.22
    #robot -d results -t "User can choose Free collection film via Memocast Specials" tests/04_HomePage.robot
    ${element_language}  get text  css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language
    Focus   	                    xpath=.//span[contains(normalize-space(.), 'Memocast Specials')]
    #click element                  xpath=.//span[contains(normalize-space(.), 'Memocast Specials')]
    Element Should Be Visible   	xpath=(.//li[contains(normalize-space(.), 'Free Collection')])[1]
    Then click element              xpath=(.//li[contains(normalize-space(.), 'Free Collection')])[1]
    And wait until page contains    Browse / Movies / Free Collection
    And wait until page contains   	All
    And Page Should Contain        	А
    Focus                          	xpath=(.//a[contains(normalize-space(.), 'А')])[1]
    Then click element              xpath=(.//a[contains(normalize-space(.), 'А')])[1]
    wait until element is visible   xpath=.//a[contains(normalize-space(.), '2008')]
    Then click element              xpath=.//a[contains(normalize-space(.), '2008')]
    wait until element is visible 	cphMain_cphMain_ctl00_repMovies_ctl00_0_divImgThumb_0
    Then click element              cphMain_cphMain_ctl00_repMovies_ctl00_0_divImgThumb_0
    Wait Until Page Contains   	    Адмиралъ (Английские субтитры)
    Wait Until Page Contains   	    2008
    Wait Until Page Contains   	    Drama, Historical/Epics, Romance, Free Collection
    Element Should Be Visible   	xpath=.//div[contains(normalize-space(@class), "pagetitle ny2013")]
    Element Should Be Visible   	divMemocastFlashPlayer
    Then capture page screenshot

User can choose Payment options Page via Memocast Specials
    [Tags]    DEBUG 04.23
    #robot -d results -t "User can choose Payment options Page via Memocast Specials" tests/04_HomePage.robot
    ${element_language}  get text  css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language
    Focus   	                    xpath=.//span[contains(normalize-space(.), 'Memocast Specials')]
    #click element                  xpath=.//span[contains(normalize-space(.), 'Memocast Specials')]
    Element Should Be Visible   	xpath=.//a[contains(normalize-space(.), 'Payment options')]
    Then click element              xpath=.//a[contains(normalize-space(.), 'Payment options')]
    And Wait Until Page Contains   	Payment options
    Element Should Be Visible   	xpath=.//div[contains(normalize-space(@class), "pagetitle")]
    Wait Until Page Contains   	    Credit card
    Wait Until Page Contains   	    PayPal
    Wait Until Page Contains   	    WebMoney, Yandex.Money
    Wait Until Page Contains   	    Personal check
    Click Link   	                \#po_cc
    Click Link   	                \#po_paypal
    Click Link   	                \#po_russianmoney
    Click Link   	                \#po_bank
    Then capture page screenshot

User can choose Movies with subtitles film via Memocast Specials
    [Tags]    DEBUG 04.24
    #robot -d results -t "User can choose Movies with subtitles film via Memocast Specials" tests/04_HomePage.robot
    ${element_language}  get text  css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language
    Focus   	                    xpath=.//span[contains(normalize-space(.), 'Memocast Specials')]
    #click element                  xpath=.//span[contains(normalize-space(.), 'Memocast Specials')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Movies with subtitles')]
    Then click element              xpath=.//li[contains(normalize-space(.), 'Movies with subtitles')]
    And Wait Until Page Contains   	Browse Movies / All Movies
    COMMENT                         Service under construction
    Then capture page screenshot

User can choose Russian TV Channels via Memocast Specials
    [Tags]    DEBUG 04.25
    #robot -d results -t "User can choose Russian TV Channels via Memocast Specials" tests/04_HomePage.robot
    ${element_language}  get text  css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language
    Focus   	                    xpath=.//span[contains(normalize-space(.), 'Memocast Specials')]
    #click element                  xpath=.//span[contains(normalize-space(.), 'Memocast Specials')]
    Element Should Be Visible   	xpath=(.//li[contains(normalize-space(.), 'Russian TV Channels')])[1]
    Then click element              xpath=(.//li[contains(normalize-space(.), 'Russian TV Channels')])[1]
    Wait Until Element Is Visible   xpath=(.//span[contains(normalize-space(.),'Music Videos')]/following::img)[1]
    Wait Until Element Is Visible   xpath=(.//span[contains(normalize-space(.),'Music Videos')]/following::img)[3]
    Wait Until Element Is Visible   xpath=(.//span[contains(normalize-space(.),'Music Videos')]/following::img)[7]
    Wait Until Element Is Visible   xpath=(.//span[contains(normalize-space(.),'Music Videos')]/following::img)[last()]
    Page Should Contain Image   	http://live.russia.tv/i/small_logo/ch-logo-1.png
    Page Should Contain Image   	http://live.russia.tv/i/small_logo/ch-logo-3.png
    Page Should Contain Image   	http://live.russia.tv/i/small_logo/ch-logo-76.png
    Page Should Contain Image   	http://live.russia.tv/i/small_logo/ch-logo-199.png

    Set Selenium Speed	            5 seconds
    Then Click Image   	            http://live.russia.tv/i/small_logo/ch-logo-1.png
    Then capture page screenshot

    Then Click Image   	            http://live.russia.tv/i/small_logo/ch-logo-3.png
    #Wait Until Page Contains      	ТВ программа канала "Россия 24"  10
    Then capture page screenshot

    Then Click Image   	            http://live.russia.tv/i/small_logo/ch-logo-76.png
    #Wait Until Page Contains       ТВ программа канала "Москва 24"  10
    Then capture page screenshot

    Then Click Image   	            http://live.russia.tv/i/small_logo/ch-logo-199.png
    #Wait Until Page Contains      	ТВ программа канала "Радио Вести-FM"  10
    Then capture page screenshot

User can open and see menu Memocast Rubrics
    [Tags]    DEBUG 04.3
    #robot -d results -t "User can open and see menu Memocast Rubrics" tests/04_HomePage.robot
    Focus   	                    xpath=(.//span[contains(normalize-space(@class), "col-header")])[2]
    #click element  xpath=.//*[@id='cphMain_cphLeft_ctl01_divTags']/span
    Element Should Be Visible   	xpath=(.//span[contains(normalize-space(@class), "col-header")])[2]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Новогодние фильмы')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Романтически фильмы СССР')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Странные российские фильмы')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Страшилки советского кино')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Удивительное рядом')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Фильмы Эльдара Рязанова')]
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[2]
    element should not be visible   xpath=.//li[contains(normalize-space(.), 'Новогодние фильмы')]
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[2]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Новогодние фильмы')]

User can open, choose, change, and see content via menu Memocast Rubrics
    [Tags]    DEBUG 04.31
    #robot -d results -t "User can open, choose, change, and see content via menu Memocast Rubrics" tests/04_HomePage.robot
    Focus   	                    xpath=(.//span[contains(normalize-space(@class), "col-header")])[2]
    #click element  xpath=.//*[@id='cphMain_cphLeft_ctl01_divTags']/span
    Element Should Be Visible   	xpath=(.//span[contains(normalize-space(@class), "col-header")])[2]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Новогодние фильмы')]
    Set Selenium Speed	            2 seconds

    Then click element              xpath=.//li[contains(normalize-space(.), 'Новогодние фильмы')]
    Wait Until Page Contains        Рубрика "Новогодние фильмы"
    And element should be visible   css=#cphMain_cphMain_repMovies_ctl00_0_divImgThumb_0
    Then click element              css=#cphMain_cphMain_repMovies_ctl00_0_divImgThumb_0
    Then capture page screenshot
    Then go back

    Then click element              xpath=.//li[contains(normalize-space(.), 'Романтически фильмы СССР')]
    Wait Until Page Contains        Рубрика "Романтически фильмы СССР"
    And element should be visible   css=#cphMain_cphMain_repMovies_ctl00_0_divImgThumb_0
    Then click element              css=#cphMain_cphMain_repMovies_ctl00_0_divImgThumb_0
    Then capture page screenshot
    Then go back

    Then click element              xpath=.//li[contains(normalize-space(.), 'Странные российские фильмы')]
    Wait Until Page Contains        Рубрика "Странные российские фильмы"
    And element should be visible   css=#cphMain_cphMain_repMovies_ctl00_0_divImgThumb_0
    Then click element              css=#cphMain_cphMain_repMovies_ctl00_0_divImgThumb_0
    Then capture page screenshot
    Then go back

    Then click element              xpath=.//li[contains(normalize-space(.), 'Страшилки советского кино')]
    Wait Until Page Contains        Рубрика "Страшилки советского кино"
    And element should be visible   css=#cphMain_cphMain_repMovies_ctl00_0_divImgThumb_0
    Then click element              css=#cphMain_cphMain_repMovies_ctl00_0_divImgThumb_0
    Then capture page screenshot
    Then go back

    Then click element              xpath=.//li[contains(normalize-space(.), 'Удивительное рядом')]
    Wait Until Page Contains        Рубрика "Удивительное рядом"
    And element should be visible   css=#cphMain_cphMain_repMovies_ctl00_0_divImgThumb_0
    Then click element              css=#cphMain_cphMain_repMovies_ctl00_0_divImgThumb_0
    Then capture page screenshot
    Then go back

    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Фильмы Эльдара Рязанова')]
    Element Should Be Visible   	xpath=.//a[contains(normalize-space(.), 'Фильмы Эльдара Рязанова')]
    Mouse Over   	                xpath=.//a[contains(normalize-space(.), 'Фильмы Эльдара Рязанова')]
    #Mouse Down On Link   	        xpath=.//a[contains(normalize-space(.), 'Фильмы Эльдара Рязанова')]
    Click Link   	                xpath=.//a[contains(normalize-space(.), 'Фильмы Эльдара Рязанова')]
    Wait Until Page Contains   	    Рубрика "Фильмы Эльдара Рязанова"
    And element should be visible   css=#cphMain_cphMain_repMovies_ctl00_0_divImgThumb_0
    Then click element              css=#cphMain_cphMain_repMovies_ctl00_0_divImgThumb_0
    Then capture page screenshot

User can open and see menu Memocast Movies
    [Tags]    DEBUG 04.4
    #robot -d results -t "User can open and asee menu Memocast Movies" tests/04_HomePage.robot
    ${element_language}  get text  css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language
    Focus   	                    xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]
    Element Should Be Visible   	xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]
    Element Should Be Visible   	xpath=(.//li[contains(normalize-space(.), 'All Videos')])[1]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Action/Adventure')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Anime')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Cartoons')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Classics')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Comedy')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Cooking')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Crime/Gangster')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Detective')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Documentary')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Drama')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Education')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Experimental Art')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Favorites')]
    Element Should Be Visible   	xpath=(.//li[contains(normalize-space(.), 'Free Collection')])[last()]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Historical/Epics')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Horror')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Humor')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Kids/Family')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Musicals / Music')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'New releases')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Olympic Games Sochi 2014')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Opera / Ballet')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Politics')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Religion')]
    Element Should Be Visible   	xpath=(.//li[contains(normalize-space(.), 'Romance')])[1]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Science Fiction / Fantasy')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Short Films')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Social Initiatives')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Sports / Fitness')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Television')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Theatre')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Thriller')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Turkish Serials')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Tutorials')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'TV News')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'TV Shows (Serials)')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'USA Movies')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'War')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Western')]
    Element Should Be Visible   	xpath=(.//li[contains(normalize-space(.), 'Oscar nominees')])[last()]
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]
    element should not be visible   xpath=.//li[contains(normalize-space(.), 'Classics')]
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Classics')]

User can open and see menu Memocast Music Videos
    [Tags]    DEBUG 04.5
    #robot -d results -t "User can open and see menu Memocast Music Videos" tests/04_HomePage.robot
    ${element_language}  get text  css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language
    Focus   	                    xpath=(.//span[contains(normalize-space(@class), "col-header")])[4]
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[4]
    Element Should Be Visible   	xpath=(.//span[contains(normalize-space(@class), "col-header")])[4]
    Element Should Be Visible   	left-menu-music
    Element Should Be Visible   	xpath=(.//li[contains(normalize-space(.), 'All Videos')])[last()]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Acoustic')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Bard')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Blues')]
    Element Should Be Visible   	xpath=(.//li[contains(normalize-space(.), 'Christian')])[1]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Christian rap')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Classical / Классика')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Concerts')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Country')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Electronic / Dance')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Folk')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Funk')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Hip Hop')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Jazz')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Karaoke')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Latin')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'New Age')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Pop')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'R&B')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Rap')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Reggae')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Rock')]
    Element Should Be Visible   	xpath=(.//li[contains(normalize-space(.), 'Romance')])[last()]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Soul')]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Tango')]
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[4]
    element should not be visible   xpath=.//li[contains(normalize-space(.), 'Jazz')]
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[4]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Jazz')]

*** Keywords ***
