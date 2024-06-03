*** Settings ***
Library    SeleniumLibrary
Resource    ../configuration/configuration.robot
Resource    ../components/components.robot
Resource    ../pages/login_page.robot

Suite Setup    User Login

*** Test Cases ***
SimplePayment
    Side Menu payments
    
    
