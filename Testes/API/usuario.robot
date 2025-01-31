*** Settings ***
Library    RequestsLibrary
Library    DateTime

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
Deve realizar login com sucesso
    Criar Sessão
    ${email}    Gerar Email Único
    ${bodyCadastro}    Create Dictionary    nome=Mark    email=${email}    password=mark123    administrador=true
    ${responseCadastro}    POST On Session    serverest    /usuarios    json=${bodyCadastro}
    Log    ${responseCadastro.json()}    console=True
    Should Be Equal As Numbers    ${responseCadastro.status_code}    201
    Should Be Equal As Strings    ${responseCadastro.json()['message']}    Cadastro realizado com sucesso

    ${bodyLogin}    Create Dictionary    email=${email}    password=mark123
    ${responseLogin}    POST On Session    serverest    /login    json=${bodyLogin}
    Log    ${responseLogin.json()}    console=True
    Should Be Equal As Numbers    ${responseLogin.status_code}    200
    Should Not Be Empty    ${responseLogin.json()['authorization']}

Deve retornar erro ao tentar logar com credenciais inválidas
    Criar Sessão
    ${body}    Create Dictionary    email=easter.egg@serverest.dev    password=senhaerrada
    ${response}    POST On Session    serverest    /login    json=${body}    expected_status=401
    Log    ${response.json()}    console=True
    Should Be Equal As Numbers    ${response.status_code}    401
    Should Be Equal As Strings    ${response.json()['message']}    Email e/ou senha inválidos
