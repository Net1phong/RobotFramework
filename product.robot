*** Settings ***

library    SeleniumLibrary 
Suite Setup    Open Browser    https://automationexercise.com/
Suite Teardown    Close Browser

*** Variables ***
${SEARCH}    Stylish Dress
${NAME}      user12@gmail.co
${EMAIL}     user12@gmail.co
${PASSWORS}  1234
${FNAME}     user1234
${LNAME}     narak
${ADDRESS}   ngao
${STATE}     ngao
${CITY}      ngao
${CODE}      52110
${Number}    0987654321

${ADD_TO_CART_BTN}   (//a[contains(text(),'Add to cart')])[8]
*** Keywords ***
Click Products Page
    Click Element    //*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a

Input Search
    [Arguments]    ${SEARCH}
    Input Text    //*[@id="search_product"]    ${SEARCH}

Click Products Button
    Click Button    //*[@id="submit_search"]

Verify All Product
    Wait Until Element Is Visible    /html/body/section[2]/div/div/div[2]/div/h2

Click Add Products Button
    Execute javascript       document.body.style.zoom="50%"
    Sleep    3s
    Click Element    /html/body/section[2]/div/div/div[2]/div/div[2]/div/div[1]/div[1]/a

Click Cart Page
    Click Element    //*[@id="header"]/div/div/div/div[2]/div/ul/li[3]/a

Click Sigup Page
    Click Element    //*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a

Input Name
    [Arguments]    ${NAME}
    Input Text    //*[@id="form"]/div/div/div[3]/div/form/input[2]    ${NAME}

Input Email
    [Arguments]    ${EMAIL}
    Input Text    //*[@id="form"]/div/div/div[3]/div/form/input[3]    ${EMAIL}

Click Signup
    Click Button    //*[@id="form"]/div/div/div[3]/div/form/button

Input Password
    [Arguments]    ${PASSWORS}
    Input Text    //*[@id="password"]    ${PASSWORS}

Input Fname
    [Arguments]    ${FNAME}
    Input Text    //*[@id="first_name"]    ${FNAME}

Input Lname
    [Arguments]    ${LNAME}
    Input Text    //*[@id="last_name"]    ${LNAME}

Input Address
    [Arguments]    ${ADDRESS}
    Input Text    //*[@id="address1"]    ${ADDRESS}

Input State
    [Arguments]    ${STATE}
    Input Text    //*[@id="state"]    ${STATE}

Input City
    [Arguments]    ${CITY}
    Input Text    //*[@id="city"]    ${CITY}

Input Code
    [Arguments]    ${CODE}
    Input Text    //*[@id="zipcode"]    ${CODE}

Input Number
    [Arguments]    ${Number}
    Input Text    //*[@id="mobile_number"]    ${Number}

Click Create Account
    Click Button    //*[@id="form"]/div/div/div/div[1]/form/button
*** Test Cases ***
Test Value
    Click Products Page
    Input Search    ${SEARCH}
    
    Execute JavaScript    var ads = document.querySelectorAll('iframe'); ads.forEach(ad => ad.remove());
    Sleep    2s
 
    ${element}    Get WebElement    ${ADD_TO_CART_BTN}
    Execute JavaScript    arguments[0].dispatchEvent(new Event('click'));    ARGUMENTS    ${element}
    Sleep    2s
 
    Run Keyword And Ignore Error    Click Button    //button[text()='Continue Shopping']
    
    Click Cart Page
    Click Sigup Page
    Input Name    ${NAME}
    Input Email    ${EMAIL} 
    Click Signup
    Input Password    ${PASSWORS}
    Input Fname    ${FNAME} 
    Input Lname    ${LNAME}
    Input Address    ${ADDRESS} 
    Input State    ${STATE} 
    Input City    ${CITY} 
    Input Code    ${CODE} 
    Input Number    ${Number} 
    Click Create Account
    Click Cart Page
    Wait Until Page Contains    text=Stylish Dress

    