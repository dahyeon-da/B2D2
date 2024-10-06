require('dotenv').config();
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
const bodyParser = require('body-parser');
const hbs = require('express-hbs');

// 핸들바 설정
app.engine('hbs', hbs.express4());
app.set('view engine', 'hbs');
app.set('views', __dirname + '/views');

const router = require('./src/router');

// JSON 형식의 본문을 처리하기 위한 미들웨어
app.use(bodyParser.json());

// URL 인코딩된 본문을 처리하기 위한 미들웨어 (폼 데이터)
app.use(bodyParser.urlencoded({ extended: true }));

app.use('/', router);

app.listen(port, () => {
  console.log(`웹서버 구동...${port}`);
});