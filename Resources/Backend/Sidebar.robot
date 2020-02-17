*** Settings ***
Documentation    Suite description

*** Variables ***
${Dashboard}                    css=.fa.fa-dashboard.icon_link.with-tip
${Store Fronts}                 css=label#sidebar-menu-stores-group
${Stores}                       css=a#sidebar-menu-stores-tab
${Pages}                        css=a#sidebar-menu-pages-tab
${Products General}             css=#sidebar-menu-products-group > .fa
${Products}                     css=a#sidebar-menu-products-tab
${Categories}                   css=a#sidebar-menu-categories-tab
${Customers}                    css=.fa.fa-user.icon_link.with-tip
${Quotes}                       css=.fa.fa-shopping-cart.icon_link.with-tip
${Orders General}               css=label#sidebar-menu-orders-group
${Orders}                       css=a#sidebar-menu-orders-tab
${Reports}                      css=a#sidebar-menu-reports-tab
${Production General}           css=label#sidebar-menu-production-group
${Create Prod Group}            css=a#sidebar-menu-create-product-group-tab
${Prod Board}                   css=a#sidebar-menu-create-product-group-tab
${Calendar}                     css=a#sidebar-menu-calendar-tab
${Settings}                     css=.fa.fa-wrench.icon_link.with-tip
${Help}                         css=.fa.fa-question.icon_link.with-tip


*** Keywords ***

Go To Dashboard
    Click Element               ${Dashboard}

Go To Customers
    Click Element               ${Customers}

Go To Quotes
    Click Element               ${Quotes}

Go To Settings
    Click Element               ${Settings}

Go To Help
    Click Element               ${Help}


Go To Products
    ${status} =	Run Keyword And return status	Click Element         ${Products}
    Run Keyword If	'${status}' == 'False'	    Open and go to Products
#    ...   ELSE         Click Element         ${Products}
    Wait until page contains element              xpath=/html//div[@id='content-header']//ul[@class='inline-menu']/li[2]/label[@id='admin_new_product']

Open and go to Products
    Click Element         ${Products General}
    Click Element         ${Products}


Go To Categories
    ${status} =	Run Keyword And return status	Click Element         ${Categories}
    Run Keyword If	'${status}' == 'False'  	Open and go to Categories
     Wait until page contains                Tree

Open and go to Categories
    Click Element         ${Products General}
    Click Element         ${Categories}