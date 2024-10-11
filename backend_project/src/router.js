const express = require('express')
const router = express.Router()
const verify = require('./middleware/jwtVerify')

const multer = require('multer');
const upload = multer({ dest: 'public/storage' });

const webController = require('./web/controller');
const apiUserController = require('./api/user/userController');
const apiFeedController = require('./api/board/boardController');
const fileController = require('./api/file/fileController');

router.get('/', webController.home);
router.get('/page/:page', webController.page);
router.get('/sitemap', webController.sitemap);

router.post('/api/user/login', apiUserController.login);
router.post('/api/user/register', apiUserController.register);

router.post('/api/feed/write', verify, apiFeedController.feedWrite);
router.get('/api/feed/list', verify, apiFeedController.boardShow);

router.post('/api/image/upload', upload.array('files'), fileController.imageUpload);

module.exports = router;