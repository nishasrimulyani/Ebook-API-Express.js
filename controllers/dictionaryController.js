const axios = require('axios');

const getWordDefinition = async (req, res) => {
  const word = req.params.word;
  const url = 'https://id.wikipedia.org/w/api.php';
  const params = {
    action: 'query',
    format: 'json',
    prop: 'extracts',
    exintro: true,
    redirects: 1,
    titles: word
  };

  try {
    const response = await axios.get(url, { params });
    const data = response.data;

    const pages = data.query.pages;
    const pageId = Object.keys(pages)[0];
    if (pageId === '-1') {
      return res.status(404).json({ message: "Word not found" });
    }

    const page = pages[pageId];
    const extract = page.extract || 'No summary available';

    res.json({
      title: page.title,
      extract
    });
  } catch (error) {
    console.error('Error fetching data from Wikipedia:', error);
    res.status(500).json({ message: 'Internal Server Error' });
  }
};

module.exports = {
  getWordDefinition
};
