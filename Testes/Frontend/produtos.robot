*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL_LOGIN}    https://front.serverest.dev/login
${URL_HOME}    https://front.serverest.dev/home
${EMAIL}    luanthomasnunes@testerest.com
${SENHA}    75uj0m7k

*** Keywords ***
Fazer Login
    Open Browser    ${URL_LOGIN}    chrome
    Set Window Size    1920    1080
    Input Text    id=email    ${EMAIL}
    Input Text    id=password    ${SENHA}
    Click Button    xpath=//*[@data-testid="entrar"]
    Wait Until Location Is    ${URL_HOME}

Clicar no Produto
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div/div[2]/div/section/div[1]/div/a    timeout=5s
    Click Element    xpath=//*[@id="root"]/div/div/div[2]/div/section/div[1]/div/a
    Wait Until Location Contains    /detalhesProduto
    
Adicionar Produto à Lista
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div/div/section/div/div[1]/a    timeout=5s
    Click Element    xpath=//*[@id="root"]/div/div/div/section/div/div[1]/a
    Wait Until Location Contains    /minhaListaDeProdutos

Voltar para Página Inicial
    Wait Until Element Is Visible    xpath=//*[@data-testid="paginaInicial"]    timeout=5s
    Click Button    xpath=//*[@data-testid="paginaInicial"]
    Wait Until Location Is    ${URL_HOME}

Fazer Logout
    Wait Until Element Is Visible    xpath=//*[@data-testid="logout"]    timeout=5s
    Click Button    xpath=//*[@data-testid="logout"]
    Wait Until Location Is    ${URL_LOGIN}   

*** Test Cases ***
Deve adicionar um produto à lista, limpar a lista e fazer logout
    Fazer Login
    Clicar no Produto
    Adicionar Produto à Lista
    Voltar para Página Inicial
    Fazer Logout
  
    
    

