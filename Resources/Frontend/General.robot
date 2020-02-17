*** Settings ***
Documentation    Suite description
*** Variables ***
${addToCartMenu}            css=a > .fa.fa-shopping-bag


*** Keywords ***
Open cart
    Click element       ${addToCartMenu}
    Wait until element is visible       css=.modal-content


