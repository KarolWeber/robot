*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/dashboard_locators.robot
Resource    ../configuration/configuration.robot

*** Keywords ***
Quick Payment
    [Arguments]    ${reciever}   ${amount}   ${title}
    [Documentation]    Create quick payment
    ...    Arguments:
    ...    - ${reciever}: Transfer reciever name
    ...    - ${amount}: Transfer amount
    ...    - ${title}: Transfer title
    Select From List By Label    ${DASHBOARD_QUICK_PAYMENT_RECIEVER}    ${reciever}
    Press Keys    ${DASHBOARD_QUICK_PAYMENT_AMOUNT}    ${amount}
    Press Keys    ${DASHBOARD_QUICK_PAYMENT_TITLE}    ${title}
    Click Button    ${DASHBOARD_QUICK_PAYMENT_EXECUTE_BUTTON}
    Click Button    ${DASHBOARD_CLOSE_BUTTON}

Phone Top Up
    [Arguments]    ${reciever}   ${amount}
    [Documentation]    Create a phone top up
    ...    Arguments:
    ...    - ${reciever}: Top-up phone number
    ...    - ${amount}: Top-up amount
    Select From List By Label    ${DASHBOARD_TOP_UP_PHONE_RECIEVER}    ${reciever}
    Press Keys    ${DASHBOARD_TOP_UP_PHONE_AMOUNT}    ${amount}
    Select Checkbox    ${DASHBOARD_TOP_UP_PHONE_CHECKBOX}
    Click Button    ${DASHBOARD_TOP_UP_PHONE_EXECUTE_BUTTON}
    Click Button    ${DASHBOARD_CLOSE_BUTTON}