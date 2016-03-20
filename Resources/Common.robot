*** Settings ***
Documentation    Test plan description: Common  Keywords for site
Library  Selenium2Library  0  5	# Sets default timeout to 0 seconds and default implicit_wait to 5 seconds
Library  String
Library  ../Resources/Common.py

#robot -d results tests/Common.robot
*** Variables ***
                                    # Setting Globall Variables
${BROWSER} =  ie                    # ie=Internet Explorer, ff=FireFox, gc=Google Chrome
${START_URL} =  http://www2.memocast.com
${USER_NAME} =  novikov6455@gmail.com
${PASSWORD} =  5906455
${STATUS_1} =  Login | Signup
${STATUS_2} =  Войти | Регистрация
${STATUS_NAME} =  Somebody
${result} =  one

*** Keywords ***
Begin Web Test
    #Open Browser  about:blank  ${BROWSER}
    When Open Browser  ${START_URL}  ${BROWSER}
    And Maximize Browser Window
    Then wait until page contains element  id=ctl34_HyperLink1
    #Change interface languages
    #Login with valid credentials
    #Then wait until page contains element  id=ctl34_HyperLink1
    #####      Request of system STATUS
    ${element_text} =  set variable  request
    ${element_text}  get text  css=.status-bar
    #get line count  ${element_text}
    #log  ${element_text}
    ${result} =  get line  ${element_text}  0
    #####  Login with valid credentials or Logout and Login with valid cr-ls(when system save any legitim cr-ls)
    run keyword if  '${result}' == '${STATUS_1}' or '${result}' == '${STATUS_2}'  Login with valid credentials
    ${STATUS_NAME}  get text  id=ctl34_lblUserName
    run keyword if  '${STATUS_NAME}' != '${USER_NAME}'  Logout and Login with valid cr-ls

End Web Test
    #Then wait until page contains element  Logout
    #Then wait until page contains element  id=ctl34_aLogout
    ##Then click link  css=#ctl34_aLogout
    #Then close browser
    close all browsers

Login with valid credentials
    #Open Browser  ${START_URL}  ${BROWSER}
    #Then wait until page contains element  css=#ctl34_aLogin
    Then click link  id=ctl34_aLogin
    Then wait until page contains element  css=.memo-header
    Then input text  id=cphMain_tbLogin  ${USER_NAME}
    Then input password  id=cphMain_tbPassword  ${PASSWORD}
    Then unselect checkbox  id=cbRememberMe    # should be set on the vertual mashins
    Then click Button  id=btLoginSubmitButton
    WAIT UNTIL PAGE CONTAINS ELEMENT  id=ctl34_lblUserName

Logout and Login with valid cr-ls
    Then click link  css=#ctl34_aLogout
    Then Login with valid credentials

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
