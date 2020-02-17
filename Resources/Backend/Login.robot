*** Settings ***
Documentation    Suite description
Library         SeleniumLibrary

*** Variables ***
${usernameField}    css=input#spree_user_email
${passwordField}    css=input#spree_user_password
${loginButton}    css=form#new_spree_user > button[name='button']
${loginURL}       https://www.spiritsale-qc.com/admin/login?redirect_to=%2Fadmin%2Fstores
${verificationText}    Stores
${userLoginInformation}    lenioss06@leniolabs.com
${userPassword}    test1234
${Browser}        Chrome    #Browser

*** Keywords ***
LogIn to Spirit Sales
    Open browser    ${loginURL}    ${Browser}
    Maximize Browser Window
    Wait Until Page Contains Element    ${usernameField}
    Input Text    ${usernameField}    ${userLoginInformation}
    Input Text    ${passwordField}    ${userPassword}
    Click Button    ${loginButton}
    Page Should Contain    ${verificationText}

Close Site
    Close Browser