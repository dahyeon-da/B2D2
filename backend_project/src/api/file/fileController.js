const fileRepository = require('./fileRepository');
const { StatusCodes, ReasonPhrases } = require('http-status-codes');


exports.imageUpload = async (req, res) => {
  const files = req.files;

  console.log(`File info:`, files);


  if (!files || files.length === 0) {
    return res.status(StatusCodes.BAD_REQUEST).send({
      code: StatusCodes.BAD_REQUEST,
      httpStatus: ReasonPhrases.BAD_REQUEST,
      message: '파일이 업로드되지 않았습니다.'
    });
  }

  try {
    const results = await fileRepository.uploadImage(files);
    const successCount = results.filter(result => result.affectedRows > 0).length;
    const data = files.map(file => ({
      filename: file.filename,
      filepath: file.path,
      filesize: file.size
    }));

    if (successCount === files.length) {
      res.status(StatusCodes.CREATED);
      res.send({
        code: StatusCodes.CREATED,
        httpStatus: ReasonPhrases.CREATED,
        message: '모든 이미지 업로드에 성공했습니다.',
        data: data
      });
    } else {
      res.status(StatusCodes.INTERNAL_SERVER_ERROR);
      res.send({
        code: StatusCodes.INTERNAL_SERVER_ERROR,
        httpStatus: ReasonPhrases.INTERNAL_SERVER_ERROR,
        message: '일부 이미지 업로드 중 오류가 발생했습니다.',
        details: results
      });
    }
  } catch (error) {
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).send({
      code: StatusCodes.INTERNAL_SERVER_ERROR,
      httpStatus: ReasonPhrases.INTERNAL_SERVER_ERROR,
      message: '서버에서 오류가 발생했습니다.'
    });
  }
};

