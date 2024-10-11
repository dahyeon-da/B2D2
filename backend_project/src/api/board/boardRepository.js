const { pool, connection } = require("../../data");

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

exports.boardShow = async () => {
  const query = `
    SELECT 
      b.boardNum,
      b.boardWriter,
      b.boardWriterGroup,
      b.boardDate,
      b.boardContent,
      GROUP_CONCAT(
          CONCAT(i.fileNum) 
          ORDER BY i.fileNum ASC
          SEPARATOR ','
      ) AS images
    FROM 
      board b
    LEFT JOIN 
      image i ON b.boardNum = i.boardNum
    GROUP BY 
      b.boardNum
    ORDER BY 
      b.boardNum DESC;
  `;
  return new Promise((resolve, reject) => {
    connection.query(query, [], (error, results) => {
      if (error) {
        return reject(error);
      }
      resolve({
        affectedRows: results.length,
        data: results
      });
    });
  });
}
