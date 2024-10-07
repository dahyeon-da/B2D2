const express = require('express')
const router = express.Router()
const verify = require('./middleware/jwtVerify')

const webController = require('./web/controller');
const apiUserController = require('./api/user/userController');
const apiFeedController = require('./api/board/boardController');

router.get('/', webController.home);
router.get('/page/:page', webController.page);
router.get('/sitemap', webController.sitemap);

router.post('/api/user/login', apiUserController.login);
router.post('/api/user/register', apiUserController.register);

router.post('/api/feed/write', verify, apiFeedController.feedWrite);
router.get('/api/feed/:id', verify, apiFeedController.show);
router.post('/api/feed/:id', verify, apiFeedController.update);
router.post('/api/feed/:id/delete', verify, apiFeedController.destroy);

module.exports = router;