*** Settings ***
Documentation    Suite description

*** Variables ***
${shippingMethodElement}                      css=li:nth-of-type(1) > label > input[name='order[shipments_attributes][0][selected_shipping_rate_id]']
${shippingMethodNameElement}                  css=li:nth-of-type(1) > label > input[name='order[shipments_attributes][0][selected_shipping_rate_id]'] + span
${shippingMethodName}
${shippingMethodPriceElement}                 css=li:nth-of-type(1) > label > input[name='order[shipments_attributes][0][selected_shipping_rate_id]'] + span + span
${shippingMethodPrice}

${subtotalField}
${subtotalTaxField}
${shippingTotalField}
${shippingTotalTaxField}
${orderTotalField}

${subtotal}
${subtotalTax}
${shippingTotal}
${shippingTotalTax}
${orderTotal}
${stateProductTax}
${stateShippingTax}

${continueToPayment}                         css=form#checkout_form_delivery  input[name='commit']

*** Keywords ***
Select payment method
    Wait until element is enabled   ${shippingMethodElement}
    Click element                   ${shippingMethodElement}
    ${shippingMethodName} =         Get text                    ${shippingMethodNameElement}


Check Product Tax

Check Shipment Tax

Continue to Payment
    Click element                           ${continueToPayment}
    Wait until page contains element        xpath=//div[@id='checkout']//ul[@class='checkout-steps']/li[@class='selected']//a[text() = 'Payment']