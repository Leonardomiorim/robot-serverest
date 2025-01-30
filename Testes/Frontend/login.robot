*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://front.serverest.dev/login
${EMAIL_VALIDO}    luanthomasnunes@testerest.com
${SENHA_VALIDA}    75uj0m7k
${EMAIL_INVALIDO}    usuario.invalido@testerest.com.br
${SENHA_INVALIDA}    senhaerrada

*** Test Cases ***
Deve realizar login com sucesso
    Open Browser    ${URL}    chrome
    Set Window Size    1920    1080
    Input Text    id=email    ${EMAIL_VALIDO}
    Input Text    id=password    ${SENHA_VALIDA}
    Click Button    xpath=//*[@data-testid="entrar"]
    Sleep    2s   # Adiciona uma pausa para permitir o carregamento da página
    Close Browser

Deve exibir mensagem de erro para credenciais inválidas
    Open Browser    ${URL}    chrome
    Input Text    id=email    ${EMAIL_INVALIDO}
    Input Text    id=password    ${SENHA_INVALIDA}
    Click Button    xpath=//*[@data-testid="entrar"]
    Wait Until Page Contains    Email e/ou senha inválidos
    Close Browser
