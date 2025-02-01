*** Settings ***
Library    Browser

*** Test Cases ***
Abrir Página y Verificar Título
    New Browser    headless=True
    New Page    https://www.google.com.gt/
    ${title}    Get Title
    Log    ${title}
    Should Contain    ${title}    Google
    Close Browser

