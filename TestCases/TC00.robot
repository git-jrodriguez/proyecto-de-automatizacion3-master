*** Settings ***
Documentation    Suite description
Resource         ../Resources/Backend/Login.robot
Resource         ../Resources/Backend/Customers/Customers.robot
Resource         ../Resources/Backend/Sidebar.robot
Suite Setup      LogIn to Spirit Sales
# Suite Teardown   Close Site


*** Test Cases ***
Products
    [Tags]    DEBUG
    Go To Dashboard
    Go To Categories
    Go To Products
    Go To Categories