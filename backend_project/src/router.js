const express = require('express')
const router = express.Router()
const verify = require('./middleware/jwtVerify')
const multer = require('multer');

const apiUserController = require('./api/user/userController');
const apiFeedController = require('./api/board/boardController');
const fileController = require('./api/file/fileController');
const storage = require('./middleware/upload');

const upload = multer({ storage: storage }).array('files');

router.post('/api/user/login', apiUserController.login);
router.post('/api/user/register', apiUserController.register);

router.post('/api/feed/write', verify, apiFeedController.feedWrite);
router.get('/api/feed/list', apiFeedController.feedShow);

router.post('/api/image/upload', upload, fileController.imageUpload);
router.get('/api/image/download/:imageNumber', fileController.download);

module.exports = router;