CREATE TABLE IF NOT EXISTS feed
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  date TIMESTAMP NOT NULL,
  content TEXT NOT NULL,
  picture TEXT
)
