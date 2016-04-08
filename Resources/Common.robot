*** Settings ***
Documentation    Test plan description: Common  Keywords for site
Library  Selenium2Library  1  5	 # Sets default timeout to 0 seconds and default implicit_wait to 5 seconds
Library  String
Library  ../Resources/Common.py

#robot -d results tests/Common.robot
*** Variables ***
                                    # Setting Globall Variables
${BROWSER} =  ff                    # ie=Internet Explorer, ff=FireFox, gc=Google Chrome
${START_URL} =  http://www2.memocast.com
${LOGIN} =  novikov6455@gmail.com
${PASSWORD} =  5906455
${WRONG_PASSWORD} =  5906456
${STATUS_1} =  Login | Signup
${STATUS_2} =  Войти | Регистрация
${STATUS_3} =  Welcome
${STATUS_4} =  Привет
${FIRST_NAME} =  Vadim
${LAST_NAME} =  Novikov
${USER_NAME} =  Vadim Novikov
${STATUS_NAME} =  Somebody
${result} =  one

*** Keywords ***
Begin Web Test
    #Open Browser  about:blank  ${BROWSER}
    When Open Browser  ${START_URL}  ${BROWSER}
    And Maximize Browser Window
    Then wait until page contains element  id=ctl34_HyperLink1
    #Change interface languages

    COMMENT      Request of system STATUS
    ${element_text}  get text  css=.status-bar
    #get line count  ${element_text}
    #log  ${element_text}
    ${result} =  get line  ${element_text}  0

    COMMENT  Login with valid credentials or Logout and Login with valid cr-ls(when system save any legitim cr-ls)
    run keyword if  '${result}' == '${STATUS_1}' or '${result}' == '${STATUS_2}'  Login with valid credentials  ${LOGIN}  ${PASSWORD}
    ${STATUS_NAME}  get text  id=ctl34_lblUserName
    run keyword if  '${STATUS_NAME}' != '${USER_NAME}'  Logout and Login with valid cr-ls

End Web Test
    #Then wait until page contains element  Logout
    #Then wait until page contains element  id=ctl34_aLogout
    ##Then click link  css=#ctl34_aLogout
    #close all browsers
    Then close browser

Login with valid credentials
    [Arguments]  ${LOGIN}  ${PASSWORD}
    #Open Browser  ${START_URL}  ${BROWSER}
    #Then wait until page contains element  css=#ctl34_aLogin
    Then click link  id=ctl34_aLogin
    Then wait until page contains element  css=.memo-header
    Then input text  id=cphMain_tbLogin  ${LOGIN}
    Then input password  id=cphMain_tbPassword  ${PASSWORD}
    Then unselect checkbox  id=cbRememberMe    # should be set on the vertual mashins
    Then click Button  id=btLoginSubmitButton
    WAIT UNTIL PAGE CONTAINS ELEMENT  id=ctl34_lblUserName

Login with credentials
    [Arguments]  ${LOGIN}  ${PASSWORD}
    Then wait until page contains element  css=#ctl34_aLogin  3
    Then click link  id=ctl34_aLogin
    Then wait until page contains element  css=.memo-header
    Then input text  id=cphMain_tbLogin  ${LOGIN}
    Then input password  id=cphMain_tbPassword  ${PASSWORD}
    Then unselect checkbox  id=cbRememberMe    # should be set on the vertual mashins
    # Set delay on particular operation
    Then click Button  id=btLoginSubmitButton
    Then wait until page does not contain    JUST WAIT   2

Get system status
    COMMENT      REQUEST OF SYSTEM  STATUS
    wait until page does not contain    JUST WAIT   2
    wait until element is visible  css=.status-bar
    ${element_text}  get text  css=.status-bar
    #get line count  ${element_text}
    #log  ${element_text}
    ${result} =  get line  ${element_text}  0
    ${LoginStatus}=  set variable if  '${result}' >= '${STATUS_3}' or '${result}' >= '${STATUS_4}'  Logged     Open for LogIn
    ${STATUS_NAME}=  Run Keyword If  '${LoginStatus}' == 'Logged'   Get User Name  ELSE  set variable  System
    ${StatusSuggestion}=  Run Keyword If  '${LoginStatus}' == 'Open for LogIn'  Check if suggestion present
    &{SystemStatus}=  create dictionary  Subject=${STATUS_NAME}  Status=${LoginStatus}  Suggestion=${StatusSuggestion}
    return from keyword  &{SystemStatus}

Get User Name
    ${STATUS_NAME}=  get text  id=ctl34_lblUserName
    return from keyword  ${STATUS_NAME}

Check if suggestion present
    element should be visible  css=#cphMain_msg_divError
    ${StatusSuggestion}=  get text  css=#cphMain_msg_divError
    return from keyword  ${StatusSuggestion}

Logout and Login with valid cr-ls
    Then click link  css=#ctl34_aLogout
    Then Login with valid credentials  ${LOGIN}  ${PASSWORD}

Change interface languages
    Then click image  /img/lang-eng.png
    Then wait until Page Contains  Home
    Then click image  /img/lang-rus.png
    Then wait until page contains  Главная

Set English language
    #Then click image  /img/lang-eng.png
    Then click image  xpath=(.//span[contains(normalize-space(.),'Язык интерфейса: Русский')]/following::img)[1]
    Then wait until Page Contains  Home

Generate random number
    [Arguments]   ${start}  ${finish}  ${step}
    ${return_ind}=  Rundom_Number  ${start}  ${finish}  ${step}
    return from keyword  ${return_ind}
