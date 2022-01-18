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

app.get('/classes', (req, res) => {
  dbConnection.query('SELECT * FROM Ready_CourseLongNames', (err, result, fields) => {
    if (err) return console.error('[Error] ' + err.message)
    let viewData = {classInfo: result}
    res.render('classSelect', viewData)
  })
})

app.get('/schedule', (req, res) => {
  let params = req.query
  let classesChosen = Object.keys(params)
  console.log(classesChosen)
  let query = 'SELECT * FROM Ready_CourseLongNames WHERE '
  classesChosen.forEach((element) => {
    query += 'course="' + element + '" OR '
  })
  query += '1=2'
  console.log(query)
  dbConnection.query(query, (err, result, fields) => {
    if (err) return console.error('[Error] ' + err.message)
    let viewData = {classInfo: result}
    res.render('buildSchedule', viewData)
  })
})

app.get('/', (req, res) => {
  let itemsPerPage = Number(req.query.per)
  let pageNo = Number(req.query.page)
  dbConnection.query('SELECT * FROM Ready_CourseLongNames', (err, result, fields) => {
    if (err) return console.error('[Error] ' + err.message)
    let startIndex = itemsPerPage*pageNo
    let items = result.slice(startIndex, startIndex+itemsPerPage)
    let itemsCount = result.length
    let metadata = {total: itemsCount, page: pageNo, per: itemsPerPage}
    res.send({metadata: metadata, items: items})
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
  if (err) return console.error('[Error] ' + err.message)
  console.log("Connected!")
})

app.set('views', '../views')
app.set('view engine', 'ejs')

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`)
})
