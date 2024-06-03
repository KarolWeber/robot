*** Settings ***
Library         SeleniumLibrary
Resource        ../configuration/configuration.robot
Resource        ../pages/login_page.robot
Resource        ../locators/dashboard_locators.robot
Resource        ../pages/dashboard_page.robot
Variables       ../test_data/dashboard_data.py

Test Setup     User Login


*** Test Cases ***
QuickPayment
    [Documentation]    Dashboard => quick payment
    [Tags]    dashboard
    ${reciever}    Set Variable    ${quick_payment["reciever"]}
    ${amount}    Set Variable    ${quick_payment["amount"]}
    ${title}    Set Variable    ${quick_payment["title"]}
    Quick Payment    reciever=${reciever}    amount=${amount}    title=${title}
    ${expected}    Set Variable    Przelew wykonany! ${reciever} - ${amount},00PLN - ${title}
    ${current}    Get Text    ${DASHBOARD_USER_MESSAGES}
    Should Be Equal    ${expected}    ${current}
    [Teardown]    Default Teardown

TopUpPhone
    [Documentation]    Dashboard => phone top-up
    [Tags]    dashboard
    ${reciever}    Set Variable    ${top_up_phone["reciever"]}
    ${amount}    Set Variable    ${top_up_phone["amount"]}
    Phone Top Up    reciever=${reciever}    amount=${amount}
    ${expected}    Set Variable    Doładowanie wykonane! ${amount},00PLN na numer ${reciever}
    ${current}    Get Text    ${DASHBOARD_USER_MESSAGES}
    Should Be Equal    ${expected}    ${current}
    [Teardown]    Default Teardown
