const jwt = require('./jwt');
const { register, find, login, findMemberNum } = require('./repository');
const crypto = require('crypto');
const { StatusCodes, ReasonPhrases } = require('http-status-codes');

exports.login = async (req, res) => {
  
  const { memberId, memberPassword } = req.body;

  let passwordResult = crypto.pbkdf2Sync(memberPassword, process.env.SALT_KEY, 50, 100, 'sha512')
  let result = await login(memberId, passwordResult.toString('base64'));

  if (result == null) {
    res.status(StatusCodes.UNAUTHORIZED)
    res.send({code:StatusCodes.UNAUTHORIZED, httpStatus: ReasonPhrases.UNAUTHORIZED, message:'아이디나 비밀번호가 틀립니다.'})
  } else {
    const memberInformation = await findMemberNum(memberId);
    let token = await jwt.jwtSign({ foo: 'bar' });
    const data = {
      memberNum: memberInformation.memberNum,
      memberId: memberId,
      memberName: memberInformation.memberName,
      memberPhoneNumber: memberInformation.memberPhoneNumber,
      access_token: token
    }
    res.status(StatusCodes.CREATED)
    res.send({ code: StatusCodes.CREATED, httpStatus: ReasonPhrases.CREATED, message: '로그인에 성공했습니다.', data: data,  });
  }
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
    const token = await jwt.jwtSign({ foo: 'bar' });
    const data = {
      memberId: memberId, memberName: memberName, memberPhoneNumber: memberPhoneNumber, memberGroup: memberGroup, access_token: token
    }
    res.status(StatusCodes.CREATED)
    res.send({ code: StatusCodes.CREATED, httpStatus: ReasonPhrases.CREATED, message: '회원가입에 성공했습니다.', data: data,  });
  } else {
    res.send({ result: 'fail' });
  }
}