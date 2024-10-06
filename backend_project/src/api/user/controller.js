const jwt = require('./jwt');
const { register, find } = require('./repository');
const crypto = require('crypto');
const { StatusCodes, ReasonPhrases } = require('http-status-codes');

exports.userinfo = (req, res) => {
  const id = req.params.id;
  res.send(`${id}님의 회원정보`);
}

exports.register = async (req, res) => {

  const { memberId, memberPassword, memberName, memberPhoneNumber, memberGroup } = req.body;

  let { count } = await find(memberId);

  if (count > 0) {
    return res.send({
      result: "fail", message: '중복된 아이디가 존재합니다.'
    });
  }

  // 비밀번호 암호화
  const result = await crypto.pbkdf2Sync(
    memberPassword, process.env.SALT_KEY, 50, 100, 'sha512'
  )

  const { affectedRows, insertId } = await register(memberId, result.toString('base64'), memberName, memberPhoneNumber, memberGroup);

  // 회원가입이 성공적으로 완료되었을 때
  if (affectedRows > 0) {
    const data = {
      memberId: memberId, memberName: memberName, memberPhoneNumber: memberPhoneNumber, memberGroup: memberGroup
    }
    res.status(StatusCodes.CREATED)
    res.send({ code: StatusCodes.CREATED, httpStatus: ReasonPhrases.CREATED, message: '회원가입에 성공했습니다.', data: data });
    // const data = await jwt.jwtSign({ foo: 'bar' });
    // res.send({ access_token : data })
  } else {
    res.send({ result: 'fail' });
  }
}