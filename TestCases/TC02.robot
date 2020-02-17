*** Settings ***
Documentation    Suite for testing payment methods on frontend
Resource         ../Resources/Login.robot
Resource         ../Resources/Customers.robot
Resource         ../Resources/Frontend/Product1.robot
Resource         ../Resources/Frontend/General.robot
Resource         ../Resources/Frontend/Cart.robot
Resource         ../Resources/Frontend/Checkout/Shipping.robot
Resource         ../Resources/Frontend/Checkout/ShippingMethod.robot
#Suite Setup      LogIn to Spirit Sales
#Suite Teardown   Close Site

*** Test Cases ***
Add to cart
    Add Product1 to cart
    Open cart
    Verify Product added    ${productName}      XL       ${productPrice}
    Continue to Checkout
    Complete mail
    Complete Shipping Address
    Continue to delivery
    Select payment method
    Continue to Payment

