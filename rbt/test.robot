*** Settings ***
Library    Browser

*** Test Cases ***
Abrir Página y Verificar Título
    New Browser    headless=False
    New Page    https://www.google.com.gt/
    Get Title    ==    Example Domain
    Close Browser
