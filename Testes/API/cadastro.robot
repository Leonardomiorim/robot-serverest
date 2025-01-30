*** Settings ***
Library    RequestsLibrary
Library    DateTime
*** Variables ***
${BASE_URL}    https://serverest.dev
*** Keywords ***
Criar Sessão
    [Documentation]    Cria uma sessão para interagir com a API Serverest.
    Create Session    serverest    ${BASE_URL}    verify=False
    Run Keyword If    "${BASE_URL}" != ""    Evaluate    __import__('urllib3').disable_warnings()
Gerar Email Único
    [Documentation]    Gera um e-mail único com base no timestamp.
    ${timestamp}    Get Time    epoch
    RETURN    teste${timestamp}@serverest.dev
*** Test Cases ***
Deve listar usuários cadastrados
    [Documentation]    Verifica se os usuários cadastrados são listados com sucesso.
    Criar Sessão
    ${response}    GET On Session    serverest    /usuarios
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Be True    ${response.json()['quantidade']} > 0
    Should Be True    isinstance(${response.json()['usuarios']}, list)
Deve cadastrar um novo usuário
    [Documentation]    Verifica se um novo usuário pode ser cadastrado corretamente.
    Criar Sessão
    ${email}    Gerar Email Único
    ${body}    Create Dictionary    nome=Mark    email=${email}    password=123456    administrador=true
    ${response}    POST On Session    serverest    /usuarios    json=${body}
    Should Be Equal As Numbers    ${response.status_code}    201
    Should Be Equal As Strings    ${response.json()['message']}    Cadastro realizado com sucesso
Deve buscar um usuário pelo ID
    [Documentation]    Verifica se é possível buscar um usuário pelo ID.
    Criar Sessão
    ${response}    GET On Session    serverest    /usuarios
    ${idUsuario}    Set Variable    ${response.json()['usuarios'][0]['_id']}
    ${res}    GET On Session    serverest    /usuarios/${idUsuario}
    Should Be Equal As Numbers    ${res.status_code}    200
    Should Be Equal As Strings    ${res.json()['_id']}    ${idUsuario}