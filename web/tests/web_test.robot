*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.saucedemo.com
${BROWSER}      Chrome
${USERNAME}     standard_user
${PASSWORD}     secret_sauce
${FIRST_NAME}   Yogi
${LAST_NAME}    Ariyanto
${POSTAL_CODE}  546321

*** Test Cases ***
User Can Successfully Complete A Purchase
    Given User is on the Saucedemo login page  
    When User logs in with valid credentials  
    And User adds a product to the cart  
    And User goes to the cart and starts checkout  
    And User fills in the checkout information  
    And User completes the checkout process  
    Then User should see the order confirmation message  

*** Keywords ***
Given User is on the Saucedemo login page  
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

When User logs in with valid credentials  
    Input Text    css:[data-test="username"]   ${USERNAME}
    Input Text    css:[data-test="password"]   ${PASSWORD}
    Click Button  css:[data-test="login-button"]
    Wait Until Element Is Visible    xpath=(//*[@data-test="title" and text()="Products"])

And User adds a product to the cart  
    Click Button   xpath=(//button[@data-test="add-to-cart-sauce-labs-backpack"])[1]
    Sleep          1s

And User goes to the cart and starts checkout
    Click Element                    css:[data-test="shopping-cart-link"]
    Wait Until Element Is Visible    xpath=(//*[@data-test="title" and text()="Your Cart"])
    Click Button                     css:[data-test="checkout"]

And User fills in the checkout information  
    Wait Until Element Is Visible    xpath=(//*[@data-test="title" and text()="Checkout: Your Information"])
    Input Text       css:[data-test="firstName"]   ${FIRST_NAME}
    Input Text       css:[data-test="lastName"]    ${LAST_NAME}
    Input Text       css:[data-test="postalCode"]  ${POSTAL_CODE}
    Click Button     css:[data-test="continue"]

And User completes the checkout process  
    Wait Until Element Is Visible    xpath=(//*[@data-test="title" and text()="Checkout: Overview"])
    Click Button     css:[data-test="finish"]
Then User should see the order confirmation message  
    Wait Until Element Is Visible    xpath=(//*[@data-test="complete-header" and text()="Thank you for your order!"])
    Close Browser
