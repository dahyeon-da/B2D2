const jwt = require('jsonwebtoken');

module.exports = async (req, res, next) => {
  let token = req.headers['authorization'];

  jwt.verify(token, process.env.JWT_KEY, function (err, decoded) {
    if (err) {
      console.log(token)
      return res.send(err)
    }
    req.user = decoded;
    next();
  });
}