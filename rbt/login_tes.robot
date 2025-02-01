*** Settings ***
Library    Browser

*** Variables ***
${URL}          https://the-internet.herokuapp.com/login
${USERNAME}     tomsmith
${PASSWORD}     SuperSecretPassword!
${ERROR_MSG}    Your username is invalid!
${SUCCESS_MSG}  You logged into a secure area!

*** Test Cases ***
Login Exitoso
    Open Browser    ${URL}    chrome
    Fill Text    css=#username    ${USERNAME}
    Fill Text    css=#password    ${PASSWORD}
    Click    css=button[type="submit"]
    Wait For Elements State    css=.flash.success    visible
    Get Text    css=.flash.success    contains    ${SUCCESS_MSG}
    Close Browser

Login Fallido
    Open Browser    ${URL}    chrome
    Fill Text    css=#username    usuario_invalido
    Fill Text    css=#password    clave_invalida
    Click    css=button[type="submit"]
    Wait For Elements State    css=.flash.error    visible
    Get Text    css=.flash.error    contains    ${ERROR_MSG}
    Close Browser
