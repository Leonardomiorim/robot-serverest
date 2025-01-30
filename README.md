# **Robot Serverest**

Este projeto utiliza o **Robot Framework** para realizar testes automatizados de API e Frontend na aplicação **Serverest**.

---

## **📦 Dependências**

### Certifique-se de ter as seguintes ferramentas instaladas no seu ambiente:

- **Python 3.8 ou superior**
- **Robot Framework**
- Bibliotecas do Robot Framework:
  - **SeleniumLibrary**
  - **RequestsLibrary**
  - **DateTime**

### Para instalar todas as dependências, execute:
 - pip install -r requirements.txt
---
## **🚀 Como Executar os Testes**

### **Frontend**

1. Certifique-se de que o Frontend da aplicação **Serverest** está rodando.
2. Navegue até a pasta `Testes/Frontend`.
3. Execute o seguinte comando para rodar um teste específico:
   - robot cadastro.robot
### Para rodar todos os testes de Frontend:
   - robot .

### **API**

1. Certifique-se de que a API **Serverest** está rodando.
2. Navegue até a pasta `Testes/API`.
3. Execute o seguinte comando para rodar um teste específico:
 - robot cadastro.robot   
### Para rodar todos os testes de API:
 - robot .
---
 ## **📝 Testes Implementados**

### **Frontend**

- **Cadastro:**
  - Acessar a página de cadastro.
  - Realizar um cadastro com sucesso.

- **Login:**
  - Realizar login com credenciais válidas.
  - Exibir mensagem de erro com credenciais inválidas.

- **Produtos:**
  - Adicionar um produto à lista.
  - Limpar a lista de produtos.
  - Fazer logout.

  ### **API**

- **Cadastro de Usuários:**
  - Listar usuários cadastrados.
  - Cadastrar um novo usuário.
  - Buscar um usuário pelo ID.

- **Produtos:**
  - Listar produtos cadastrados.
  - Buscar um produto pelo ID.

- **Usuários:**
  - Realizar o cadastro de um novo usuário.
  - Realizar login com sucesso.
  - Exibir mensagem de erro com credenciais inválidas.
---
  ## **📊 Relatórios**

Os relatórios são gerados automaticamente após a execução dos testes e podem ser encontrados na pasta `Reports`. Use os arquivos `log.html` e `report.html` para verificar os detalhes de cada execução.
---
## **🛠️ Ferramentas Utilizadas**

- **Robot Framework:** Framework principal para automação de testes.
- **SeleniumLibrary:** Automação de testes no Frontend.
- **RequestsLibrary:** Automação de testes para APIs REST.
- **DateTime:** Geração de timestamps únicos para testes dinâmicos.
---
## **🔧 Configuração do Ambiente**

### **Variáveis**

As variáveis utilizadas no projeto estão definidas diretamente nos arquivos `.robot`. Aqui estão alguns exemplos importantes:

#### **Frontend:**

- **URL:** URL base do Frontend (`https://front.serverest.dev/login`).
- **EMAIL:** Credenciais válidas para login.
- **PASSWORD:** Senha válida.

#### **API:**

- **BASE_URL:** URL base da API (`https://serverest.dev`).