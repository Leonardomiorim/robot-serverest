*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    BuiltIn
Library    String

*** Variables ***
${BASE_URL}    https://serverest.dev

*** Keywords ***
Criar Sessão
    [Documentation]    Cria uma sessão para interagir com a API Serverest.
    Create Session    serverest    ${BASE_URL}    verify=False
    Run Keyword If    "${BASE_URL}" != ""    Evaluate    __import__('urllib3').disable_warnings()

*** Test Cases ***
Deve listar produtos cadastrados
    [Documentation]    Verifica se os produtos cadastrados são listados com sucesso.
    Criar Sessão
    ${response}    GET On Session    serverest    /produtos
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Be True    isinstance(${response.json()['produtos']}, list)
    Should Not Be Empty    ${response.json()['produtos']}

Deve buscar um produto pelo ID
    [Documentation]    Verifica se é possível buscar um produto específico pelo ID.
    Criar Sessão
    ${response}    GET On Session    serverest    /produtos
    ${idProduto}    Set Variable    ${response.json()['produtos'][0]['_id']}
    ${res}    GET On Session    serverest    /produtos/${idProduto}
    Should Be Equal As Numbers    ${res.status_code}    200
    Should Be Equal As Strings    ${res.json()['_id']}    ${idProduto}


