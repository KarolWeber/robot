*** Settings ***
Library     SeleniumLibrary
Resource    ../configuration/configuration.robot
Resource    ../pages/login_page.robot
Resource    ../locators/dashboard_locators.robot


*** Test Cases ***
LoginSuccessful
    [Documentation]    Login => correct credentials
    [Tags]    login
    user login
    ${expected}    Set Variable    ${user_data["user_name"]}
    ${current}    Get Text    ${DASHBOARD_USER_NAME}    
    Should Be Equal    ${expected}    ${current}
    [Teardown]    Default Teardown


LoginValidationInvalidUsernameLength
    [Documentation]    Login => invalid username length
    [Tags]    login
    User Login      user_login=Invalid
    ${expected}    Set Variable    ${login_errors['login_length_error']}
    ${current}    Get Text    ${ERROR_LOGIN_ID}
    Should Be Equal    ${expected}    ${current}
    [Teardown]    Default Teardown

    
LoginValidationInvalidPasswordLength
    [Documentation]    Login => invalid username length
    [Tags]    login
    User Login      user_password=invalid
    ${expected}    Set Variable    ${login_errors['password_length_error']}
    ${current}    Get Text    ${ERROR_LOGIN_PASSWORD}
    Should Be Equal    ${expected}    ${current}
    [Teardown]    Default Teardown

    
LoginValidationNoUsername
    [Documentation]    Login => no username
    [Tags]    login
    User Login      user_login=    user_password=    login=False
    ${expected}    Set Variable    ${login_errors['field_required']}
    ${current}    Get Text    ${ERROR_LOGIN_ID}
    Should Be Equal    ${expected}    ${current}
    [Teardown]    Default Teardown

    
LoginValidationNoPassword
    [Documentation]    Login > no username
    [Tags]    login
    User Login      user_login=    user_password=
    ${expected}    Set Variable    ${login_errors['field_required']}
    ${current}    Get Text    ${ERROR_LOGIN_PASSWORD}
    Should Be Equal    ${expected}    ${current}
    [Teardown]    Default Teardown

