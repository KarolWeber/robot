*** Settings ***
Library     SeleniumLibrary
Resource    ../configuration/configuration.robot
Resource    ../pages/login_page.robot


*** Test Cases ***
SimplePayment
    User Login
    ${reciever}    Set Variable    ${quick_payment["reciever"]}
    ${amount}    Set Variable    ${quick_payment["amount"]}
    ${title}    Set Variable    ${quick_payment["title"]}
    Select From List By Label    ${DASHBOARD_QUICK_PAYMENT_RECIEVER}    ${reciever}
    Press Keys    ${DASHBOARD_QUICK_PAYMENT_AMOUNT}    ${amount}
    Press Keys    ${DASHBOARD_QUICK_PAYMENT_TITLE}    ${title}
    Click Button    ${DASHBOARD_QUICK_PAYMENT_EXECUTE_BUTTON}
    Click Button    ${DASHBOARD_CLOSE_BUTTON}
    ${expected}    Set Variable    Przelew wykonany! ${reciever} - ${amount},00PLN - ${title}
    ${current}    Get Text    ${DASHBOARD_USER_MESSAGES}
    Should Be Equal    ${expected}    ${current}
    [Teardown]    Default Teardown

TopUpPhone
    User Login
    ${reciever}    Set Variable    ${top_up_phone["reciever"]}
    ${amount}    Set Variable    ${top_up_phone["amount"]}
    Select From List By Label    ${DASHBOARD_TOP_UP_PHONE_RECIEVER}    ${reciever}
    Press Keys    ${DASHBOARD_TOP_UP_PHONE_AMOUNT}    ${amount}
    Select Checkbox    ${DASHBOARD_TOP_UP_PHONE_CHECKBOX}
    Click Button    ${DASHBOARD_TOP_UP_PHONE_EXECUTE_BUTTON}
    Click Button    ${DASHBOARD_CLOSE_BUTTON}
    ${expected}    Set Variable    Doładowanie wykonane! ${amount},00PLN na numer ${reciever}
    ${current}    Get Text    ${DASHBOARD_USER_MESSAGES}
     Should Be Equal    ${expected}    ${current}
    [Teardown]    Default Teardown
