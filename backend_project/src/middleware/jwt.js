const jwt = require('jsonwebtoken');

/**
 * JWT 토큰 생성 함수
 * @param {object} payload 
 * @returns 
 */

exports.jwtSign = (payload) => {
  return new Promise((resolve, reject) => {
    jwt.sign({ foo: 'bar' }, process.env.JWT_KEY, { expiresIn: '1h' },
      function (err, token) {
        if (err) {
          reject(err);
        }
        resolve(token)
      });
  })
}