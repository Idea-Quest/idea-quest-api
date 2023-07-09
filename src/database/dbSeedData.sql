-- Inserting sample data into the "categories" table
INSERT INTO categories (name)
VALUES
  ('Nature'),
  ('Abstract'),
  ('Portrait');

-- Inserting sample data into the "users" table
INSERT INTO users (first_name, last_name, email, phone_number, is_creator, is_active, profile_image_url, profile_category, price_range, password)
VALUES
  ('John', 'Doe', 'johndoe@example.com', '1234567890', true, true, 'https://example.com/profile.jpg', (SELECT id FROM categories WHERE name = 'Nature'), '$$', 'password123'),
  ('Jane', 'Smith', 'janesmith@example.com', '9876543210', true, true, 'https://example.com/profile.jpg', (SELECT id FROM categories WHERE name = 'Abstract'), '$$$', 'password456');

-- Inserting sample data into the "posts" table
INSERT INTO posts (user_id, caption, image_url)
VALUES
  ((SELECT id FROM users WHERE email = 'johndoe@example.com'), 'Beautiful landscape', 'https://example.com/images/landscape.jpg'),
  ((SELECT id FROM users WHERE email = 'janesmith@example.com'), 'Amazing artwork', 'https://example.com/images/artwork.jpg');

-- Inserting sample data into the "user_favorite_categories" table
INSERT INTO user_favorite_categories (user_id, category_id)
VALUES
  ((SELECT id FROM users WHERE email = 'johndoe@example.com'), (SELECT id FROM categories WHERE name = 'Nature')),
  ((SELECT id FROM users WHERE email = 'janesmith@example.com'), (SELECT id FROM categories WHERE name = 'Abstract'));

-- Inserting sample data into the "comments" table
INSERT INTO comments (user_id, post_id, parent_comment_id, body)
VALUES
  ((SELECT id FROM users WHERE email = 'johndoe@example.com'), (SELECT id FROM posts WHERE caption = 'Beautiful landscape'), NULL, 'Great shot!'),
  ((SELECT id FROM users WHERE email = 'janesmith@example.com'), (SELECT id FROM posts WHERE caption = 'Amazing artwork'), NULL, 'I love the colors!'),
  ((SELECT id FROM users WHERE email = 'johndoe@example.com'), (SELECT id FROM posts WHERE caption = 'Amazing artwork'), (SELECT id FROM comments WHERE body = 'I love the colors!'), 'Thank you!');
