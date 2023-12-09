var path = require("path");
const fs = require("fs");

const { parse } = require("csv-parse");

const db = require("../database/models");
const { Books } = db;

const storeBooksCsv = async (req, res) => {
  try {
    const results = [];
    fs.createReadStream(req.file.path)
      .pipe(parse({ columns: true }))
      .on("data", (data) => results.push(data))
      .on("end", async () => {
        const headers = Object.keys(results[0]);
        for (const result of results) {
          const p_issn = result[headers[0]];
          const e_issn = result[headers[1]];
          const keyword = result[headers[2]];
          const judul = result[headers[3]];
          const penulis = result[headers[4]];
          const tahun_terbit =
            result[headers[5]] !== "" ? parseInt(result[headers[5]]) : null;
          const penerbit = result[headers[6]];
          const volume = result[headers[7]];
          const no_edisi = result[headers[8]];
          const jumlah_halaman = result[headers[9]];
          const pdf = result[headers[10]];
          const reference = result[headers[11]];
          await Books.create({
            p_issn,
            e_issn,
            keyword,
            judul,
            penulis,
            tahun_terbit,
            penerbit,
            volume,
            no_edisi,
            jumlah_halaman,
            pdf,
            reference,
          });
        }

        fs.unlinkSync(req.file.path);
        res
          .status(200)
          .json({ message: "Data from CSV has been saved to the database" });
      });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
};

const getBooks = async (req, res) => {
  try {
    const books = await Books.findAll();
    const booksWithPdfPath = books.map((book) => {
      return {
        ...book.get(),
        pdf_path: `${req.protocol}://${req.get(
          "host"
        )}/diRead/Books/${path.basename(book.pdf)}`,
      };
    });

    res.status(200).json(booksWithPdfPath);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
};

const searchBooksByName = async (req, res) => {
  try {
    const bookName = req.params.bookName;

    // logic pencarian bku utama
    const books = await Books.findAll({
      where: {
        judul: {
          [db.Sequelize.Op.like]: `%${bookName}%`
        }
      },
      order: [['tahun_terbit', 'DESC']]
    });

    const booksWithPdfPath = books.map(book => ({
      ...book.get(),
      pdf_path: `${req.protocol}://${req.get("host")}/diRead/Books/${path.basename(book.pdf)}`,
    }));

    // logic rekomendasi area
    let recommendations = [];
    if (books.length > 0) {
      // logic rekomendari by kemiripan juudul
      const searchPattern = `${bookName.substring(0, 3)}%`;
      recommendations = await Books.findAll({
        where: {
          judul: {
            [db.Sequelize.Op.like]: searchPattern
          },
          id: {
            [db.Sequelize.Op.notIn]: books.map(book => book.id)
          }
        },
        order: [['tahun_terbit', 'DESC']],
        limit: 5
      });
    } else {
      // buku terbaru jika tidak ada yang mirip
      recommendations = await Books.findAll({
        order: [['tahun_terbit', 'DESC']],
        limit: 5
      });
    }

    const recommendationsWithPdfPath = recommendations.map(book => ({
      ...book.get(),
      pdf_path: `${req.protocol}://${req.get("host")}/diRead/Books/${path.basename(book.pdf)}`,
    }));


    res.status(200).json({
      searchResults: booksWithPdfPath.length > 0 ? booksWithPdfPath : 'No books found',
      recommendations: recommendationsWithPdfPath
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
};



module.exports = {
  storeBooksCsv,
  getBooks,
  searchBooksByName,
};
