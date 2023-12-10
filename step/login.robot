*** Settings ***
Library             SeleniumLibrary
Suite Setup         Open Browser    ${WebSauceDemo}     ${BROWSER}
Suite Teardown      Close Browser
Variables           ../resources/login-locator.yaml

*** Variables ***
${WebSauceDemo}     https://www.saucedemo.com/
${BROWSER}          chrome

# Locators
# ${UsernameField}    //input[@id='user-name']
# ${PasswordField}    //input[@id='password']
# ${LoginButton}      //input[@id='login-button']


*** Keywords ***
Input Username
    # Input Text  ${UsernameField}    standard_user
    Input Text  ${txtUsername}    standard_user

Input Invalid Username
    # Input Text  ${UsernameField}    standard_users
    Input Text  ${txtUsername}    standard_users

Input Password
    # Input Text  ${PasswordField}    secret_sauce
    Input Text  ${txtPassword}    secret_sauce

Click Button login
    # Click Element   ${LoginButton}
    Click Element   ${btnLogin}
    Sleep   1s

Verify on Login Page
    Page Should Contain     Products

*** Test Cases ***
User Login with Valid Data
    Input Username
    Input Password
    Click Button login
    Verify on Login Page

# User Login with Invalid Data
#     Input Invalid Username
#     Input Password
#     Click Button login