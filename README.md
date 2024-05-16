# ConectaPlus-Application

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

npm i

Este comando iniciará o servidor back-end:

npm start

4. Agora, você pode abrir o arquivo index.html do front-end no servidor. No caso, pode usar o Live Server

Obs.: Em caso de erro após o primeiro ciclo de welcome -> cadastro -> login -> perfil, verifique se o servidor Node.js ainda está em execução no banco de dados. Se não estiver, pressione "ctrl c" para limpar o terminal e execute npm start novamente para restaurar as funcionalidades da aplicação.

Stack: HTML, CSS, JS, MYSQL.

