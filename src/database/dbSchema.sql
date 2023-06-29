--
-- Deletes all current tables and regrants permissions to postgres
--
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;

--
-- Creates a table for employee users belonging to business entities
--
DROP TABLE IF EXISTS users;
CREATE TABLE users(
   id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
   first_name VARCHAR(100) NOT NULL,
   last_name VARCHAR(100) NOT NULL,
   email VARCHAR(100) UNIQUE NOT NULL,
   phone_number char(11) NOT NULL,
   is_creator bool NOT NULL,
   is_active bool NOT NULL,
   profile_image_url VARCHAR,
   saved_categories VARCHAR[],
   profile_category VARCHAR,
   portfolio_images VARCHAR[],
   price_range VARCHAR(5),
   password VARCHAR(100) NOT NULL,
   joined_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);
