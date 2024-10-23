const { pool } = require('../../data/index');

/**
 * 
 * @param {*} files 
 * @returns 
 */
exports.uploadImage = async (files) => {
  const results = [];

  for (const file of files) {
    try {
      const boardNumQuery = `SELECT MAX(boardNum) AS maxBoardNum FROM board;`;
      let boardNumResult = await pool(boardNumQuery, []);
      const boardNum = boardNumResult[0].maxBoardNum || 0; // 최대 boardNum 가져오기

      // 파일 정보가 제대로 들어오는지 확인
      if (!file.filename || !file.path || !file.size) {
        throw new Error(`Invalid file information: ${JSON.stringify(file)}`);
      }

      const query = `INSERT INTO image (fileName, filePath, fileSize, boardNum) VALUES (?, ?, ?, ?)`;
      const result = await pool(query, [file.originalname, file.path, file.size, boardNum]);
      
      results.push(result);
    } catch (error) {
      console.error(`Error uploading file ${file.filename}:`, error);
      results.push({ filename: file.filename, error: error.message });
    }
  }

  return results;
}

exports.show = async (imageNumber) => {
    const query =  `SELECT * FROM image WHERE fileNum = ?`;

    return await pool(query, [imageNumber]);
}
