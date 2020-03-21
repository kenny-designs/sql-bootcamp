const express    = require('express'),
      mysql      = require('mysql'),   // interact with the database
      bodyParser = require('body-parser'),
      app        = express();

// Embedded JavaScript view engine (similar to PUG/jade)
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(__dirname + '/public'));

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '', // TODO: add in password
  database: 'join_us'
});

app.get('/', (req, res) => {
  let q = 'SELECT COUNT(*) AS count FROM users';
  connection.query(q, (error, results, fields) => {
    if (error) throw error; 
    let count = results[0].count;
    res.render('home', {data: count});
  });
});

app.post('/register', (req, res) => {
  // body-parser makes it so we can easily extra data like this
  // body would be undefined otherwise
  let person = {
    email: req.body.email
  };

  connection.query('INSERT INTO users SET ?', person, (error, results, fields) => {
    if (error) throw error; 
    res.redirect('/');
  });
});

app.listen(8080, () => {
  console.log('Listening on port 8080...');
});
