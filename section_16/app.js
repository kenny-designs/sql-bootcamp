const faker = require('faker'); // fake user data
const mysql = require('mysql'); // interact with database

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  // TODO: miss me with leaving my password in there fool
  password: '',
  database: 'join_us'
});

connection.connect();

// SELECTING DATA
/*
let q = 'SELECT COUNT(*) AS total FROM users';
connection.query(q, function (error, results, fields) {
  if (error) throw error;
  console.log(results);
});
*/

// INSERTING DATA
/*
let person = {
  email: faker.internet.email(),
  created_at: faker.date.past()
};

connection.query('INSERT INTO users SET ?', person, function (error, results, fields) {
  if (error) throw error;
  console.log(results);
});
*/

// INSERTING BULK DATA
let data = [];

// add 500 random users
for(let i = 0; i < 500; i++) {
  data.push([
    faker.internet.email(),
    faker.date.past()
  ]);
}

let q = 'INSERT INTO users(email, created_at) VALUES ?';

connection.query(q, [data], function (error, results, fields) {
  if (error) throw error;
  console.log(results);
});

connection.end();
