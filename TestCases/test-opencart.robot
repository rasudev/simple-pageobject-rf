*** Settings ***
Resource    ../Keywords.resource
Suite Setup    Load Drivers

*** Variables ***
${URL}    https://demo.opencart.com/

*** Test Cases ***
Add Items To Cart
    [Documentation]    Test the page object model on the opencart demo page.
    Open Browser    browser=chrome    url=${URL}
    Check Page    YourStore
    Click On Element    YourStore    Desktops
    Click On Element    YourStore    Mac
    Check Page    Mac
    Add To Cart    Mac    iMac
    Check Cart Total Balance    1 item(s) - $122.00