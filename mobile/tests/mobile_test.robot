*** Settings ***
Library    AppiumLibrary

*** Variables ***
${REMOTE_URL}       http://127.0.0.1:4723
${PLATFORM_NAME}    Android
${DEVICE_NAME}      emulator-5554
${APP_PACKAGE}      com.lionparcel.services.consumer
${APP_ACTIVITY}     com.lionparcel.services.consumer.view.main.MainActivity
${TIMEOUT}          30s
${UI_AUTOMATOR_2}   UiAutomator2

*** Test Cases ***
Cek Tarif - Positif Case
    Given User is on the Lion Parcel app home screen
    When User navigates to the Cek Tarif screen
    And User enters valid origin and destination addresses
    And User taps the Check Tariff button
    And User swipes to reveal tariff estimation
    Then User should see the tariff estimation
    And User captures screenshot and closes the app

Cek Tarif - Negatif Case - Kota Tujuan Kosong
    Given User is on the Lion Parcel app home screen
    When User navigates to the Cek Tarif screen from the navigation menu
    And User enters only the origin address
    Then the Check Tariff button should be disabled
    And User captures screenshot and closes the app

*** Keywords ***
Given User is on the Lion Parcel app home screen
    Open Application    ${REMOTE_URL}  
        ...    platformName=${PLATFORM_NAME}  
        ...    deviceName=${DEVICE_NAME}  
        ...    automationName=${UI_AUTOMATOR_2}  
        ...    appPackage=${APP_PACKAGE}  
        ...    appActivity=${APP_ACTIVITY}  
        ...    noReset=true

# Wait Until Element Is Visible    id=com.lionparcel.services.consumer:id/imgMembershipLevelBadge    ${TIMEOUT}

When User navigates to the Cek Tarif screen
    Click Element    xpath=//android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtTitle" and @text="Cek Tarif"]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Cek Tarif untuk Pengirimanmu"]    ${TIMEOUT}

When User navigates to the Cek Tarif screen from the navigation menu
    Click Element    xpath=//android.widget.ImageButton[@content-desc="Navigate up"]
    Wait Until Element Is Visible    id=com.lionparcel.services.consumer:id/imgMembershipLevelBadge    ${TIMEOUT}
    Click Element    xpath=//android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtTitle" and @text="Cek Tarif"]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Cek Tarif untuk Pengirimanmu"]    ${TIMEOUT}

And User enters valid origin and destination addresses
    Click Element    id=com.lionparcel.services.consumer:id/edtOriginAddress
    Input Text       id=com.lionparcel.services.consumer:id/edtRouteSearch    jakarta
    Click Element    xpath=(//android.widget.LinearLayout[@resource-id="com.lionparcel.services.consumer:id/llOriginRoute"])[1]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Cek Tarif untuk Pengirimanmu"]    ${TIMEOUT}
    Click Element    id=com.lionparcel.services.consumer:id/edtDestinationAddress
    Input Text       id=com.lionparcel.services.consumer:id/edtRouteSearch    bogor
    Click Element    xpath=(//android.widget.LinearLayout[@resource-id="com.lionparcel.services.consumer:id/llDestinationRoute"])[1]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Cek Tarif untuk Pengirimanmu"]    ${TIMEOUT}

And User enters only the origin address
    Click Element    id=com.lionparcel.services.consumer:id/edtOriginAddress
    Input Text       id=com.lionparcel.services.consumer:id/edtRouteSearch    jakarta
    Click Element    xpath=(//android.widget.LinearLayout[@resource-id="com.lionparcel.services.consumer:id/llOriginRoute"])[1]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Cek Tarif untuk Pengirimanmu"]    ${TIMEOUT}

And User taps the Check Tariff button
    Click Element    xpath=//android.widget.Button[@resource-id="com.lionparcel.services.consumer:id/btnCheckTariff"]

And User swipes to reveal tariff estimation
    Swipe    500    2000    500    500    1000

Then User should see the tariff estimation
    Element Text Should Be    xpath=//android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtTotalTariffEstimation"]    Rp11.000

Then the Check Tariff button should be disabled
    Element Should Be Disabled    xpath=//android.widget.Button[@resource-id="com.lionparcel.services.consumer:id/btnCheckTariff"]

And User captures screenshot and closes the app
    Capture Page Screenshot
    Close Application
