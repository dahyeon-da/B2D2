const { pool } = require("../../data");

/**
 * 일지 작성
 * @param {string} boardWriter 작성자
 * @param {string} boardWriterGroup 작성자의 동아리
 * @param {Date} boardDate 작성날짜
 * @param {string} boardContent 작성내용
 */
exports.boardWrite = async (boardWriter, boardWriterGroup, boardDate, boardContent) => {
  const query = `INSERT INTO board(boardWriter, boardWriterGroup, boardDate, boardContent) VALUES (?,?,?,?)`;
  return await pool(query, [
    boardWriter, boardWriterGroup, boardDate, boardContent
  ]);
}