*** Settings ***
Documentation    Suite description
Library         SeleniumLibrary
Resource         NewCustomer.robot

*** Variables ***
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

*** Keywords ***
Go to Customers
    Click element    css=.fa.fa-user.icon_link.with-tip    #Boton de customers del menu a la izquierda
    Wait Until Page Contains Element    css=a#admin_new_user_link

Add New Customer
    Click element    css=a#admin_new_user_link    #Boton de New Customer
    Wait Until Page Contains    Customer Information
    Complete Form
    Complete Billing Address Form
    Sleep    3s
    Complete Shipping Address Form
    Sleep    3s
    Click Button    css=button#submit-form-top-bar    #Create Button
    Page should not contain    There are some errors in the form, please correct them below.