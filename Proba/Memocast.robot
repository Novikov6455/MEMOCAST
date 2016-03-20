*** Settings ***
Documentation    Common functionality

Library  Selenium2Library  0  5	  # Sets default timeout to 0 seconds and default implicit_wait to 5 seconds

#robot -d results tests/memocast.robot
#robot -d results -t "Return all Links" tests/Memocast.robot

*** Variables ***
${ACTION} =  Proba
${links}

*** Test Cases ***
Test title
    [Tags]
    Provided precondition
    log  ${ACTION}
    ${new_variable} =  set variable  New variable
    log  ${new_variable}

    Open Browser  http://www2.memocast.com  ie
    When Wait until Page Contains  Login
    Then Close Browser

Return all Links
    [Tags]    DEBUG 01.21
    ${links}  get all links
    log  ${links}
    log  ${links}  HTML
    log  ${links}  repr=yes
    log  ${links}  console=yes


*** Keywords ***
Provided precondition
    log  ${ACTION}
    log  Privet
