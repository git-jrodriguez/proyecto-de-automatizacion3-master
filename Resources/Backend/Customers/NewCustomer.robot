*** Settings ***
Documentation    Suite description
Library         SeleniumLibrary

*** Variables ***
${userFirstNameField}    css=input#user_first_name
${userFirstName}    Newuser7    #First Name
${userLastNameField}    css=input#user_last_name
${userLastName}    Lastuser7    #Last Name
${userPhoneField}    css=input#user_phone
${userPhone}      1234567    #Phone Number
${userEmailField}    css=input#user_email
${userEmail}      newusertest7@yopmail.com    #Email Address
${userPasswordField}    css=input#user_password
${userPassword}    test1234    #Password
${userPasswordConfirmationField}    css=input#user_password_confirmation
${billingAddressFirstNameField}    css=input#user_bill_address_attributes_firstname    #Billing Address First Name Field
${billingAddressLastNameField}    css=input#user_bill_address_attributes_lastname    #Billing Address Last Name Field
${companyNameField}    css=input#user_bill_address_attributes_company    #Company Field
${companyName}    GreatTest    #Company Name
${billingStreetAddressField}    css=input[name='user[bill_address_attributes][address1]']
${billingStreetAddress}    Fake st. 45321    #Billing Street Address
${secondBillingStreetAddressField}    css=input[name='user[bill_address_attributes][address2]']
${secondBillingStreetAddress}    Anotherstreet st. 88999    #Second Billing Street Address
${billingCityField}    css=[name='user\[bill_address_attributes\]\[city\]']
${billingCity}    LA    #City
${billingStateField}    css=span#bstate > .fullwidth.select2.select2-container.state > .select2-choice.select2-default    #State List
${billingState}    css=li:nth-of-type(5) > div[role='option']    #State California
${billingZipField}    css=input#user_bill_address_attributes_zipcode
${billingZipCode}    90210    #Zip Code
${billingPhoneField}    css=input#user_bill_address_attributes_phone    #Billing Phone Field
${userShippingFirstNameField}    css=input#user_ship_address_attributes_firstname    #Shipping First Name Field
${userShippingLastNameField}    css=input#user_ship_address_attributes_lastname    #Shipping Last Name Field
${shippingCompanyNameField}    css=input#user_ship_address_attributes_company    #Company
${shippingStreetAddressField}    css=input[name='user[ship_address_attributes][address1]']
${shippingStreetAddress}    Wonder st. 77666    #Shipping Street Address
${shippingSecondStreetAddressField}    css=input[name='user[ship_address_attributes][address2]']
${shippingSecondStreetAddress}    Chan st. 55321    #Second Shipping Street Address
${shippingCityField}    css=[name='user\[ship_address_attributes\]\[city\]']    #Shipping City
${shippingStateField}    css=#sstate .select2 a    #Shipping State
${shippingZipField}    css=input#user_ship_address_attributes_zipcode    #Shipping Zip
${shippingPhoneField}    css=input#user_ship_address_attributes_phone    #Shipping Phone

*** Keywords ***

Complete Form
    Input text    ${userFirstNameField}    ${userFirstName}    #First Name
    Input text    ${userLastNameField}    ${userLastName}    #Last Name
    Input text    ${userPhoneField}    ${UserPhone}    #Phone Number
    Input text    ${userEmailField}    ${UserEmail}    #Email Address
    Input text    ${userPasswordField}    ${userPassword}    #Password
    Input text    ${userPasswordConfirmationField}    ${userPassword}    #Passwoed Confirmation

Complete Billing Address Form
    Page should contain    Billing Address
    Input text    ${billingAddressFirstNameField}    ${userFirstName}    #First Name
    Input text    ${billingAddressLastNameField}    ${userLastName}    #Last Name
    Input text    ${companyNameField}    ${companyName}    #Company Name
    Input text    ${billingStreetAddressField}    ${billingStreetAddress}    #Street Address
    Input text    ${secondBillingStreetAddressField}    ${secondBillingStreetAddress}    #Second Street Address
    Input text    ${billingCityField}    ${billingCity}    #City
    Click element    ${billingStateField}    #State
    Click element    ${billingState}    #California
    Input text    ${billingZipField}    ${billingZipCode}    #Zip
    Input text    ${billingPhoneField}    ${userPhone}    #Phone Number

Complete Shipping Address Form
    Page should contain    Shipping Address
    Input text    ${userShippingFirstNameField}    ${userFirstName}    #First Name
    Input text    ${userShippingLastNameField}    ${userLastName}    #Last Name
    Input text    ${shippingCompanyNameField}    ${companyName}    #Company Name
    Input text    ${shippingStreetAddressField}    ${shippingStreetAddress}    #Shipping Street Address
    Input text    ${shippingSecondStreetAddressField}    ${shippingSecondStreetAddress}    #Second Shipping Street Address
    Input text    ${shippingCityField}    ${billingCity}    #Shipping City
    Sleep    2s
    Click element    ${shippingStateField}    #Shipping State
    Sleep    2s
    Click element    ${billingState}    #California
    Input text    ${shippingZipField}    ${billingZipCode}    #Shipping Zip
    Input text    ${shippingPhoneField}    ${userPhone}    #Shipping Phone