*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${URL}    https://front.serverest.dev/login
${NOME}    Luan Thomass Cláudio Nunes
${EMAIL}    ludanthomssasnunes@testerest.com
${PASSWORD}    75uj0m7k
*** Test Cases ***
Deve acessar a página de cadastro com sucesso
    Open Browser    ${URL}    chrome
    Set Window Size    1920    1080
    Click Link    xpath=//*[@id="root"]/div/div/form/small/a
    Wait Until Location Is    https://front.serverest.dev/cadastrarusuarios
    Close Browser
Deve realizar um cadastro com sucesso
    Open Browser    ${URL}    chrome
    Click Link    xpath=//*[@id="root"]/div/div/form/small/a
    Input Text    id=nome    ${NOME}
    Input Text    id=email    ${EMAIL}
    Input Text    id=password    ${PASSWORD}
    Click Button    xpath=//*[@data-testid="cadastrar"]
    Wait Until Page Contains    Cadastro realizado com sucesso
    Close Browser