*** Settings ***
Documentation    Suite description: Page My profile
Library  Selenium2Library  2  6	    # Sets default timeout to 1.5 seconds and default implicit_wait to 5 seconds
Library  FakerLibrary
Library	 OperatingSystem
Resource  ../Resources/Common.robot     # Common resources keep in Common.robot

# executable Terminal string
#robot -d results tests/06_MyProfile.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Variables ***
# Tester can reset GLOBAL Variables for particular TestSuit
#${BROWSER} =  ff                    # ie=Internet Explorer, ff=FireFox, gc=Google Chrome
#${START_URL} =  http://www2.memocast.com
#${LOGIN}  novikov6455@gmail.com
#${PASSWORD} =  5906455
#C:\\development\\memocast-test\\Resources\\usericon2.jpg
${disk_directory} =  C:/\\
${project_directory} =  development\\
${title_directory} =  memocast-test\\
${resurs_directory} =  Resourses\\
${images_directory}
${file_1} =  usericon1.jpg
${file_2} =  usericon2.jpg
${file_path1} =  C:\\development\\memocast-test\\Resources\\usericon1.jpg
${file_path2} =  C:\\development\\memocast-test\\Resources\\usericon2.jpg
${label_number} =  1


*** Test Cases ***
Page My_Profile should contains
    [Tags]    DEBUG 06.01
    #robot -d results -t "Page My_Profile should contains" tests/06_MyProfile.robot

    COMMENT         Check Language of site
    Element Should Be Visible   	ctl34_A1
    ${element_language}  get text   css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language

    COMMENT         Navigate to My Profile Page
    Focus   	                    xpath=.//a[contains(normalize-space(.), 'My Profile')]
    click element                   xpath=.//a[contains(normalize-space(.), 'My Profile')]
    Wait Until Page Contains   	    My Memocast Updates

    COMMENT         My Profile Page should contains
    Page Should Contain   	My Profile
    Page Should Contain   	My Account
    Page Should Contain   	Change Password
    Page Should Contain   	My Messages
    Page Should Contain   	Personal Settings
    Page Should Contain   	My Playlist
    Page Should Contain   	Updates
    Page Should Contain   	Friends
    Page Should Contain   	Messages
    Page Should Contain   	Playlists
    Page Should Contain   	Subscription
    Page Should Contain   	Settings
    Page Should Contain   	About me
    Page Should Contain Link   	xpath=.//a[contains(normalize-space(.), 'My Profile')]
    Page Should Contain Link   	xpath=.//a[contains(normalize-space(.), 'My Account')]
    Page Should Contain Link   	xpath=.//a[contains(normalize-space(.), 'Change Password')]
    Page Should Contain Link   	xpath=.//a[contains(normalize-space(.), 'My Messages')]
    Page Should Contain Link   	xpath=.//a[contains(normalize-space(.), 'Personal Settings')]
    Page Should Contain Link   	xpath=.//a[contains(normalize-space(.), 'Updates')]
    Page Should Contain Link   	xpath=.//a[contains(normalize-space(.), 'Friends')]
    Page Should Contain Link   	xpath=(.//a[contains(normalize-space(.), 'Messages')])[last()]
    Page Should Contain Link   	xpath=.//a[contains(normalize-space(.), 'Playlists')]
    Page Should Contain Link   	xpath=.//a[contains(normalize-space(.), 'Subscription')]
    Page Should Contain Link   	xpath=(.//a[contains(normalize-space(.), 'Settings')])[last()]
    Page Should Contain Link   	xpath=.//a[contains(normalize-space(.), 'About me')]

User can see own Account options
    [Tags]    DEBUG 06.10
    #robot -d results -t "User can see own Account options" tests/06_MyProfile.robot

    COMMENT         Check Language of site
    Element Should Be Visible   	ctl34_A1
    ${element_language}  get text   css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language

    COMMENT         Navigate to My Profile Page
    Focus   	                    xpath=.//a[contains(normalize-space(.), 'My Profile')]
    mouse over                      xpath=.//a[contains(normalize-space(.), 'My Profile')]
    #click element                   xpath=.//a[contains(normalize-space(.), 'My Profile')]
    Wait Until Element Is Visible   xpath=.//a[contains(normalize-space(.), 'My Account')]
    Focus                           xpath=.//a[contains(normalize-space(.), 'My Account')]
    click element                   xpath=.//a[contains(normalize-space(.), 'My Account')]
    Wait Until Page Contains   	    My Memocast Updates

    Element Should Be Visible   	xpath=(.//div[contains(normalize-space(@class), "user-av")])[*]
    Element Should Be Visible   	cphMain_cphLeft_ctl00_avatar
    Element Should Be Visible   	xpath=.//a[contains(normalize-space(.), 'Updates')]
    Element Should Be Visible   	xpath=.//a[contains(normalize-space(.), 'Friends')]
    Element Should Be Visible   	xpath=(.//a[contains(normalize-space(.), 'Messages')])[last()]
    Element Should Be Visible   	xpath=.//a[contains(normalize-space(.), 'Playlists')]
    Element Should Be Visible   	xpath=.//a[contains(normalize-space(.), 'Subscription')]
    Element Should Be Visible   	xpath=(.//a[contains(normalize-space(.), 'Settings')])[last()]
    Element Should Be Visible   	xpath=.//a[contains(normalize-space(.), 'About me')]

User can Change their password
    [Tags]    DEBUG 06.11
    #robot -d results -t "User can Change their password" tests/06_MyProfile.robot

    COMMENT         Check Language of site
    Element Should Be Visible   	ctl34_A1
    ${element_language}  get text   css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language

    COMMENT         Navigate to My Profile Page
    Focus   	                    xpath=.//a[contains(normalize-space(.), 'My Profile')]
    click element                   xpath=.//a[contains(normalize-space(.), 'My Profile')]
    Then WAIT UNTIL PAGE DOES NOT CONTAIN    JUST WAIT   2
    Focus                           xpath=.//a[contains(normalize-space(.), 'My Profile')]
    mouse over                      xpath=.//a[contains(normalize-space(.), 'My Profile')]
    wait until element is visible  	xpath=.//a[contains(normalize-space(.), 'Change Password')]
    mouse over                      xpath=.//a[contains(normalize-space(.), 'Change Password')]
    click element                   xpath=.//a[contains(normalize-space(.), 'Change Password')]
    #Click Link   	                Change Password
    Then WAIT UNTIL PAGE DOES NOT CONTAIN    JUST WAIT   2
    Wait Until Page Contains   	    Password Change

    COMMENT         Password change test maintained in separate test suite
    capture page screenshot

User can work with their messages
    [Tags]    DEBUG 06.12
    #robot -d results -t "User can work with their messages" tests/06_MyProfile.robot

    COMMENT         Check Language of site
    Element Should Be Visible   	ctl34_A1
    ${element_language}  get text   css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language

    COMMENT         Navigate to My Profile Page
    Focus   	                    xpath=.//a[contains(normalize-space(.), 'My Profile')]
    click element                   xpath=.//a[contains(normalize-space(.), 'My Profile')]
    Then WAIT UNTIL PAGE DOES NOT CONTAIN    JUST WAIT   2
    Focus                           xpath=.//a[contains(normalize-space(.), 'My Profile')]
    mouse over                      xpath=.//a[contains(normalize-space(.), 'My Profile')]
    wait until element is visible  	xpath=.//a[contains(normalize-space(.), 'My Messages')]
    mouse over                      xpath=.//a[contains(normalize-space(.), 'My Messages')]
    Click Link   	                My Messages
    Wait Until Page Contains   	    Messages
    capture page screenshot

User can exchange their Personal Settings
    [Tags]    DEBUG 06.13
    #robot -d results -t "User can exchange their Personal Settings" tests/06_MyProfile.robot

    COMMENT         Check Language of site
    Element Should Be Visible   	ctl34_A1
    ${element_language}  get text   css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language

    COMMENT         Navigate to My Profile Page
    Focus   	                    xpath=.//a[contains(normalize-space(.), 'My Profile')]
    click element                   xpath=.//a[contains(normalize-space(.), 'My Profile')]
    Wait Until Element Is Visible   xpath=.//*[@id='cphMain_cphLeft_ctl00_avatar']

    COMMENT         Navigate to Personal Setting submenu
    Focus                           xpath=.//a[contains(normalize-space(.), 'My Profile')]
    MOUSE OVER                      xpath=.//a[contains(normalize-space(.), 'My Profile')]
    wait until element is visible  	xpath=.//a[contains(normalize-space(.), 'Personal Settings')]
    MOUSE OVER                      xpath=.//a[contains(normalize-space(.), 'Personal Settings')]
    #mouse down on link              xpath=.//a[contains(normalize-space(.), 'Personal Settings')]
    #Click Link   	                Personal Settings
    click element                   xpath=.//a[contains(normalize-space(.), 'Personal Settings')]
    Then WAIT UNTIL PAGE DOES NOT CONTAIN    JUST WAIT   3

    Wait Until Page Contains Element   	xpath=.//*[@id='cphMain_cphMain_content_btUpdate']

    Element Should Be Enabled   	ctl00$ctl00$ctl00$cphMain$cphMain$content$tbFirstName
    Element Should Be Enabled   	ctl00$ctl00$ctl00$cphMain$cphMain$content$tbLastName
    Element Should Be Enabled   	ctl00$ctl00$ctl00$cphMain$cphMain$content$tbBirthDate
    Element Should Be Enabled   	ctl00$ctl00$ctl00$cphMain$cphMain$content$tbCity
    Element Should Be Enabled   	ctl00$ctl00$ctl00$cphMain$cphMain$content$tbRegion
    Element Should Be Enabled   	ctl00$ctl00$ctl00$cphMain$cphMain$content$tbCountry
    Element Should Be Enabled   	ctl00$ctl00$ctl00$cphMain$cphMain$content$btUpdate

    capture page screenshot

User can see their Personal playlists
    [Tags]    DEBUG 06.14
    #robot -d results -t "User can see their Personal playlists" tests/06_MyProfile.robot

    COMMENT         Check Language of site
    Element Should Be Visible   	ctl34_A1
    ${element_language}  get text   css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language

    COMMENT         Navigate to My Profile Page
    Focus   	                    xpath=.//a[contains(normalize-space(.), 'My Profile')]
    click element                   xpath=.//a[contains(normalize-space(.), 'My Profile')]
    Wait Until Element Is Visible   xpath=.//*[@id='cphMain_cphLeft_ctl00_avatar']

    COMMENT         Navigate to My playlist submenu
    Focus                           xpath=.//a[contains(normalize-space(.), 'My Profile')]
    MOUSE OVER                      xpath=.//a[contains(normalize-space(.), 'My Profile')]
    wait until element is visible  	xpath=.//*[@id='ctl34_A10']
    MOUSE OVER                      xpath=.//*[@id='ctl34_A10']
    #mouse down on link              xpath=.//*[@id='ctl34_A10']
    click element                   xpath=.//*[@id='ctl34_A10']
    Then WAIT UNTIL PAGE DOES NOT CONTAIN    JUST WAIT   2

    Wait Until Page Contains Element   	xpath=.//*[@id='cphMain_cphMain_lblTitle']  3
    capture page screenshot

User can see their Personal Updates
    [Tags]    DEBUG 06.15
    #robot -d results -t "User can see their Personal Updates" tests/06_MyProfile.robot

    COMMENT         Check Language of site
    Element Should Be Visible   	ctl34_A1
    ${element_language}  get text   css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language

    COMMENT         Navigate to My Profile Page
    Focus   	                    xpath=.//a[contains(normalize-space(.), 'My Profile')]
    click element                   xpath=.//a[contains(normalize-space(.), 'My Profile')]
    Then WAIT UNTIL PAGE DOES NOT CONTAIN    JUST WAIT   1

    COMMENT         Navigate to left Updates submenu
    Focus                           xpath=.//*[@id='content']/div/div[1]/ul/li[1]/a
    click element                   xpath=.//*[@id='content']/div/div[1]/ul/li[1]/a
    Then WAIT UNTIL PAGE DOES NOT CONTAIN    JUST WAIT   1
    Wait Until Page Contains Element   	xpath=.//*[@id='content']/div/div[2]/div[1]/span
    capture page screenshot

User can see their Personal Friends
    [Tags]    DEBUG 06.16
    #robot -d results -t "User can see their Personal Friends" tests/06_MyProfile.robot

    COMMENT         Check Language of site
    Element Should Be Visible   	ctl34_A1
    ${element_language}  get text   css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language

    COMMENT         Navigate to My Profile Page
    Focus   	                    xpath=.//a[contains(normalize-space(.), 'My Profile')]
    click element                   xpath=.//a[contains(normalize-space(.), 'My Profile')]
    Wait Until Element Is Visible   xpath=.//*[@id='cphMain_cphLeft_ctl00_avatar']

    COMMENT         Navigate to left Friends submenu
    Focus                           xpath=.//*[@id='content']/div/div[1]/ul/li[2]/a
    click element                   xpath=.//*[@id='content']/div/div[1]/ul/li[2]/a
    Wait Until Page Contains Element   	xpath=.//*[@id='cphMain_cphMain_content_panNoFriends']/p/span
    capture page screenshot

User can see their Messages
    [Tags]    DEBUG 06.16
    #robot -d results -t "User can see their Messages" tests/06_MyProfile.robot

    COMMENT         Check Language of site
    Element Should Be Visible   	ctl34_A1
    ${element_language}  get text   css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language

    COMMENT         Navigate to My Profile Page
    Focus   	                    xpath=.//a[contains(normalize-space(.), 'My Profile')]
    click element                   xpath=.//a[contains(normalize-space(.), 'My Profile')]
    Wait Until Element Is Visible   xpath=.//*[@id='cphMain_cphLeft_ctl00_avatar']  3

    COMMENT         Navigate to left Messages submenu
    Focus                           xpath=.//*[@id='content']/div/div[1]/ul/li[3]/a
    click element                   xpath=.//*[@id='content']/div/div[1]/ul/li[3]/a
    Wait Until Page Contains Element   	xpath=.//*[@id='content']/div/div[2]/div[1]/span
    capture page screenshot

User can upgrade their Subscription
    [Tags]    DEBUG 06.17
    #robot -d results -t "User can upgrade their Subscription" tests/06_MyProfile.robot

    COMMENT         Check Language of site
    Element Should Be Visible   	ctl34_A1
    ${element_language}  get text   css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language

    COMMENT         Navigate to My Profile Page
    Focus   	                    xpath=.//a[contains(normalize-space(.), 'My Profile')]
    click element                   xpath=.//a[contains(normalize-space(.), 'My Profile')]
    Wait Until Element Is Visible   xpath=.//*[@id='cphMain_cphLeft_ctl00_avatar']  5

    COMMENT         Navigate to left Messages submenu
    Focus                           xpath=.//*[@id='content']/div/div[1]/ul/li[5]/a
    click element                   xpath=.//*[@id='content']/div/div[1]/ul/li[5]/a
    Wait Until Page Contains Element   	xpath=.//*[@id='content']/div/div[2]/div[1]/span

    COMMENT         Subscription change test maintained in separate test suite
    capture page screenshot

User can update information about Youself
    [Tags]    DEBUG 06.18
    #robot -d results -t "User can update information about Youself" tests/06_MyProfile.robot

    COMMENT         Check Language of site
    Element Should Be Visible   	ctl34_A1
    ${element_language}  get text   css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language

    COMMENT         Navigate to My Profile Page
    Focus   	                    xpath=.//a[contains(normalize-space(.), 'My Profile')]
    click element                   xpath=.//a[contains(normalize-space(.), 'My Profile')]
    Wait Until Element Is Visible   xpath=.//*[@id='cphMain_cphLeft_ctl00_avatar']  10

    COMMENT         Navigate to left About me submenu
    Focus                           xpath=.//*[@id='content']/div/div[1]/ul/li[7]/a
    click element                   xpath=.//*[@id='content']/div/div[1]/ul/li[7]/a
    Wait Until Page Contains Element   	xpath=.//*[@id='cphMain_cphMain_content_Title1_ctriTitle']/span

    COMMENT         Review and exchange Personal information
    click element                   xpath=.//*[@id='content']/div/div[2]/div[2]/a
    Wait Until Page Contains Element   	ctl01

    COMMENT         Set and Type test variable for input form
    ${NewFirstName} =  FakerLibrary.First Name
    ${NewLastName} =   FakerLibrary.Last Name
    ${Date} =       FakerLibrary.Date
    ${City} =       FakerLibrary.City
    ${State} =      FakerLibrary.State
    ${Country} =    FakerLibrary.Country
    #${FirstName}    First Name
    Log    ${NewFirstName}
    Log    ${NewLastName}

    input text  xpath=.//*[@id='cphMain_cphMain_content_tbFirstName']  ${NewFirstName}
    input text  xpath=.//*[@id='cphMain_cphMain_content_tbLastName']  ${NewLastName}
    input text  xpath=.//*[@id='cphMain_cphMain_content_tbBirthDate']  ${Date}

    ${label_number} =   FakerLibrary.Random Int  1  3
    click element  xpath=.//*[@id='cphMain_cphMain_content_ddlGender']/label[${label_number}]/span

    input text  xpath=.//*[@id='cphMain_cphMain_content_tbCity']  ${City}
    input text  xpath=.//*[@id='cphMain_cphMain_content_tbRegion']  ${State}
    input text  xpath=.//*[@id='cphMain_cphMain_content_tbCountry']  ${Country}

    Wait Until Page Contains Element   	ctl00$ctl00$ctl00$cphMain$cphMain$content$btUpdate
    Click Button   	ctl00$ctl00$ctl00$cphMain$cphMain$content$btUpdate
    capture page screenshot

    COMMENT         Return First conditions
    COMMENT         Navigate to left About me submenu
    click element                   xpath=.//*[@id='content']/div/div[1]/ul/li[7]/a
    Wait Until Page Contains Element   	xpath=.//*[@id='cphMain_cphMain_content_Title1_ctriTitle']/span

    COMMENT         Review and exchange Personal information to OLD CONDITIONS
    click element                   xpath=.//*[@id='content']/div/div[2]/div[2]/a
    Wait Until Page Contains Element   	ctl01

    COMMENT         Set and Type test variable for input form
    input text  xpath=.//*[@id='cphMain_cphMain_content_tbFirstName']  ${FIRST_NAME}
    input text  xpath=.//*[@id='cphMain_cphMain_content_tbLastName']  ${LAST_NAME}
    ${label_number}  set variable  2
    click element  xpath=.//*[@id='cphMain_cphMain_content_ddlGender']/label[${label_number}]/span
    Wait Until Page Contains Element   	ctl00$ctl00$ctl00$cphMain$cphMain$content$btUpdate
    Click Button   	ctl00$ctl00$ctl00$cphMain$cphMain$content$btUpdate
    capture page screenshot
    WAIT UNTIL PAGE CONTAINS  ${USER_NAME}

User can update their foto
    [Tags]    DEBUG 06.19
    #robot -d results -t "User can update their foto" tests/06_MyProfile.robot

    COMMENT         Check Language of site
    Element Should Be Visible   	ctl34_A1
    ${element_language}  get text   css=#ctl34_A1
    run keyword if  '${element_language}' == 'Главная'   Set English language

    COMMENT         Navigate to My Profile Page
    click element                   xpath=.//a[contains(normalize-space(.), 'My Profile')]
    Wait Until Element Is Visible   xpath=.//*[@id='cphMain_cphLeft_ctl00_avatar']  10

    COMMENT         Navigate to left About me submenu
    click element                   xpath=.//*[@id='content']/div/div[1]/ul/li[7]/a
    Wait Until Page Contains Element   	xpath=.//*[@id='cphMain_cphMain_content_Title1_ctriTitle']/span

    COMMENT         Review and exchange Personal information
    click element                   xpath=.//*[@id='content']/div/div[2]/div[3]/a
    Wait Until Page Contains Element   	ctl01

    COMMENT         Replace avatar picture in input form
     #C:\development\memocast-test\Resources
    wait until page contains element  xpath=.//*[@id='cphMain_cphMain_content_fuImage']
    #click element  xpath=.//*[@id='cphMain_cphMain_content_fuImage']
    #${file_path} =  Join Path  ${disk_directory}  ${project_directory}  ${title_directory}  ${resurs_directory}  ${file_2}
    #Choose File	 xpath=.//*[@id='cphMain_cphMain_content_fuImage']	C:\\development\\memocast-test\\Resources\\usericon2.jpg
    Choose File	 xpath=.//*[@id='cphMain_cphMain_content_fuImage']	${file_path2}
    click button  xpath=.//*[@id='cphMain_cphMain_content_LinkButton1']
    Wait Until Page Contains Element   	xpath=.//*[@id='content']/div/div[2]/div[1]/span
    capture page screenshot

    COMMENT         Return First conditions
    COMMENT         Navigate to left About me submenu
    click element                   xpath=.//*[@id='content']/div/div[1]/ul/li[7]/a
    Wait Until Page Contains Element   	xpath=.//*[@id='cphMain_cphMain_content_Title1_ctriTitle']/span

    COMMENT         Review and exchange Personal information
    click element                   xpath=.//*[@id='content']/div/div[2]/div[3]/a
    Wait Until Page Contains Element   	ctl01

    COMMENT         Replace avatar picture in input form
    wait until page contains element  xpath=.//*[@id='cphMain_cphMain_content_fuImage']
    #click element  xpath=.//*[@id='cphMain_cphMain_content_fuImage']
    Choose File	 xpath=.//*[@id='cphMain_cphMain_content_fuImage']	${file_path1}
    click button  xpath=.//*[@id='cphMain_cphMain_content_LinkButton1']
    Wait Until Page Contains Element   	xpath=.//*[@id='content']/div/div[2]/div[1]/span
    capture page screenshot

*** Keywords ***
