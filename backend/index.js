const express = require("express");
const cors = require("cors");
const {Sequelize, DataTypes} = require("sequelize");
const jwt = require("jsonwebtoken");
// sequelize is orm

const app = express();
app.use(cors());
const port = 8001;
// ideal que a senha secreta estivesse na env e precisa ser string
const secret = "12345";

const sequelize = new Sequelize('forum', 'lenor', '12345', {
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
  ds_area_atuacao: {
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
    allowNull: false
  },
  nome_pessoa: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  email_pessoa: {
    type: DataTypes.TEXT,
    unique: true,
    allowNull: false
  },
  senha_pessoa: {
    type: DataTypes.TEXT,
    allowNull:false
  },
  documento_pessoa: {
    type: DataTypes.TEXT,
    unique: true,
    allowNull: false
  },
  tipo_pessoa: {
    type: DataTypes.TEXT,
    allowNull: false    
  }
}, {timestamps: false});

const area = sequelize.define("tb_pessoa_area", {
  cd_pessoa: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  cd_area_atuacao: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  dt_inicio_vigencia: {
    type: DataTypes.DATE,
    allowNull: false
  },
  dt_fim_vigencia: {
    type: DataTypes.DATE,
    allowNull: true
  }
}, {timestamps: false});

app.get("/login", async (req, res) => {
  try {
    pessoa.findOne({
      raw: true,
      where: { email_pessoa: req.query.email}
    }).then(result => {
      if (result.senha_pessoa === req.query.pass) {
        res.status(200).send(jwt.sign({id: result.cd_pessoa}, secret, {algorithm: "HS256"}));
      } else {
        res.status(401).end("Email ou senha incorreta");
      }
    }).catch(err => {
      res.status(401).end("Email ou senha incorreta");
    });
  } catch (err) {
    console.log(err);
    res.status(500).end("Erro login");
  }
});

app.get("/getuser", (req, res) => {
  jwt.verify(`${req.headers.token}`, secret, {algorithm: "HS256"}, (err, decoded) => {
    if (!decoded) {
      res.status(401).end("Realize o login novamente");
    } else {
      res.status(200).end();
    }
  });
});

app.listen(port, () => {
  console.log(`Backend disponivel na porta ${port}`);
});