import 'dotenv/config';
import { Pool } from 'pg';

const { HOST, DATABASE, PASSWORD, DB_PORT, DATABASE_URL, IS_PRODUCTION } = process.env;

const config = IS_PRODUCTION ? {
  connectionString: DATABASE_URL,
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 5000,
} : {
  user: 'postgres',
  host: HOST,
  database: DATABASE,
  password: PASSWORD,
  port: Number(DB_PORT),
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 5000,
};

const database = new Pool(config);

export default database;
