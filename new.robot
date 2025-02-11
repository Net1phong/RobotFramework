*** Settings ***

library    SeleniumLibrary 
Suite Setup    Open Browser    https://www.saucedemo.com/v1/    gc
Suite Teardown    Close Browser

*** Variables ***
${USERNAME}    problem_user
${PASSWORD}    secret_sauce

*** Keywords ***
Input Username
    [Arguments]    ${USERNAME}
    Input Text    //*[@id="user-name"]    ${USERNAME}

Input Password
    [Arguments]    ${PASSWORD}
    Input Text    //*[@id="password"]    ${PASSWORD}

Click Login Button
    Click Button    //*[@id="login-button"]

*** Test Cases ***
Test Value Login
    Input Username    ${USERNAME}
    Input Password    ${PASSWORD}
    Click Login Button
    Wait Until Page Contains    Products