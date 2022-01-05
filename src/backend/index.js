const express = require('express')
const mysql = require('mysql2')
const fs = require('fs')
const app = express()
const port = 10442

var sessions = []

app.post('/session', (req, res) => {
  let sessionId = Math.floor(Math.random() * 999999999)
  sessions.push({'sessionId':sessionId})
  res.send({'sessionId':sessionId})
})

// This is v dangerous and is only included for testing purposes!
app.get('/session', (req, res) => {
  res.send(sessions)
})

app.get('/session/:sessionId', (req, res) => {
  let sessionId = req.params.sessionId
  let sessionData = sessions.find(element => element.sessionId == sessionId)
  res.send(sessionData)
})

app.get('/', (req, res) => {
  dbConnection.query("select * from Courses", function (err, result) {
    if (err) throw err;
    res.send(result)
  })
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
