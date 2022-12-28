*** Settings ***
Resource        modelo.robot

Test Setup      Inicia sessão 
Test Teardown   Encerra sessão

*** Test Cases ***
Login com sucesso
    [tags]                          login_sucesso
    Go To                           ${URL}
    Preencher Login                 ${LOGIN}       ${SENHA}

    Pagina Sucesso                  InfoWeb - rjux0170.claro.com.br

Login invalido
    Go To                           ${URL}
    Preencher Login                 0        0

    Mensagem alerta Login           LOGIN INVÁLIDO

*** Keywords ***
Preencher Login
    [Arguments]                     ${LOGIN}       ${SENHA}

    Input Text                      css:input[name=login]        ${LOGIN}
    Input Text                      css:input[name=senha]          ${SENHA}
    Click Element                   css:input[name='btnLogin']

Mensagem alerta Login
    [Arguments]                     ${mensagem_esperada}

    ${mensagem}=                     Get webElement          class:statusBox
    Should Contain                  ${mensagem.text}         ${mensagem_esperada}

Pagina Sucesso
    [Arguments]                     ${full_name}
     Page Should Contain            ${full_name}