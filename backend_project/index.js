const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

const router = require('./src/router');

app.use('/', router);

app.listen(port, () => {
  console.log(`웹서버 구동... ${port}`);
});
