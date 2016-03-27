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
#${LoginStatus} =   Login Denied
&{NEW_USER_1} =       Email=fred123@gmail.com  Firstname=Fred  LastName=Smith  Password=Smith123
${Bad_Password} =  AnyTHING

*** Test Cases ***
User can create an account and log in
    [Tags]    DEBUG 07.11
    #robot -d results -t "User can create an account and log in" tests/07_LoginPassword.robot
    Logout to start conditions

    COMMENT          Create Valid User and Keep in Data Base
    # dictionary                                    email                  / first name               / second name            / password
    &{NEW_USER_1} =  Create Valid User    &{NEW_USER_1}[Email]   &{NEW_USER_1}[Firstname]  &{NEW_USER_1}[LastName]  &{NEW_USER_1}[Password]
    ${LoginStatus}=  Get system status
    run keyword if  '${LoginStatus}' == '*Logged*'   Log   New User: &{NEW_USER_1}[UserName] Logged
    run keyword if  '${LoginStatus}' >= '*Open for LogIn'  Login with credentials  &{NEW_USER_1}[Login]   &{NEW_USER_1}[Password]
    ${LoginStatus}=  Get system status

User cannot log in with bad password
    [Tags]    DEBUG 07.12
    #robot -d results -t "User cannot log in with bad password" tests/07_LoginPassword.robot
    Logout to start conditions

    COMMENT          Create Valid User
    # dictionary                                    email                  / first name               / second name            / password
    &{NEW_USER_1} =  Create Valid User    &{NEW_USER_1}[Email]   &{NEW_USER_1}[Firstname]  &{NEW_USER_1}[LastName]  &{NEW_USER_1}[Password]

    COMMENT          CHANGE CREATED PASSWORD UPON BAD_PASSWORD
    ${LoginStatus}=  Get system status
    run keyword if  '${LoginStatus}' == '*Logged*'   Log   New User: &{NEW_USER_1}[UserName] Logged
    run keyword if  '${LoginStatus}' >= '*Open for LogIn'  Login with credentials  &{NEW_USER_1}[Login]   ${Bad_Password}
    ${LoginStatus}=  Get system status

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

    COMMENT     Create for new User:    UserName, login, and  Password
    ${USER_NAME} =  catenate  ${NewFirstname}  ${NewLastName}
    ${LOGIN} =  set variable  ${NewEmail}
    ${PASSWORD} =  set variable  ${NewPassword}
    &{NEW_USER_1} =  Create dictionary  &{NEW_USER_1}   UserName=${USER_NAME}  Login=${LOGIN}
    Wait Until Element Is Enabled   	btSignupSubmitButton
    Click Button   	btSignupSubmitButton
        # Set delay on particular operation
    ${orig Implicit Wait} =	Get Selenium Implicit Wait
    Set Selenium Implicit Wait	15 seconds
    WAIT UNTIL ELEMENT IS ENABLED   css=.status-bar
    Log   This is New User: &{NEW_USER_1}[UserName]
    return from keyword   &{NEW_USER_1}

Attempt to Login with new Credentials
    [Arguments]   ${LOGIN}  ${PASSWORD}
    set selenium speed  1

    COMMENT      Request of system STATUS
    ${element_text} =  set variable  request
    ${element_text}  get text  css=.status-bar
    #get line count  ${element_text}
    #log  ${element_text}
    ${result} =  get line  ${element_text}  0

    COMMENT     Login with valid credentials or Logout and Login with valid cr-ls(when system save any legitim cr-ls)
    run keyword if  '${result}' == '${STATUS_1}' or '${result}' == '${STATUS_2}'  Login with valid credentials  ${LOGIN}  ${PASSWORD}


Get new Login Status for
    [Arguments]  ${USER_NAME}
    ${STATUS_NAME} =   get text  xpath=.//*[@id='ctl34_lblUserName']
    run keyword if  '${STATUS_NAME}' != '${USER_NAME}'  log   StatusName: ${STATUS_NAME} not equal UserName: ${USER_NAME}
    ${LoginStatus} =  set variable if  '${STATUS_NAME}' == '${USER_NAME}'     Loged In
    capture page screenshot
    #[Return]    ${LoginStatus}
    Return from keyword    ${LoginStatus}

