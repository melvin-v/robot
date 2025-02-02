*** Settings ***
Library  Browser
Library  OperatingSystem

*** Variables ***
${URL}     https://click.gt/account/login
${TIMEOUT}      60s
${LOADER}       //div[@class='preloader']
${USER}    ${EMPTY}
${PASSWORD}    ${EMPTY}
${OUTPUT_DIR}    ./resultados

*** Test Cases ***
Login y busqueda de producto
    Create Directory    ${OUTPUT_DIR}
    Browser.New Browser    chromium    args=["--auto-open-devtools-for-tabs"]
    Browser.New Context    recordVideo={'dir': './videos', 'size': {'width': 1280, 'height': 720}}
    New Page    ${URL}

    Wait For Elements State    id=CustomerEmail    visible    timeout=${TIMEOUT}
    Fill Text    id=CustomerEmail    ${USER}
    Fill Text    id=CustomerPassword    ${PASSWORD}
    Click     xpath=//span[text()='Iniciar sesión' and not(contains(@class, 'visually-hidden'))]
    Log    Ingreso de datos completado y botón de iniciar sesión clicado

    Wait For Elements State    ${LOADER}    hidden    timeout=${TIMEOUT}
    Log                        Login exitoso, navegando al enlace objetivo

    [Teardown]    Close Browser
