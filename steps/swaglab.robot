*** Settings ***
Library                SeleniumLibrary
Library                DataDriver          ../resource/credential.csv     sheet_name=sheet1
Suite Setup            Open Browser        ${webURL}        ${BROWSERS}
Test Template          I login with invalid username and invalid password
Suite Teardown         Close Browser

*** Variables ***
${BROWSERS}                chrome
${webURL}                  https://www.saucedemo.com/

*** Keywords ***
I login with invalid username and invalid password
    [Arguments]                    ${username}            ${password}
    Maximize Browser Window
    Input Text                    id:user-name           ${username}
    Input Text                    id:password            ${password}
    Click Button                  id:login-button
    Element Should Be Visible     //h3[@data-test="error"]
    Page Should Contain           Epic sadface: Username and password do not match any user in this service

*** Test Cases ***
Login with invalid username and invalid password using CSV file        ${username}        ${password}
    