*** Settings ***
Library    RequestsLibrary
Library    DateTime    # Para gerar timestamps únicos
*** Variables ***
${BASE_URL}    https://serverest.dev
*** Keywords ***
Criar Sessão
    [Documentation]    Cria uma sessão para interagir com a API Serverest.
    Create Session    serverest    ${BASE_URL}    verify=False
Gerar Email Único
    [Documentation]    Gera um e-mail único com base no timestamp.
    ${timestamp}    Get Time    epoch
    RETURN    novo${timestamp}@serverest.dev
*** Test Cases ***
Deve realizar o cadastro de um novo usuário
    [Documentation]    Verifica se o cadastro de um novo usuário é realizado com sucesso.
    Criar Sessão
    ${email}    Gerar Email Único
    ${body}    Create Dictionary    nome=Mark    email=${email}    password=mark123    administrador=false
    ${response}    POST On Session    serverest    /usuarios    json=${body}
    Should Be Equal As Numbers    ${response.status_code}    201
    Should Be Equal As Strings    ${response.json()['message']}    Cadastro realizado com sucesso
Deve realizar login com sucesso
    [Documentation]    Verifica se o login é realizado com sucesso utilizando credenciais válidas.
    Criar Sessão
    ${body}    Create Dictionary    email=luanthomasnunes@testerest.com    password=75uj0m7k
    ${response}    POST On Session    serverest    /login    json=${body}    expected_status=200
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Not Be Empty    ${response.json()['authorization']}
Deve retornar erro ao tentar logar com credenciais inválidas
    [Documentation]    Verifica a mensagem de erro ao tentar realizar login com credenciais inválidas.
    Criar Sessão
    ${body}    Create Dictionary    email=easter.egg@serverest.dev    password=senhaerrada
    ${response}    POST On Session    serverest    /login    json=${body}    expected_status=401
    Should Be Equal As Numbers    ${response.status_code}    401
    Should Be Equal As Strings    ${response.json()['message']}    Email e/ou senha inválidos