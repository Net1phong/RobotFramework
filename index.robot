*** Settings ***

library    SeleniumLibrary
Suite Setup    Open Browser    https://translate.google.co.th/?hl=th&sl=en&tl=th&op=translate    gc
Suite Teardown    Close Browser

*** Variables ***
${ENGWORD}    DOG

*** Keywords ***
INPUT ENG WORD
    [Arguments]    ${ENGWORD}
    Input Text    //*[@id="yDmH0d"]/c-wiz/div/div[2]/c-wiz/div[2]/c-wiz/div[1]/div[2]/div[2]/div/c-wiz/span/span/div/textarea    ${ENGWORD}

*** Test Cases ***
Check Translate result
    INPUT ENG WORD    ${ENGWORD}
    Wait Until Page Contains    สุนัข