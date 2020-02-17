*** Settings ***
Documentation    Suite description
Resource         ../Resources/Backend/Login.robot
Resource         ../Resources/Backend/Customers/Customers.robot
Suite Setup      LogIn to Spirit Sales
Suite Teardown   Close Site


*** Test Cases ***
Test title
    [Tags]    DEBUG
    Go to Customers
    Customers.Add New Customer
