const jwt = require('jsonwebtoken');

module.exports = async (req, res, next) => {
  const token = req.header('token');

  jwt.verify(token, process.env.APP_KEY, function (err, decoded) {
    if (err) {
      return res.send(err)
    }
    req.user = decoded;
    next();
  });
}