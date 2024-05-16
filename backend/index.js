const express = require("express");
const cors = require("cors");
const bcrypt = require('bcryptjs');
const { Sequelize, DataTypes } = require("sequelize");
const jwt = require("jsonwebtoken");
// sequelize is orm

const app = express();
app.use(cors());
app.use(express.json());
const port = 8001;
// ideal que a senha secreta estivesse na env e precisa ser string
const secret = "mysql";

const sequelize = new Sequelize('forum', 'Helena', 'mysql', {
  host: 'localhost',
  port: 3306,
  dialect: 'mysql',
  define: {
    freezeTableName: true
  }
});

const atuacao = sequelize.define("tb_area_atuacao", {
  cd_area_atuacao: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    allowNull: false,
    primaryKey: true
  },
  nm_area_atuacao: {
    type: DataTypes.TEXT,
    allowNull: false,
    unique: true
  },
  txt_area_atuacao: {
    type: DataTypes.TEXT,
    allowNull: true
  }
}, {
  timestamps: false
});

const pessoa = sequelize.define("tb_pessoa", {
  cd_pessoa: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    allowNull: false,
    autoIncrement: true
  },
  nome_pessoa: {
    type: DataTypes.CHAR(250),
    allowNull: false
  },
  email_pessoa: {
    type: DataTypes.CHAR(250),
    unique: true,
    allowNull: false
  },
  senha_pessoa: {
    type: DataTypes.CHAR(250),
    allowNull: false
  }
}, { timestamps: false });

const area = sequelize.define("tb_pessoa_area", {
  cd_pessoa: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    allowNull: false
  },
  cd_area_atuacao: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    allowNull: false
  }
}, { timestamps: false });

app.get("/login", async (req, res) => {
  try {
    pessoa.findOne({
      raw: true,
      where: { email_pessoa: req.query.email }
    }).then(result => {
      if (bcrypt.compareSync(req.query.pass, result.senha_pessoa) == true) {
        res.status(200).send(jwt.sign({ id: result.cd_pessoa }, secret, { algorithm: "HS256", expiresIn: "1h" }));
      } else {
        res.status(401).end("Email ou senha incorreta");
      }
    }).catch(err => {
      res.status(401).end("Email ou senha incorreta");
    });
  } catch (err) {
    console.log(err);
    res.status(500).end("Erro interno login");
  }
});

app.get("/getuser", (req, res) => {
  try {
    jwt.verify(`${req.headers.token}`, secret, { algorithm: "HS256" }, (err, decoded) => {
      if (!decoded) {
        res.status(401).end("Realize o login novamente");
      } else {
        var dataUser = {};
        pessoa.findOne({
          where: { cd_pessoa: decoded.id }
        }).then(rdu => {
          // rdu = result data user
          dataUser["name"] = rdu.dataValues.nome_pessoa;
          dataUser["email"] = rdu.dataValues.email_pessoa;
          area.findOne({
            where: { cd_pessoa: decoded.id }
          }).then(rdu => {
            atuacao.findOne({
              where: { cd_area_atuacao: rdu.dataValues.cd_area_atuacao }
            }).then(rdu => {
              dataUser["atuacao"] = rdu.dataValues.nm_area_atuacao;
              dataUser["txt"] = rdu.dataValues.txt_area_atuacao;
              res.status(200).send(dataUser);
            });
          });
        }).catch(err => {
          res.status(500).end("erro interno, impossivel buscar dados usuario");
        });
      }
    });
  } catch (err) {
    res.status(500).end("Erro interno");
  }
});

app.post("/register", (req, res) => {
  try {
    if (req.body.name == '' || req.body.email == '' || req.body.pass == '' || req.body.option == undefined) {
      res.status(400).end("Algum campo esta vazio");
    } else {
      pessoa.findOne({
        raw: true,
        where: { email_pessoa: req.body.email }
      }).then((result_search) => {
        if (result_search) {
          res.status(400).end("Email ja existe");
        } else {
          pessoa.create({
            nome_pessoa: req.body.name,
            email_pessoa: req.body.email,
            senha_pessoa: req.body.pass
          }).then((rcu) => {
            // rcu = result create user
            area.create({
              cd_pessoa: rcu.dataValues.cd_pessoa,
              cd_area_atuacao: Number(req.body.option)
            }).then(() => {
              res.status(201).end("criado");
            }).catch(err => {
              pessoa.destroy({
                where: { email_pessoa: req.body.email }
              }).then(() => { res.status(500).end(); });
            });
          }).catch(err => {
            res.status(500).end("erro interno, impossivel criar usuario, tente novamente");
          });
        }
      }).catch(() => {
        res.status(500).end("erro interno, tente novamente, ou contate o adm");
      });
    }

  } catch (err) {
    console.log(err);
    res.status(500).end("erro interno, tente novamente, ou contate o adm");
  }
});

app.listen(port, () => {
  console.log(`Backend disponivel na porta ${port}`);
});