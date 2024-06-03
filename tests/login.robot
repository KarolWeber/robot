*** Settings ***
Library     SeleniumLibrary
Resource    ../configuration/configuration.robot
Resource    ../pages/login_page.robot


*** Test Cases ***
LoginSuccessful
    [Tags]    login
    [Documentation]    Login with correct credentials
    user login
    ${expected}    Set Variable    ${user_data["user_name"]}
    ${current}    Get Text    ${USER_NAME}    
    Should Be Equal    ${expected}    ${current}
    [Teardown]    Default Teardown


LoginValidationInvalidUsernameLength
    [Tags]    login
    [Documentation]    Login with invalid username length
    User Login      user_login=Invalid
    ${expected}    Set Variable    ${login_errors['login_length_error']}
    ${current}    Get Text    ${ERROR_LOGIN_ID}
    Should Be Equal    ${expected}    ${current}
    [Teardown]    Default Teardown

    
LoginValidationInvalidPasswordLength
    [Tags]    login
    [Documentation]    Login with invalid username length
    User Login      user_password=invalid
    ${expected}    Set Variable    ${login_errors['password_length_error']}
    ${current}    Get Text    ${ERROR_LOGIN_PASSWORD}
    Should Be Equal    ${expected}    ${current}
    [Teardown]    Default Teardown

    
LoginValidationNoUsername
    [Tags]    login
    [Documentation]    Login with no username
    User Login      user_login=    user_password=    login=False
    ${expected}    Set Variable    ${login_errors['field_required']}
    ${current}    Get Text    ${ERROR_LOGIN_ID}
    Should Be Equal    ${expected}    ${current}
    [Teardown]    Default Teardown

    
LoginValidationNoPassword
    [Tags]    login
    [Documentation]    Login with no username
    User Login      user_login=    user_password=
    ${expected}    Set Variable    ${login_errors['field_required']}
    ${current}    Get Text    ${ERROR_LOGIN_PASSWORD}
    Should Be Equal    ${expected}    ${current}
    [Teardown]    Default Teardown

