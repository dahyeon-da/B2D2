const fileRepository = require('./fileRepository');
const { StatusCodes, ReasonPhrases } = require('http-status-codes');

exports.imageUpload = async (req, res) => {
  try {
    const files = req.files;

    console.log('File info:', files);

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
        res.status(StatusCodes.CREATED).send({
          code: StatusCodes.CREATED,
          httpStatus: ReasonPhrases.CREATED,
          message: '모든 이미지 업로드에 성공했습니다.',
          data: data
        });
      } else {
        res.status(StatusCodes.INTERNAL_SERVER_ERROR).send({
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
  } catch (error) {
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).send({
      code: StatusCodes.INTERNAL_SERVER_ERROR,
      httpStatus: ReasonPhrases.INTERNAL_SERVER_ERROR,
      message: '파일 업로드 중 오류가 발생했습니다.'
    });
  }
};


exports.download = async (req, res) => {
  try {
    let { imageNumber } = req.params;

    let image = await fileRepository.show(imageNumber);
    console.log(image);

    // 이미지가 없는 경우 기본 이미지로 처리
    if (!image) {
      // 기본 이미지 경로 설정
      const defaultImage = {
        fileName: 'board-game.png',
        filePath: 'uploads/board-game.png'
      };

      return res.download(defaultImage.filePath, defaultImage.fileName, (err) => {
        if (err) {
          if (!res.headersSent) { 
            return res.status(StatusCodes.NOT_FOUND).send({
              code: StatusCodes.NOT_FOUND,
              httpStatus: ReasonPhrases.NOT_FOUND,
              message: "기본 이미지 파일을 찾을 수 없습니다."
            });
          }
        }
      });
    }

    console.log(image[0].filePath);
    res.download(image[0].filePath, image[0].fileName, (err) => {
      if (err) {
        if (!res.headersSent) {
          return res.status(StatusCodes.NOT_FOUND).send({
            code: StatusCodes.NOT_FOUND,
            httpStatus: ReasonPhrases.NOT_FOUND,
            message: "해당 이미지 파일을 찾을 수 없습니다.",
          });
        }
      }
    });

  // 서버 오류 처리
  } catch (error) {
    console.error("이미지 다운로드 중 오류 발생", error);
    return res.status(StatusCodes.INTERNAL_SERVER_ERROR).send({
      code: StatusCodes.INTERNAL_SERVER_ERROR,
      httpStatus: ReasonPhrases.INTERNAL_SERVER_ERROR,
      message: "이미지 다운로드 중 오류가 발생했습니다."
    });
  }
};
