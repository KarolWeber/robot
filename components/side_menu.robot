*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/side_menu_locators.robot


*** Keywords ***
Side Menu Payments
    [Documentation]    Go to payments side menu
    Wait Until Element Is Visible    ${SIDE_MENU_PAYMENTS}   timeout=2s    
    Click Element    ${SIDE_MENU_PAYMENTS}