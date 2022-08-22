*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}

Login With Username And Password
    [Arguments]     ${username}    ${password}
    Input Text          ${USERNAME_LOCATOR}    ${username}
    Input Text          ${PASSWORD_LOCATOR}    ${password}
    Click Element       ${LOGIN_LOCATOR}

Logout
    Click Element    ${LOGOUT_LOCATOR}

Verify Login Page
    ${return_url} =    Get Location
    Should Be Equal    ${return_url}    ${URL}

Verify Login Success
    Element Should Contain    ${ALERT}    ${LOGIN_SUCCESS}

Verify Login Fail
    [Arguments]    ${login_fail}
    Element Should Contain     ${ALERT}    ${login_fail}

Verify Logout Success
    ${return_url} =    Get Location
    Should Be Equal             ${return_url}    ${URL}
    Element Should Contain      ${ALERT}    ${LOGOUT_SUCCESS}