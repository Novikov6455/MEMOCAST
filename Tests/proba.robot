*** Settings ***
Documentation    Proba
Library  Selenium2Library  0  5	# Sets default timeout to 0 seconds and default implicit_wait to 5 seconds
Library  String
Library    FakerLibrary     locale=de_DE    seed=124

Resource  ../Resources/Common.robot     # Common resources keep in Common.robot
Library  ../Resources/Common.py         # Common resources keep in Common.py

Test Teardown  Common.End Web Test

#robot -d results tests/proba.robot

*** Variables ***
                                    # Setting Globall Variables
${BROWSER} =  ie                    # ie=Internet Explorer, ff=FireFox, gc=Google Chrome
${START_URL} =  http://www2.memocast.com
${LOGIN} =  novikov6455@gmail.com
${PASSWORD} =  5906455
${LOGIN_URL} =  http://www.efcon4u.ru
${STATUS_1} =  Login | Signup
${STATUS_2} =  Войти | Регистрация
${USER_NAME} =  Fill Harper
${STATUS_3} =  Welcome, ${USER_NAME} | Logout
${STATUS_4} =  Привет, ${USER_NAME} | Выход
${USER_STATUS} =  Welcome
${STATUS_NAME} =  Somebody
${result} =  one
${start}=  1
${finish}=  30
${step}=  1
${alphabet_index}=  0
${return_ind}=  0
${words}=  erty
${EXAMPLE}      This value is joined    together with a space
${MULTILINE}    SEPARATOR=\n    First line
...             Second line     Third line   Fourth line
...             Fifth line

&{USER 1}       name=Matti    address=xxx         phone=123
&{USER 2}       name=Teppo    address=yyy         phone=456
&{MANY}         first=1       second=${2}         ${3}=third
&{EVEN MORE}    &{MANY}       first=override      empty=
...             =empty        key\=here=value

*** Test Cases ***
Begin Web Test
#robot -d results -t "Begin Web Test" tests/proba.robot

    #Open Browser  about:blank  ${BROWSER}
    When Open Browser  ${START_URL}  ${BROWSER}
    And Maximize Browser Window
    Then wait until page contains element  id=ctl34_HyperLink1
    Change interface languages
    Login with valid credentials
    Then wait until page contains element  id=ctl34_HyperLink1
    ${STATUS_NAME}  get text  id=ctl34_lblUserName
    ${element_text} =  set variable  qwerty
    ${element_text}  get text  css=.status-bar
    get line count  ${element_text}
    log  ${element_text}
    ${result} =  get line  ${element_text}  0

    run keyword if  '${result}' == '${STATUS_1}' or '${result}' == '${STATUS_2}'  Login with valid credentials
    run keyword if  '${STATUS_NAME}' != '${LOGIN}'  Logout and Login with valid cr-ls

Mytest
#robot -d results tests/proba.robot
#robot -d results -t "Mytest" tests/proba.robot

    ${color} =  set variable  Red
    Run Keyword If  '${color}' == 'Red'  log to console  \nexecuted with single condition
    Run Keyword If  '${color}' == 'Red' or '${color}' == 'Blue' or '${color}' == 'Pink'  log to console  \nexecuted with multiple or

    ${color} =  set variable  Blue
    ${Size} =  set variable  Small
    ${Simple} =  set variable  Simple
    ${Design} =  set variable  Simple
    Run Keyword If  '${color}' == 'Blue' and '${Size}' == 'Small' and '${Design}' != '${Simple}'  log to console  \nexecuted with multiple and

    ${Size} =  set variable  XL
    ${Design} =  set variable  Complicated
    Run Keyword Unless  '${color}' == 'Black' or '${Size}' == 'Small' or '${Design}' == 'Simple'  log to console  \nexecuted with unless and multiple or

Prob02
#robot -d results -t "Prob02" tests/proba.robot
| | Run Keyword If | '${BROWSER}' == 'ie'
| | ... | Open Browser one
| | ... | ELSE
| | ... | Open Browser two


Prob03
#robot -d results -t "Prob03" tests/proba.robot

    Run Keyword If  '${BROWSER}' == 'ie'  Open Browser one  ELSE  Open Browser two

For-Loop-In-Range
#robot -d results -t "For-Loop-In-Range" tests/proba.robot
    : FOR    ${INDEX}    IN RANGE    1    3
    \    Log    ${INDEX}
    \    ${RANDOM_STRING}=    Generate Random String    ${INDEX}
    \    Log    ${RANDOM_STRING}

Random number
#robot -d results -t "Random number" tests/proba.robot

    ${alphabet_index}  Generate random number     ${start}  ${finish}  ${step}
    log  ${alphabet_index}

FakerLibrary Words Generation
#robot -d results -t "FakerLibrary Words Generation" tests/proba.robot

    ${words}=    FakerLibrary.Words
    ${words}=    FakerLibrary.FirstName
    Log    words: ${words}
    ${words}=    FakerLibrary.Words    nb=${10}
    Log    words: ${words}

Generate Fake Data Example2
#robot -d results -t "Generate Fake Data Example2" tests/proba.robot
    [Documentation]    Robot Framework Faker allows users to generate random test data by using Faker's random test data generation keywords. Using Faker, users avoid using static test data for testing and improve the test to simulate real world data.
    [Tags]    Faker
    Comment    Generate    Date Time Between
    ${Date Time Between}    Date Time Between    start_date=1y    end_date=now
    Log    ${Date Time Between}
    Comment    Generate
    Comment    Generate    Date Time This Century
    ${Date Time This Century}    Date Time This Century
    Log    ${Date Time This Century}
    Comment    Generate    Date Time This Decade
    ${Date Time This Decade}    Date Time This Decade
    Log    ${Date Time This Decade}
    Comment    Generate    Date Time This Month
    ${Date Time This Month}    Date Time This Month
    Log    ${Date Time This Month}
    Comment    Generate    Date Time This Year
    ${Date Time This Year}    Date Time This Year
    Log    ${Date Time This Year}
    Comment    Generate    Domain Name
    ${Domain Name}    Domain Name
    Log    ${Domain Name}
    Comment    Generate    Domain Word
    ${Domain Word}    Domain Word
    Log    ${Domain Word}
    Comment    Generate    Email
    ${Email}    Email
    Log    ${Email}
    Comment    Generate    Firefox
    ${Firefox}    Firefox
    Log    ${Firefox}
    Comment    Generate    First Name
    ${First Name}    First Name
    Log    ${First Name}
    Comment    Generate    First Name Female
    ${First Name Female}    First Name Female
    Log    ${First Name Female}
    Comment    Generate    First Name Male
    ${First Name Male}    First Name Male
    Log    ${First Name Male}
    Comment    Generate    Free Email
    ${Free Email}    Free Email
    Log    ${Free Email}
    Comment    Generate    Free Email Domain
    ${Free Email Domain}    Free Email Domain
    Log    ${Free Email Domain}
    Comment    Generate    Geo Coordinate
    ${Geo Coordinate}    Geo Coordinate
    Log    ${Geo Coordinate}
    Comment    Generate    Hex Color
    ${Hex Color}    Hex Color
    Log    ${Hex Color}
    Comment    Generate    Init
    ${Init}    Init
    Log    ${Init}
    Comment    Generate    Internet Explorer
    ${Internet Explorer}    Internet Explorer
    Log    ${Internet Explorer}
    Comment    Generate    Ipv 4
    ${Ipv 4}    Ipv 4
    Log    ${Ipv 4}
    Comment    Generate    Ipv 6
    ${Ipv 6}    Ipv 6
    Log    ${Ipv 6}
    Comment    Generate    Last Name
    ${Last Name}    Last Name
    Log    ${Last Name}

Prob04
#robot -d results -t "Prob04" tests/proba.robot
# EXampl with multiline and separator \n
    log  ${EXAMPLE}
    log  ${MULTILINE}
    log  ${MULTILINE}[1]            # it dosn't work
    ${result} =  get line  ${MULTILINE}  2
    log  ${result}

Prob05
#robot -d results -t "Prob05" tests/proba.robot
# EXampl with dictionary
#*** variables ***
#&{USER 1}       name=Matti    address=xxx         phone=123
#&{USER 2}       name=Teppo    address=yyy         phone=456
#&{MANY}         first=1       second=${2}         ${3}=third
#&{EVEN MORE}    &{MANY}       first=override      empty=
#...             =empty        key\=here=value

    log  &{USER 1}[name]
    log  ${USER 1.name}
    log  &{USER 2}[address]
    log  &{MANY}[first]
    log  &{MANY}[${3}]
    #log  &{EVEN MORE}[&{MANY}]
    log  &{EVEN MORE}[empty]
    log  &{EVEN MORE}[]
    log  &{EVEN MORE}[key\=here]



*** Keywords ***
Open Browser one
    Open Browser  ${START_URL}  ${BROWSER}

Open Browser two
    Open Browser  ${LOGIN_URL}  ${BROWSER}

Generate random number
    [Arguments]   ${start}  ${finish}  ${step}
    log  ${start}
    log  int(${finish})
    log  ${step}
    ${return_ind}=  Rundom_Number  ${start}  ${finish}  ${step}
    return from keyword  ${return_ind}

