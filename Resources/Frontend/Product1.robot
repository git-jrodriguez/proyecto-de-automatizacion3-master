*** Settings ***
Documentation    Suite description
Library         SeleniumLibrary
Library         String
Resource        General.robot

*** Variables ***
${optionalCheckbox}             css=div:nth-of-type(1) > .dynamic-fields-relative.transfer-text-container > span:nth-of-type(1) > .tranfer-checkbox
${editableCheckbox}             css=div:nth-of-type(2) > .dynamic-fields-relative.transfer-text-container > span:nth-of-type(1) > .tranfer-checkbox
${editableField}                css=[value='field\.text']
${addToCart}                    css=.add-to-cart
${URL}                          https://01california.spiritsale-qc.com/products/usa-made-juniors-triblend-striped-cropped-tee-fd30a803-96e9-4a88-89f6-f4f0267c10a4
${productPrice}
${editablePrice}
${optionalPrice}
${totalPrice}
${productPriceField}            css=.price > .price
${editablePriceField}           css=div:nth-of-type(2) > .dynamic-fields-relative.transfer-text-container > .price
${optionalPriceField}           css=div:nth-of-type(1) > .dynamic-fields-relative.transfer-text-container > .price

*** Keywords ***

Add Product1 to cart
    Go to product1
    Edit editable
    Select optional
    Add to cart
    Price Validation

Go to Product1
    Open browser                   ${URL}      chrome
  # Maximize Browser Window
    Wait until page contains       add to cart         20s
    ${productPrice} =              Get text               ${productPriceField}
    ${productPrice} =              Get Substring          ${productPrice} 	1
    Set Suite Variable      ${productPrice}

Select optional
#   2
    Wait Until Element Is Visible       ${optionalCheckbox}     20s
    Select checkbox                     ${optionalCheckbox}
    Checkbox Should Be Selected         ${optionalCheckbox}
    ${optionalPrice} =                Get text            ${optionalPriceField}
    ${optionalPrice} =                Get Substring          ${optionalPrice} 	4   -1
  # ${optionalPrice} =                Convert To Number      ${optionalPrice}
    Set Suite Variable                ${optionalPrice}

Edit editable
#   1
    Wait Until Element Is Visible       ${editableCheckbox}
    Select checkbox                     ${editableCheckbox}
    Checkbox Should Be Selected         ${editableCheckbox}
    ${text}=                       GENERATE RANDOM STRING       4      [NUMBERS]
    Input text                          ${editableField}     ${text}
    ${editablePrice} =              Get text               ${editablePriceField}
    ${editablePrice} =              Get Substring          ${editablePrice} 	4   -1
    Set Suite Variable              ${editablePrice}

Add to cart
    Wait Until Element Is enabled       ${addToCart}
    Click button                        ${addToCart}
    Wait until page contains            Added to Cart!         20s
    ${productName} =                    Get Text               css=h1
    Set Suite Variable                  ${productName}

Price Validation
    ${totalPrice} =                   Evaluate              ${productPrice}+${editablePrice}
    ${totalPrice} =                   Evaluate              ${totalPrice}+${optionalPrice}
    ${productPrice} =                 Get text              ${productPriceField}
    ${productPrice} =                 Get Substring     	${productPrice} 	1
    ${productPrice} =                 Convert To Number     ${productPrice}
    Should Be Equal As Numbers        ${totalPrice}         ${productPrice}
    Set Suite Variable                ${productPrice}