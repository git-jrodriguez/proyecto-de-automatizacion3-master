*** Settings ***
Documentation    Suite description

*** Variables ***
${emailField}                  css=#checkout_form_address [name='order\[email\]']
${firstNameField}                css=input#order_ship_address_attributes_firstname
${lastNameField}                 css=input#order_ship_address_attributes_lastname
${companyField}                  css=input#order_ship_address_attributes_company
${streetAddressField}            css=input[name='order[ship_address_attributes][address1]']
${streetAddress2Field}           css=input[name='order[ship_address_attributes][address2]']
${cityField}                     css=input#order_ship_address_attributes_city
${stateField}                    css=select#order_ship_address_attributes_state_id
${stateFieldCalifornia}          css=select#order_ship_address_attributes_state_id > option[value='413']
${zipcodeField}                  css=input#order_ship_address_attributes_zipcode
${phoneField}                    css=input#order_ship_address_attributes_phone

${continueToDelivery}            css=form#checkout_form_address  input[name='commit']
${orderTotalField}

${userFirstName}                  Newuser7    #First Name
${userLastName}                   Lastuser7    #Last Name
${userEmail}                      newusertest@yopmail.com    #Email Address
${companyName}                    GreatTest    #Company Name
${shippingStreetAddress}          Wonder st. 77666    #Shipping Street Address
${shippingSecondStreetAddress}    Chan st. 55321    #Second Shipping Street Address
${shippingCity}                   LA    #Shipping City
${shippingZip}                    90210
${shippingPhone}                  5054125888    #Shipping Phone


*** Keywords ***
Complete Mail
    Input text          ${emailField}                   ${userEmail}

Complete Shipping Address
    Input text          ${firstNameField}               ${userFirstName}
    Input text          ${lastNameField}                ${userLastName}
    Input text          ${companyField}                 ${companyName}
    Input text          ${streetAddressField}           ${shippingStreetAddress}
    Input text          ${streetAddress2Field}          ${shippingSecondStreetAddress}
    Input text          ${cityField}                    ${shippingCity}
    Click element       ${stateField}
    Click element       ${stateFieldCalifornia}
    Input text          ${zipcodeField}                 ${shippingZip}
    Input text          ${phoneField}                   ${shippingPhone}

Continue to Delivery
    Click element                           ${continueToDelivery}
    Wait until element is enabled           css=#checkout_form_delivery [value='Continue to Payment']       20s