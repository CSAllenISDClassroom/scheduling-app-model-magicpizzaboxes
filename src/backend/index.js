const express = require('express')
const mysql = require('mysql2')
const fs = require('fs')
const app = express()
const port = 8888

app.get('/', (req, res) => {
  res.send('Hello World!')
})

///// STARTUP INITIALIZATION /////

const dbLoginInfo = JSON.parse(fs.readFileSync('dbLogin.json'))
const dbConnection = mysql.createConnection({
  host: dbLoginInfo.host,
  user: dbLoginInfo.user,
  password: dbLoginInfo.password,
  database: dbLoginInfo.database
})
dbConnection.connect((err) => {
  if (err) return console.error('error: ' + err.message)
  console.log("Connected!")
})

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`)
})
