import express from 'express';
import 'dotenv/config';
import database from './database/dbPool';
import path from 'path'

const app = express();
const port = process.env.PORT || 8080;

app.get('/', (req, res) => {
  res.sendFile('/src/views/index.html', {root: path.join(__dirname, '../') });
});

app.get('/checkDBConnection', async (req, res) => {
  try {
    const result = await database.query('SELECT * FROM users;');
    res.json(result.rows);
  } catch (sqlError) {
    const errorMessage = new Error('Database not connected');
    console.error({errorMessage, sqlError});
    res.json({errorMessage, sqlError});
  }
})

app.listen(port, () => {
  console.log(`Listening on port ${port} in ${process.env.IS_PRODUCTION ? 'production environment' : 'local environment'}`);
});
