*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}                http://rjux0170.claro.com.br/v2/login
${BROWSER}            chrome
#Usuario Leonardo Requena ( Perfil Master )
${LOGIN}                92030346
${SENHA}                1234


*** Keywords ***
Inicia sessão
    Open Browser                    ${URL}      ${BROWSER}

Encerra sessão
    Capture Page Screenshot
    Close Browser