const { boardWrite } = require('./boardRepository');
const { StatusCodes, ReasonPhrases } = require('http-status-codes');
const { findMemberNum } = require('../user/userRepository');

exports.index = (req, res) => {
  res.send(`피드 리스트`);
}

exports.feedWrite = async (req, res) => {
  
  const { boardDate, boardContent, memberId } = req.body;

  let memberInformation = await findMemberNum(memberId);
  let { affectedRows } = await boardWrite(memberInformation.memberName, memberInformation.memberGroup, boardDate, boardContent);

  if (affectedRows > 0) {
    const data = {
      boardWriter: memberInformation.memberName, boardWriterGroup: memberInformation.memberGroup, boardDate: boardDate, boardContent: boardContent
    }
    res.status(StatusCodes.CREATED)
      res.send({
        code: StatusCodes.CREATED,
        httpStatus: ReasonPhrases.CREATED,
        message: "글 작성에 성공했습니다.",
        data: data
      })
  } else {
    res.status(StatusCodes.INTERNAL_SERVER_ERROR)
        res.send({
          code: StatusCodes.INTERNAL_SERVER_ERROR,
          httpStatus: ReasonPhrases.INTERNAL_SERVER_ERROR,
          message: "글 등록 중 오류가 발생했습니다."
        })
  }
}

exports.show = (req, res) => {
  const id = req.params.id;
  res.send(`피드 조회`);
}

exports.update = (req, res) => {
  const id = req.params.id;
  res.send(`피드 수정`);
}

exports.destroy = (req, res) => {
  const id = req.params.id;
  res.send(`피드 삭제`);
}