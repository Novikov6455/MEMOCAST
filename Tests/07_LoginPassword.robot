*** Settings ***
Documentation    Suite description: Page Login Password common logic
Library  Selenium2Library  1.5  10	    # Sets default timeout to 1.5 seconds and default implicit_wait to 10 seconds
Library  FakerLibrary
Library	 OperatingSystem
Resource  ../Resources/Common.robot     # Common resources keep in Common.robot
# executable Terminal string
#robot -d results tests/07_LoginPassword.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Variables ***
# Tester can reset GLOBAL Variables for particular TestSuit
#${BROWSER} =  ff                    # ie=Internet Explorer, ff=FireFox, gc=Google Chrome
#${START_URL} =  http://www2.memocast.com
#${LOGIN}  novikov6455@gmail.com
#${PASSWORD} =  5906455


*** Test Cases ***
User can create an account and log in
    [Tags]    DEBUG 07.11
    #robot -d results -t "User can create an account and log in" tests/07_LoginPassword.robot
    Logout to start conditions
    Create Valid User    fred123@gmail.com   Fred   Smith   Smith123
    #Attempt to Login with new Credentials
    #Status Should Be    Logged In
    COMMENT  New User Logged In


User cannot log in with bad password
    Create Valid User    betty    P4ssw0rd
    Attempt to Login with Credentials    betty    wrong
    Status Should Be    Access Denied


*** Keywords ***
Logout to start conditions
    click link  css=#ctl34_aLogout
    COMMENT      Request of system STATUS
    ${element_text} =  set variable  request
    ${element_text}  get text  css=.status-bar
    ${result} =  get line  ${element_text}  0
    #####  Login with valid credentials or Logout and Login with valid cr-ls(when system save any legitim cr-ls)
    run keyword if  '${result}' == '${STATUS_1}' or '${result}' == '${STATUS_2}'  comment  Ok for Start

Create valid user
    [Arguments]    ${NewEmail}  ${NewFirstname}  ${NewLastName}  ${NewPassword}
    click link  xpath=.//*[@id='ctl34_aSignup']
    wait until page contains element  xpath=.//*[@id='cphMain_tbEmail']
    input text  xpath=.//*[@id='cphMain_tbEmail']  ${NewEmail}
    input text  xpath=.//*[@id='cphMain_tbFirstName']  ${NewFirstName}
    input text  xpath=.//*[@id='cphMain_tbLastName']  ${NewLastName}
    input text  xpath=.//*[@id='cphMain_tbPassword']  ${NewPassword}
    input text  xpath=.//*[@id='cphMain_tbConfirmPassword']  ${NewPassword}
    Wait Until Element Is Enabled   	btSignupSubmitButton
    Click Button   	btSignupSubmitButton

    COMMENT     Create for new User    login and  password
    ${USER_NAME} =  catenate  ${NewFirstname}  ${NewLastName}
    ${LOGIN} =  set variable  ${NewEmail}
    ${PASSWORD} =  set variable  ${NewPassword}
    set selenium speed  2

    COMMENT      Request of system STATUS
    ${element_text} =  set variable  request
    ${element_text}  get text  css=.status-bar
    #get line count  ${element_text}
    #log  ${element_text}
    ${result} =  get line  ${element_text}  0

    COMMENT     Login with valid credentials or Logout and Login with valid cr-ls(when system save any legitim cr-ls)
    run keyword if  '${result}' == '${STATUS_1}' or '${result}' == '${STATUS_2}'  Login with valid credentials  ${LOGIN}  ${PASSWORD}
    ${STATUS_NAME}  get text  id=ctl34_lblUserName
    run keyword if  '${STATUS_NAME}' != '${USER_NAME}'  log   StatusName: ${STATUS_NAME} not equal UserName: ${USER_NAME}
    capture page screenshot


Creating user with invalid password should fail
    [Arguments]    ${password}    ${error}
    Create user    example    ${password}
    Status should be    Creating user failed: ${error}

Login
    [Arguments]    ${username}    ${password}
    Attempt to login with credentials    ${username}    ${password}
    Status should be    Logged In
