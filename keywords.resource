*** Settings ***
Documentation    Implementation for the simple page object model based selenium projects with robotframework.
Library    OperatingSystem
Library    SeleniumLibrary


*** Keywords ***
Load Drivers
    [Documentation]    Append chromedriver from execdir to env path.
    Append To Environment Variable    ${EXECDIR}${/}chromedriver.exe

Import Page Objets
    [Documentation]    Import resource file with page objects based on page or group of elements. e.g. HeaderMenu or MainPage.
    [Arguments]    ${page}
    Import Resource    ${EXECDIR}${/}PageObjects${/}${page}.resource

Check Page
    [Documentation]    Check if we are at the correct page
    [Arguments]    ${page}
    Import Page Objets    ${page}
    ${current_title}    Get Title
    IF    '${current_title}' == '${pageid}'
        Log    Page check PASSED: ${current_title}  level=INFO    console=True
    ELSE
        Log    Page check FAILED. ${\n}Expected page was: ${pageid}, but actual is: ${current_title}    level=INFO  console=True
    END

Click On Element
    [Documentation]    Arguments are page and object from page. e.g. LoginPage UserField
    [Arguments]    ${page}    ${element}
    Wait Until Element Is Visible    ${${element}}
    Wait Until Element Is Enabled    ${${element}}
    Click Element    ${${element}}

Add To Cart
    [Documentation]    Add item to cart. It should be the name from h4 from product-thumb.
    [Arguments]    ${page}    ${product}
    Wait Until Element Is Visible    ${${element}}
    Wait Until Element Is Enabled    ${${element}}
    Click Element    //a[text()="${product}"]/ancestor::div[@class="product-thumb"]//i[contains(@class,"fa-shopping-cart")]/ancestor::button

Check Cart Total Balance
    [Documentation]    Check that the cart total has expected value. e.g. 1 item(s) - $122.00.
    [Arguments]        ${cart_value}
    Import Page Objets    CartMenu
    Wait Until Element Is Visible    ${CartTotal}
    ${actual_cart_value}    Get Text    ${CartTotal}
    IF    '${actual_cart_value}' == '${cart_value}'
       Log    Cart Value Check PASSED: ${actual_cart_value} EXPECTED: ${cart_value}   level=INFO    console=True
    ELSE
       Log    Cart Value Check FAILED: ${actual_cart_value} EXPECTED: ${cart_value}    level=INFO    console=True
    END

