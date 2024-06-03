*** Settings ***
Library    SeleniumLibrary
Library    String
Library    DateTime

*** Variables ***
${BASE_URL}     https://demo-bank.vercel.app/
${BASE_BROWSER}     Chrome    

*** Keywords ***
Default Teardown
    [Documentation]    Test teardown => Screen on fail and close browser
    ${timestamp}=    Get Current Date    result_format=%Y-%m-%d %H:%M:%S
    ${safe_timestamp}=    Replace String    ${timestamp}    :    -
    Run Keyword If Test Failed    Capture Page Screenshot    ${TEST NAME}_${safe_timestamp}.png
    Close Browser
