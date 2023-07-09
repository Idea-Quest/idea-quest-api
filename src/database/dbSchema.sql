--
-- Deletes all current tables and regrants permissions to postgres
--
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;


DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(255) NOT NULL UNIQUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

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
   profile_category uuid REFERENCES categories(id),
   profile_image_url VARCHAR,
   price_range VARCHAR(5),
   password VARCHAR(100) NOT NULL,
   created_at TIMESTAMPTZ DEFAULT NOW()
);

DROP TABLE IF EXISTS posts;
CREATE TABLE posts(
   id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
   user_id uuid REFERENCES users(id),
   caption VARCHAR(120),
   profile_category uuid REFERENCES categories(id),
   image_url VARCHAR,
   created_at TIMESTAMPTZ DEFAULT NOW()
);

DROP TABLE IF EXISTS comments;
CREATE TABLE comments(
   id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
   user_id uuid REFERENCES users(id),
   post_id uuid REFERENCES posts(id),
   parent_comment_id uuid,
   body VARCHAR(120) NOT NULL,
   created_at TIMESTAMPTZ DEFAULT NOW()
);

DROP TABLE IF EXISTS user_favorite_categories;
CREATE TABLE user_favorite_categories (
  user_id uuid REFERENCES users(id),
  category_id uuid REFERENCES categories(id),
  PRIMARY KEY (user_id, category_id)
);
