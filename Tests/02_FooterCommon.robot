*** Settings ***
Documentation    Suite description: Common  FOOTER part of site
Library  Selenium2Library  0  10	    # Sets default timeout to 0 seconds and default implicit_wait to 10 seconds
Resource  ../Resources/Common.robot     # Common resources keep in Common.robot
# Executable Terminal strings examples:
#robot -d results tests/02_FooterCommon.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Test Cases ***
User can open the Home page via Home button Footer menu
    [Tags]    DEBUG 02.1
    #robot -d results -t "User can open the Home page via Home button Footer menu" tests/02_FooterCommon.robot
    When element should be visible  xpath=.//*[@id='ctl01']/div[6]/a[1]
    Then click element  xpath=.//*[@id='ctl01']/div[6]/a[1]
    Then wait until element is visible  id=ctl34_A1

User can open About Us page via About Us button Footer menu
    [Tags]    DEBUG 02.2
    #robot -d results -t "User can open About Us page via About Us button Footer menu" tests/02_FooterCommon.robot
    When element should be visible  xpath=.//*[@id='ctl01']/div[6]/a[2]
    Then click element  xpath=.//*[@id='ctl01']/div[6]/a[2]
    Then wait until element is visible  xpath=.//*[@id='content']/div/div[1]

User can open Help page via Help button Footer menu
    [Tags]    DEBUG 02.3
    #robot -d results -t "User can open Help page via Help button Footer menu" tests/02_FooterCommon.robot
    When element should be visible  xpath=.//*[@id='ctl01']/div[6]/a[3]
    Then click element  xpath=.//*[@id='ctl01']/div[6]/a[3]
    Then wait until element is visible  xpath=.//*[@id='content']/div/div/h2[1]

User can open Terms of Use page via Terms of Use button Footer menu
    [Tags]    DEBUG 02.4
    #robot -d results -t "User can open Terms of Use page via Terms of Use button Footer menu" tests/02_FooterCommon.robot
    When element should be visible  xpath=.//*[@id='ctl01']/div[6]/a[4]
    Then click element  xpath=.//*[@id='ctl01']/div[6]/a[4]
    Then wait until element is visible  xpath=.//*[@id='cphMain_divHead']

User can open Privacy Statement page via Privacy Statement button Footer menu
    [Tags]    DEBUG 02.5
    #robot -d results -t "User can open Privacy Statement page via Privacy Statement button Footer menu" tests/02_FooterCommon.robot
    When element should be visible  xpath=.//*[@id='ctl01']/div[6]/a[5]
    Then click element  xpath=.//*[@id='ctl01']/div[6]/a[5]
    Then wait until element is visible  xpath=.//*[@id='content']/div/div[1]

User can open Contacts page via Contacts button Footer menu
    [Tags]    DEBUG 02.6
    #robot -d results -t "User can open Contacts page via Contacts button Footer menu" tests/02_FooterCommon.robot
    When element should be visible  xpath=.//*[@id='ctl01']/div[6]/a[6]
    Then click element  xpath=.//*[@id='ctl01']/div[6]/a[6]
    Then wait until element is visible  xpath=.//*[@id='content']/div/div[1]

*** Keywords ***
