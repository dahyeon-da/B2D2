const { pool } = require("../../data");

/**
 * 회원가입
 * @param {string} memberId 아이디
 * @param {string} memberPassword 비밀번호
 * @param {string} memberName 이름
 * @param {string} memberPhoneNumber 전화번호
 * @param {string} memberGroup 동아리 이름
 */
exports.register = async (
  memberId,
  memberPassword,
  memberName,
  memberPhoneNumber,
  memberGroup
) => {
  const query = `INSERT INTO user(memberId, memberPassword, memberName, memberPhoneNumber, memberGroup) VALUES (?,?,?,?,?)`;
  return await pool(query, [
    memberId,
    memberPassword,
    memberName,
    memberPhoneNumber,
    memberGroup,
  ]);
}

// 회원가입 시 중복 확인하기
exports.find = async (memberId) => {
  let result = await pool(`SELECT count(*) count FROM user where memberId=?`, [memberId]);
  return (result.length < 0) ? null : result[0];
}

/**
 * 로그인
 * @param {string} memberId 아이디
 * @param {string} memberPassword 비밀번호
 */
exports.login = async (memberId, memberPassword) => {
  const query = `SELECT * FROM user WHERE memberId = ? AND memberPassword = ?`;
  let result = await pool(query, [memberId, memberPassword]);
  return (result.length < 0) ? null : result[0];
}

// 로그인 시 회원 번호 반납하기
exports.findMemberNum = async (memberId) => {
  const query = `SELECT * FROM user WHERE memberId = ?`;
  let result = await pool(query, [memberId]);
  return (result.length < 0) ? null : result[0];
}