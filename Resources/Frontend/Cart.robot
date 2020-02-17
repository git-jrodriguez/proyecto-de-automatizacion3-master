*** Settings ***
Documentation    Suite description
Library         SeleniumLibrary
Library         String
Resource        General.robot

*** Variables ***
${quantityField}
${quantityOK}
${deleteProduct}
${clearCart}
${closeCart}
${continueToCheckout}               css=div:nth-of-type(2) > .checkout
${orderTotal}                       css=.cart-price
${quantity}                         1
${price}                            css= tr:nth-of-type(1) > td:nth-of-type(5)
${orderTotalNumber}
${quantityNumber}
${priceNumber}

*** Keywords ***
Delete product

Edit Ammount

Continue to Checkout
    Click button        ${continueToCheckout}
    Wait until page contains element        css=#checkout_address .content-sidebar

Clear Cart

Get Price
    ${priceNumber}=            Get Text              ${price}
    ${price} =                 Get text              ${price}
    ${price} =                 Get Substring         ${price} 	1
    ${price} =                 Convert To Number     ${price}
    Set Suite Variable         ${price}

Get Quantity

Get Total
    ${orderTotalNumber}=                  Get Text              ${orderTotal}
    ${orderTotalNumber} =                 Get text              ${orderTotalNumber}
    ${orderTotalNumber} =                 Get Substring         ${orderTotalNumber} 	1
    ${orderTotalNumber} =                 Convert To Number     ${orderTotalNumber}
    Set Suite Variable                    ${orderTotalNumber}

Verify total
    ${productTotal}=        Evaluate         ${price}*${quantity}
    Should Be Equal As Numbers        ${productTotal}         ${orderTotalNumber}

Verify Product added
    #Pending color verification
    [Arguments]      ${productName}     ${productSize}      ${productPrice}
    Page should contain element         xpath=//td//div[contains(text(),'${productName}')]
    Page should contain element         xpath=//td//div[contains(text(),'Size: ${productSize}, Color:')]
    Page should contain element         xpath=//td[contains(text(),'${productPrice}')]
