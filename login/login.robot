*** Settings ***
Library         Selenium2Library
Resource        data.robot
Resource        keyword.robot
Test Setup    Run Keywords
...           Open Browser To Login Page    AND
...           Verify Login Page
Test Teardown    Close Browser

*** Test Cases ***
Login Success
    Login With Username And Password  ${USERNAME_VALID}    ${PASSWORD_VALID}
    Verify Login Success
    Logout
    Verify Logout Success

Login Fail - Password Incorrect
    Login With Username And Password    ${USERNAME_VALID}    ${PASSWORD_INVALID}
    Verify Login Fail    ${LOGIN_PASSWORD_INVALID}

Login Fail - Username Not Found
    Login With Username And Password    ${USERNAME_INVALID}    ${PASSWORD_INVALID}
    Verify Login Fail    ${LOGIN_USERNAME_INVALID}