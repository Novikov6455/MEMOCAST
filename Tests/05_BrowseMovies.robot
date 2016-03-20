*** Settings ***
Documentation    Suite description: Browse Movies Page of site also uses left part Navigation menu
Library  Selenium2Library  1.5  10	    # Sets default timeout to 1.5 seconds and default implicit_wait to 10 seconds
Resource  ../Resources/Common.robot     # Common resources keep in Common.robot
Library  ../Resources/Common.py
# executable Terminal string
#robot -d results tests/05_BrowseMovies.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Variables ***
# Tester can reset GLOBAL Variables for particular TestSuit
#${BROWSER} =  ff                    # ie=Internet Explorer, ff=FireFox, gc=Google Chrome
#${START_URL} =  http://www2.memocast.com
#${USER_NAME} =  novikov6455@gmail.com
#${PASSWORD} =  5906455
${FILM_TO_TRY} =  admiral 2008
${active_player} =  divMemocastFlashPlayer
${orig timeout} =  0.5 seconds
${constant_part_title} =   Browse / Music Videos /
${start_index} =  1
${step} =  1
${finish_categories_index} =  65

*** Test Cases ***
User can use Submenu items in Browse Movies page
    [Tags]    DEBUG 05.1
    #robot -d results -t "User can use Submenu items in Browse Movies page" tests/05_BrowseMovies.robot
    Element Should Be Visible   	ctl34_A1
    When Click Link                 xpath=.//a[contains(normalize-space(.), 'Browse Movies')]
    Then wait until page contains   Browse Movies / All Movies

    When Mouse Over                 xpath=.//a[contains(normalize-space(.), 'Browse Movies')]
    Page Should Contain   	        Browse Movies
    Page Should Contain   	        New Arrivals
    Page Should Contain   	        Top Videos
    Page Should Contain   	        All Movie Comments
    Page Should Contain   	        Request a Movie
    Page Should Contain   	        History
    Page Should Contain   	        My Playlist

    Focus   	                    xpath=.//a[contains(normalize-space(.), 'Browse Movies')]
    Focus   	                    xpath=.//a[contains(normalize-space(.), 'New Arrivals')]
    Click Link   	                xpath=.//a[contains(normalize-space(.), 'New Arrivals')]
    Wait Until Page Contains   	    Sort By:  3
    Wait Until Page Contains   	    New Arrivals

    When Mouse Over                 xpath=.//a[contains(normalize-space(.), 'Browse Movies')]
    Focus   	                    xpath=.//a[contains(normalize-space(.), 'Top Videos')]
    Click Link   	                xpath=.//a[contains(normalize-space(.), 'Top Videos')]
    Wait Until Page Contains   	    Top of the day  3
    Wait Until Page Contains   	    Week
    Wait Until Page Contains   	    Month

    When Mouse Over                 xpath=.//a[contains(normalize-space(.), 'Browse Movies')]
    Focus   	                    xpath=.//a[contains(normalize-space(.), 'All Movie Comments')]
    Click Link   	                xpath=.//a[contains(normalize-space(.), 'All Movie Comments')]
    Wait Until Page Contains    	All Movie Comments  3

    When Mouse Over                 xpath=.//a[contains(normalize-space(.), 'Browse Movies')]
    Focus   	                    xpath=.//a[contains(normalize-space(.), 'Request a Movie')]
    Click Link   	                xpath=.//a[contains(normalize-space(.), 'Request a Movie')]
    Wait Until Page Contains   	    Request a Movie  3

    When Click Link                 xpath=.//a[contains(normalize-space(.), 'Browse Movies')]
    Then wait until page contains   Browse Movies / All Movies
    When Mouse Over                 xpath=.//a[contains(normalize-space(.), 'Browse Movies')]
    Focus   	                    xpath=.//a[contains(normalize-space(.), 'History')]
    Click Link   	                xpath=.//a[contains(normalize-space(.), 'History')]
    Wait Until Page Contains   	    Recently watched movies  6
    Go back

    When Mouse Over                 xpath=.//a[contains(normalize-space(.), 'Browse Movies')]
    Focus   	                    xpath=(.//a[contains(normalize-space(@class), "playlistlink")])[1]
    Click Link   	                xpath=(.//a[contains(normalize-space(@class), "playlistlink")])[1]
    Wait Until Page Contains   	    My default playlist  6

User can use Left side Menu to set Categories in search filtr of Browse Movies page
    [Tags]    DEBUG 05.2
    #robot -d results -t "User can use Left side Menu to set Categories in search filtr of Browse Movies page" tests/05_BrowseMovies.robot
    Element Should Be Visible   	ctl34_A1
    ${element_language}  get text   css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language

    When Click Link                 xpath=.//a[contains(normalize-space(.), 'Browse Movies')]
    Then wait until page contains   Browse Movies / All Movies

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

    Set Selenium Speed	            1 seconds

    click element   	            xpath=.//li[contains(normalize-space(.), 'Action/Adventure')]
    Wait Until Page Contains   	    Browse / Movies / Action/Adventure
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Anime')]
    #click element                  	xpath=.//li[contains(normalize-space(.), 'Anime')]
    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[3]/a
    Wait Until Page Contains   	    Browse / Movies / Anime
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[4]/a
    Wait Until Page Contains   	    Browse / Movies / Cartoons
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    #click element   	            xpath=.//li[contains(normalize-space(.), 'Classics')]
    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[5]/a
    Wait Until Page Contains    	Browse / Movies / Classics
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[6]/a
    Wait Until Page Contains   	    Browse / Movies / Comedy
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[7]/a
    Wait Until Page Contains   	    Browse / Movies / Cooking
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[8]/a
    Wait Until Page Contains   	    Browse / Movies / Crime/Gangster
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]


    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[9]/a
    Wait Until Page Contains   	    Browse / Movies / Detective
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[10]/a
    Wait Until Page Contains   	    Browse / Movies / Documentary
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[11]/a
    Wait Until Page Contains   	    Browse / Movies / Drama
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[12]/a
    Wait Until Page Contains   	    Browse / Movies / Education
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[13]/a
    Wait Until Page Contains    	Browse / Movies / Experimental Art
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[14]/a
    Wait Until Page Contains   	    Browse / Movies / Favorites
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[15]/a
    Wait Until Page Contains   	    Browse / Movies / Free Collection
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[16]/a
    Wait Until Page Contains   	    Browse / Movies / Historical/Epics
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[17]/a
    Wait Until Page Contains   	Browse / Movies / Horror
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[18]/a
    Wait Until Page Contains   	Browse / Movies / Humor
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[19]/a
    Wait Until Page Contains   	Browse / Movies / Kids/Family
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[20]/a
    Wait Until Page Contains   	Browse / Movies / Musicals / Music
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[21]/a
    Wait Until Page Contains   	Browse / Movies / New releases
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[22]/a
    Wait Until Page Contains   	Browse / Movies / Olympic Games Sochi 2014
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[23]/a
    Wait Until Page Contains   	Browse / Movies / Opera / Ballet
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[24]/a
    Wait Until Page Contains   	Browse / Movies / Politics
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[25]/a
    Wait Until Page Contains   	Browse / Movies / Religion
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[26]/a
    Wait Until Page Contains   	Browse / Movies / Romance
     click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[27]/a
    Wait Until Page Contains   	Browse / Movies / Science Fiction / Fantasy
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[28]/a
    Wait Until Page Contains   	Browse / Movies / Short Films
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[29]/a
    Wait Until Page Contains   	Browse / Movies / Social Initiatives
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[30]/a
    Wait Until Page Contains   	Browse / Movies / Sports / Fitness
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[31]/a
    Wait Until Page Contains   	Browse / Movies / Television
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[32]/a
    Wait Until Page Contains   	Browse / Movies / Theatre
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[33]/a
    Wait Until Page Contains   	Browse / Movies / Thriller
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[34]/a
    Wait Until Page Contains   	Browse / Movies / Turkish Serials
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[35]/a
    Wait Until Page Contains   	Browse / Movies / Tutorials
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[36]/a
    Wait Until Page Contains   	Browse / Movies / TV News
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[37]/a
    Wait Until Page Contains   	Browse / Movies / TV Shows (Serials)
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[38]/a
    Wait Until Page Contains   	Browse / Movies / USA Movies
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[39]/a
    Wait Until Page Contains   	Browse / Movies / War
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[40]/a
    Wait Until Page Contains   	Browse / Movies / Western
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[3]

    Click Link   	                xpath=.//*[@id='left-menu-movies']/li[41]/a
    Wait Until Page Contains   	Browse / Movies / Oscar nominees

User can use Left side Menu to set Categories in search filtr for Music Videos
    [Tags]    DEBUG 05.3
    #robot -d results -t "User can use Left side Menu to set Categories in search filtr for Music Videos" tests/05_BrowseMovies.robot
    Element Should Be Visible   	ctl34_A1
    ${element_language}  get text   css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language

    When Click Link                 xpath=.//a[contains(normalize-space(.), 'Browse Movies')]
    Then wait until page contains   Browse Movies / All Movies  3

    Focus   	                    xpath=(.//span[contains(normalize-space(@class), "col-header")])[4]
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[4]
    Element Should Be Visible   	xpath=(.//span[contains(normalize-space(@class), "col-header")])[4]
    #Click Element   	            xpath=(.//span[contains(normalize-space(@class), "col-header")])[last()]
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

    Set Selenium Speed	            1 seconds
    click element   	            xpath=.//*[@id='left-menu-music']/li[1]/a
    Wait Until Page Contains   	    Browse / Music Videos
    click element                   xpath=(.//span[contains(normalize-space(@class), "col-header")])[4]
    Element Should Be Visible   	xpath=.//li[contains(normalize-space(.), 'Acoustic')]

    : FOR    ${INDEX}    IN RANGE    2    26
    \    ${partial_page_title}=      get text  xpath=.//*[@id='left-menu-music']/li[${INDEX}]/a
    \    ${page_title}=  catenate    ${constant_part_title}    ${partial_page_title}
    \    click link                  xpath=.//*[@id='left-menu-music']/li[${INDEX}]/a
    \    wait until page contains    ${page_title}
    \    click element               xpath=(.//span[contains(normalize-space(@class), "col-header")])[4]

User can search and see content in random order
    [Tags]    DEBUG 05.4
    #robot -d results -t "User can search and see content in random order" tests/05_BrowseMovies.robot

    COMMENT         Check Language of site
    Element Should Be Visible   	ctl34_A1
    ${element_language}  get text   css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language
    Set Selenium Speed	            1 seconds

    COMMENT         Choose option Browse Movies
    When Click Link                 xpath=.//a[contains(normalize-space(.), 'Browse Movies')]
    Wait until page contains element  xpath=.//*[@id='cphMain_cphMain_ctl00_ddlAllCategory']

    COMMENT         Choose Random Category
    click element                   xpath=.//*[@id='cphMain_cphMain_ctl00_ddlAllCategory']
    ${category_index}=  Generate random number  ${start_index}  ${finish_categories_index}  ${step}
    ${category_text}=   get text  xpath=.//*[@id='cphMain_cphMain_ctl00_ddlAllCategory']/option[${category_index}]
    click element                   xpath=.//*[@id='cphMain_cphMain_ctl00_ddlAllCategory']/option[${category_index}]
    WAIT UNTIL PAGE CONTAINS  ${category_text}

    COMMENT         Choose Random Alphabet letter for search filter
    #And wait until page contains element  xpath=.//*[@id='content']/div/div[2]/div/div[2]/ul[1]
    And wait until page contains element  xpath=.//*[@id='content']/div/div[2]/div/div[2]/ul[1]/li[1]/a
    ${finish_alphabet_index}  Get matching xpath count  .//*[@id='content']/div/div[2]/div/div[2]/ul[1]/li[*]/a
    ${alphabet_index}  Generate random number  ${start_index}  ${finish_alphabet_index}  ${step}
    click element                   xpath=.//*[@id='content']/div/div[2]/div/div[2]/ul[1]/li[${alphabet_index}]/a

    COMMENT         Choose Random Year of search filter
    ${finish_year_index}  get matching xpath count  .//*[@id='content']/div/div[2]/div/div[2]/ul[2]/li[*]/a
    # exampl direct access to the Common.py python library (without keywords Robot Framework)
    ${year_index}=  Rundom_Number  ${start_index}  ${finish_year_index}  ${step}
    click element                   xpath=.//*[@id='content']/div/div[2]/div/div[2]/ul[2]/li[${year_index}]/a
    wait until page contains element  xpath=.//*[@id='content']/div/div[2]/div/div[1]

    COMMENT         Result Screenshot
    capture page screenshot

*** Keywords ***
