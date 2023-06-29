import express from 'express';
import 'dotenv/config';
import database from './database/dbPool';

const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.get('/checkDBConnection', async (req, res) => {
  try {
    const result = await database.query('SELECT * FROM users;');
    res.json(result.rows[0]);
  } catch (sqlError) {
    const errorMessage = new Error('Database not connected');
    console.error({errorMessage, sqlError});
    res.json({errorMessage, sqlError});
  }
})

app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
