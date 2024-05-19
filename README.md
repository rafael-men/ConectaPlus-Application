# ConectaPlus-Application
A aplicação apresenta um fluxo de telas relacionadas às seguintes páginas: inicial, login, cadastro e perfil do usuário. Ao acessar o site, o usuário tem a opção de clicar no botão "Login/Cadastro", permitindo realizar o cadastro e, posteriormente, o login. Após efetuar o login, o usuário é redirecionado para a página de perfil, a qual contém um botão de "Sair". Esse botão permite que o usuário retorne à página inicial, possibilitando repetir esse ciclo conforme necessário.

## Tutorial para inicializar o sistema

Para começar, siga estes passos:

1. Abra as pastas do front-end e back-end em diferentes janelas do VS Code (a IDE utilizada).

2. Na pasta do back-end, substitua os campos no arquivo `index.js` com suas credenciais:

```javascript
const secret = "sua senha";

const sequelize = new Sequelize('nome do schema no BD', 'root padrão ou personalizada', 'senha do BD', {
  host: 'localhost',
  port: 3306,
  dialect: 'senha do BD',
  define: {
    freezeTableName: true
  }
});
```
3. Após configurar as credenciais, ainda no diretório do back-end, execute os seguintes comandos no terminal:

Este comando instalará todas as dependências necessárias: 
```
npm i
```

Este comando iniciará o servidor back-end:
```
npm start
```

4. Agora, você pode abrir o arquivo index.html do front-end no servidor. No caso, pode usar o Live Server.

Obs.: Em caso de erro após o primeiro ciclo de welcome -> cadastro -> login -> perfil, verifique se o servidor Node.js ainda está em execução no banco de dados. Se não estiver, pressione "ctrl c" para limpar o terminal e execute npm start novamente para restaurar as funcionalidades da aplicação.

## Stack de desenvolvimento front-end
HTML, CSS, JS.

## Stack de desenvolvimento back-end
Foram itilizados JavaScript, Node.js, Express.js para criar APIs, Sequelize como ORM para interagir com um banco de dados MySQL, e JWT para autenticação

De forma detalhada:

1. **Node.js**: Ambiente de tempo de execução para JavaScript.
2. **Express.js**: Framework web para Node.js, utilizado para criar APIs RESTful.
3. **Sequelize**: ORM (Object-Relational Mapping) para Node.js, usado para interagir com o banco de dados MySQL.
4. **bcryptjs**: Biblioteca para criptografar senhas.
5. **jsonwebtoken**: Para geração e verificação de tokens JWT para autenticação.
6. **cors**: Middleware do Express para habilitar o CORS (Cross-Origin Resource Sharing).
7. **MySQL**: Banco de dados relacional utilizado para armazenar os dados da aplicação.
8. **package-lock.json**: Arquivo que garante a consistência das versões das dependências instaladas em um projeto Node.js, assegurando reprodutibilidade e segurança nas instalações.
9. **package.json**: Arquivo para gerenciar as dependências do projeto e scripts de inicialização.
10. **.gitignore**: arquivo contendo o `node_modules`.
11. **MySQL Workbench**: Bando de dados relacional utilizado paramontar os schemas da aplicação.
