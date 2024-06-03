*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/locators.robot
Resource    ../configuration/configuration.robot
Variables    ../test_data/test_data.py

*** Keywords ***
User Login
    [Arguments]    ${user_login}=${user_data["login_id"]}    ${user_password}= ${user_data["login_password"]}    ${login}=True    ${HEADLESS}=True
    [Documentation]    Login user to system.
    ...    Arguments:
    ...    - ${login}: If True (default), user click login button.
    ...    - ${user_login}: User name. Default get from test data.
    ...    - ${user_password}: User password. Default get from test data.
    ...    - ${HEADLESS}: Run tests with/without GUI
    Open Browser    ${BASE_URL}    ${BASE_BROWSER}    headless=${HEADLESS}
    Wait Until Element Is Visible    ${LOGIN_ID}    timeout=2
    Press Keys    ${LOGIN_ID}    ${user_login}
    Wait Until Element Is Visible    ${LOGIN_PASSWORD}    timeout=2
    Press Keys    ${LOGIN_PASSWORD}    ${user_password}
    Run Keyword If    ${login}    Click Button    ${LOGIN_BUTTON}
