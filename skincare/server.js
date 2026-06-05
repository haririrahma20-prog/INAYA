const express = require('express');
const mysql = require('mysql2');

const app = express();

app.use(express.json());

// ======================
// DATABASE CONNECTION
// ======================
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'inaya_db'
});

db.connect((err) => {
  if (err) {
    console.log('DB connection error ❌', err);
  } else {
    console.log('MySQL connected ✔');
  }
});

// ======================
// GET PRODUCTS
// ======================
app.get('/products', (req, res) => {
  const { category, skin, step } = req.query;

  let sql = `
    SELECT DISTINCT p.*
    FROM products p
    LEFT JOIN product_categories pc
      ON p.id = pc.product_id
    LEFT JOIN product_skin_types pst
      ON p.id = pst.product_id
    WHERE 1=1
  `;

  let params = [];

  // CATEGORY
  if (category) {
    sql += ' AND pc.category_id = ?';
    params.push(category);
  }

  // STEP
  if (step) {
    sql += ' AND p.step_id = ?';
    params.push(step);
  }

  // SKIN TYPE
  if (skin) {
    sql += ' AND pst.skin_type_id = ?';
    params.push(skin);
  }

  db.query(sql, params, (err, result) => {
    if (err) {
      console.log('DB ERROR:', err);
      return res.status(500).json({
        error: 'Database error'
      });
    }

    res.json(result);
  });
});

// ======================
// REGISTER USER
// ======================
app.post('/register', (req, res) => {
  const {
    username,
    email,
    password,
    language,
    skin_type_id
  } = req.body;

  const checkSql =
    'SELECT * FROM users WHERE email = ?';

  db.query(checkSql, [email], (err, result) => {
    if (err) {
      console.log(err);

      return res.status(500).json({
        message: 'Database error'
      });
    }

    if (result.length > 0) {
      return res.status(400).json({
        message: 'User already exists'
      });
    }

    const insertSql = `
      INSERT INTO users
      (name, email, password, language, skin_type_id)
      VALUES (?, ?, ?, ?, ?)
    `;

    db.query(
      insertSql,
      [
        username,
        email,
        password,
        language,
        skin_type_id
      ],
      (err, result) => {
        if (err) {
          console.log(err);

          return res.status(500).json({
            message: 'Insert error'
          });
        }

        return res.json({
          message: 'Registered successfully ✔',
          userId: result.insertId
        });
      }
    );
  });
});

// ======================
// SERVER
// ======================
app.post('/login', (req, res) => {

  const { email, password } = req.body;

  const sql = `
    SELECT *
    FROM users
    WHERE email = ?
    AND password = ?
  `;

  db.query(
    sql,
    [email, password],
    (err, result) => {

      if (err) {
        return res.status(500).json({
          message: 'Database error'
        });
      }

      if (result.length === 0) {
        return res.status(401).json({
          message: 'Invalid email or password'
        });
      }

      const user = result[0];

      return res.json({
        message: 'Login successful',
        user: {
          id: user.id,
          username: user.name,
          email: user.email,
          language: user.language
        }
      });
    }
  );
});


app.listen(3000, '0.0.0.0', () => {
  console.log('Server running on port 3000 🚀');
});