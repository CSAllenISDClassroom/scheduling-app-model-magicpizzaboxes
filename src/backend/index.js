const express = require('express')
const mysql = require('mysql2')
const fs = require('fs')
const cookieParser = require('cookie-parser')
const app = express()
const port = 10442

var sessions = []

app.use(cookieParser())
app.use((req, res, next) => {
  let previousCookie = req.cookies.sessionId
  if(!previousCookie) {
    let sessionId = (Math.random() % 0xffffffffffffffff).toString(16)
    res.cookie('sessionId', sessionId, {maxAge:3600000, httpOnly:true})
    sessions.push({sessionId:sessionId})
    console.log('[Info] New session: ' + sessionId)
  } else {
    console.log('[Info] Page accessed by user ' + previousCookie)
  }
  next()
})

app.get('/', (req, res) => {
  dbConnection.query('SELECT * FROM Ready_CourseLongNames', (err, result, fields) => {
    if (err) return console.error('error: ' + err.message)
    let viewData = {classInfo: result}
    res.render('classSelect', viewData)
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

app.set('views', '../views')
app.set('view engine', 'ejs')

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`)
})
