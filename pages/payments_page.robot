*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/payments_locators.robot
Resource    ../locators/dashboard_locators.robot
Resource    ../configuration/configuration.robot
Variables    ../test_data/payments_data.py

*** Keywords ***
Cash Transfer
    [Arguments]    ${reciever}    ${iban_number}    ${amount}   ${title}
    [Documentation]    Create cash fransfer
    ...    Arguments:
    ...    - ${reciever}: Transfer reciever name
    ...    - ${iban_number}: Transfer bank account number
    ...    - ${amount}: Transfer amount
    ...    - ${title}: Transfer title
    Press Keys    ${PAYMENTS_CASH_TRANSFER_RECIEVER}    ${reciever}
    Press Keys    ${PAYMENTS_CASH_TRANSFER_IBAN_NUMBER}    ${iban_number}
    Press Keys    ${PAYMENTS_CASH_TRANSFER_AMOUNT}    ${amount}
    Press Keys    ${PAYMENTS_CASH_TRANSFER_TITLE}    ${title}
    Click Button    ${PAYMENTS_CASH_TRANSFER_EXECUTE_BUTTON}
    Click Button    ${DASHBOARD_CLOSE_BUTTON}
