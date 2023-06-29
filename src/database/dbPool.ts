import 'dotenv/config';
import { Pool } from 'pg';
 
const { HOST, DATABASE, PASSWORD, DB_PORT } = process.env;

const database = new Pool({
  user: 'postgres',
  host: HOST,
  database: DATABASE,
  password: PASSWORD,
  port: Number(DB_PORT),
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 5000,
});

export default database;
