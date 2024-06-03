*** Settings ***
Library         SeleniumLibrary
Resource        ../configuration/configuration.robot
Resource        ../pages/login_page.robot
Resource        ../pages/pulpit_page.robot

Suite Setup     User Login


*** Test Cases ***
QuickPayment
    [Documentation]    Test dashboard quick payment
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
    [Documentation]    Test dashboard phone top-up
    [Tags]    dashboard
    ${reciever}    Set Variable    ${top_up_phone["reciever"]}
    ${amount}    Set Variable    ${top_up_phone["amount"]}
    Phone Top Up    reciever=${reciever}    amount=${amount}
    ${expected}    Set Variable    Doładowanie wykonane! ${amount},00PLN na numer ${reciever}
    ${current}    Get Text    ${DASHBOARD_USER_MESSAGES}
    Should Be Equal    ${expected}    ${current}
    [Teardown]    Default Teardown
