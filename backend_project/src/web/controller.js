exports.home = (req, res) => {
  res.send(`hello carrot market`);
}

exports.page = (req, res) => {
  const page = req.params.page;
  let content;
  switch (page) {
    case 'terms':
      content = '이용 약관';
      break;
    case 'policy':
      content = '개인정보 처리방침';
      break;
  }
  res.send(content)
}

exports.sitemap = (req, res) => {
  res.send(`sitemap`);
}