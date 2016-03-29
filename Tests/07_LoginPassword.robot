*** Settings ***
Documentation    Suite description: Page Login Password common logic
Library  Selenium2Library  1  5	    # Sets default timeout to 1.5 seconds and default implicit_wait to 10 seconds
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
&{NEW_USER_1} =       Email=fred128@gmail.com  Firstname=Fred  LastName=Smith  Password=Smith123
${Bad_Password} =  AnyTHING
${Bad_Login}=  123456@gmail.com

*** Test Cases ***
User can create an account and log in
    [Tags]    DEBUG 07.11
    #robot -d results -t "User can create an account and log in" tests/07_LoginPassword.robot
    Logout to start conditions

    COMMENT          Create Valid User and Keep in Data Base
    # dictionary                                    email                  / first name               / second name            / password
    &{NEW_USER_1} =  Create Valid User    &{NEW_USER_1}[Email]   &{NEW_USER_1}[Firstname]  &{NEW_USER_1}[LastName]  &{NEW_USER_1}[Password]
    &{SystemStatus}=  Get system status
    run keyword if  '&{SystemStatus}[Status]' == 'Logged'   Log   New User: &{SystemStatus}[Subject] Logged
    run keyword if  '&{SystemStatus}[Status]' == 'Open for LogIn'  Login with credentials  &{NEW_USER_1}[Login]   &{NEW_USER_1}[Password]
    &{SystemStatus}=  Get system status

User cannot log in with bad password
    [Tags]    DEBUG 07.12
    #robot -d results -t "User cannot log in with bad password" tests/07_LoginPassword.robot
    Logout to start conditions

    COMMENT          Create Valid User
    # dictionary                                    email                  / first name               / second name            / password
    &{NEW_USER_1} =  Create Valid User    &{NEW_USER_1}[Email]   &{NEW_USER_1}[Firstname]  &{NEW_USER_1}[LastName]  &{NEW_USER_1}[Password]

    COMMENT          CHANGE CREATED PASSWORD UPON BAD_PASSWORD
    &{SystemStatus}=  Get system status
    run keyword if  '&{SystemStatus}[Status]' == 'Logged'   Log   New User: &{SystemStatus}[Subject] Logged
    run keyword if  '&{SystemStatus}[Status]' == 'Open for LogIn'  Login with credentials  &{NEW_USER_1}[Login]   ${Bad_Password}
    &{SystemStatus}=  Get system status

User cannot log in with bad LOGIN
    [Tags]    DEBUG 07.13
    #robot -d results -t "User cannot log in with bad LOGIN" tests/07_LoginPassword.robot
    Logout to start conditions

    COMMENT          Create Valid User
    # dictionary                                    email                  / first name               / second name            / password
    &{NEW_USER_1} =  Create Valid User    &{NEW_USER_1}[Email]   &{NEW_USER_1}[Firstname]  &{NEW_USER_1}[LastName]  &{NEW_USER_1}[Password]

    COMMENT          CHANGE CREATED LOGIN UPON BAD_LOGIN
    &{SystemStatus}=  Get system status
    run keyword if  '&{SystemStatus}[Status]' == 'Logged'   Log   New User: &{SystemStatus}[Subject] Logged
    run keyword if  '&{SystemStatus}[Status]' == 'Open for LogIn'  Login with credentials  ${Bad_Login}   &{NEW_USER_1}[Password]
    &{SystemStatus}=  Get system status


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
    Then WAIT UNTIL PAGE DOES NOT CONTAIN    JUST WAIT   2
    WAIT UNTIL ELEMENT IS ENABLED   css=.status-bar
    Log   This is New User: &{NEW_USER_1}[UserName]
    return from keyword   &{NEW_USER_1}


