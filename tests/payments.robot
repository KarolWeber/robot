*** Settings ***
Library    SeleniumLibrary
Resource    ../configuration/configuration.robot
Resource    ../components/side_menu.robot
Resource    ../pages/login_page.robot
Resource    ../pages/payments_page.robot
Resource    ../locators/dashboard_locators.robot
Variables    ../test_data/payments_data.py

Test Setup     User Login

*** Test Cases ***
SimpleCashTransfer
    [Documentation]    Payments => Simple cash transfer    
    [Tags]    payments
    Side Menu Payments
    ${reciever}    Set Variable    ${transfer_cash["reciever"]}
    ${iban_number}    Set Variable    ${transfer_cash["iban_number"]}
    ${amount}    Set Variable    ${transfer_cash["amount"]}
    ${title}    Set Variable    ${transfer_cash["title"]}
    Cash Transfer    reciever=${reciever}    iban_number=${iban_number}    amount=${amount}    title=${title}
    ${expected}    Set Variable    Przelew wykonany! ${amount},00PLN dla ${reciever}
    ${current}    Get Text    ${DASHBOARD_USER_MESSAGES}
    Should Be Equal    ${expected}    ${current}
    [Teardown]    Default Teardown
    
    
    
