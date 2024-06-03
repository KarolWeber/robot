*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/login_locators.robot
Resource    ../configuration/configuration.robot
Variables    ../test_data/login_data.py

*** Keywords ***
User Login
    [Arguments]    ${user_login}=${user_data["login_id"]}    ${user_password}= ${user_data["login_password"]}    ${login}=True    ${HEADLESS}=True
    [Documentation]    Login the user into the system
    ...    Arguments:
    ...    - ${user_login}: User name. Default get from test data
    ...    - ${user_password}: User password. Default get from test data
    ...    - ${login}: If True (default), user click login button
    ...    - ${HEADLESS}: Run tests with/without GUI
    Open Browser    ${BASE_URL}    ${BASE_BROWSER}    headless=${HEADLESS}
    Wait Until Element Is Visible    ${LOGIN_ID}    timeout=2s
    Press Keys    ${LOGIN_ID}    ${user_login}
    Wait Until Element Is Visible    ${LOGIN_PASSWORD}    timeout=2s
    Press Keys    ${LOGIN_PASSWORD}    ${user_password}
    Run Keyword If    ${login}    Click Button    ${LOGIN_BUTTON}
