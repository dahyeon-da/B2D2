const express = require('express')
const router = express.Router()
const verify = require('./middleware/jwtVerify')

const webController = require('./web/controller');
const apiUserController = require('./api/user/controller');
const apiFeedController = require('./api/feed/controller');

router.get('/', webController.home);
router.get('/page/:page', webController.page);
router.get('/sitemap', webController.sitemap);

router.get('/api/user/:id', apiUserController.userinfo);
router.post('/api/user/register', apiUserController.register);

router.get('/api/feed', verify, apiFeedController.index);
router.post('/api/feed', verify, apiFeedController.store);
router.get('/api/feed/:id', verify, apiFeedController.show);
router.post('/api/feed/:id', verify, apiFeedController.update);
router.post('/api/feed/:id/delete', verify, apiFeedController.destroy);

module.exports = router;