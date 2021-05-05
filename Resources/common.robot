*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BASE_URL}  https://www.pokemon.com/
${BROWSER}  chrome
${loader_icon}  xpath://div[@class='loader']
${accept_cookies_popup}  id:onetrust-banner-sdk
${accept_cookies_btn}   id:onetrust-accept-btn-handler


*** Keywords ***
Begin Web Test
    Log to console  Running Step:: Begin web test
    Open Browser  ${BASE_URL}  ${BROWSER}
    Maximize Browser Window
    Sleep  3
    ${cookies_popup_displayed}=  Run Keyword And Return Status   Element Should Be Visible  ${accept_cookies_popup}
    Run Keyword If  ${cookies_popup_displayed} == True   Close cookies popup


End Web Test
    Log to console  Running Step:: End Web Test
    Close Browser


Close cookies popup
    Log to console  Running Step:: Close cookies popup
    Click Element   ${accept_cookies_btn}
    Wait until Page Contains Element    ${accept_cookies_popup}