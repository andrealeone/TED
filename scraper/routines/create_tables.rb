
ActiveRecord::Base.connection.execute commands = <<-SQL

-- Slugs ---------------------------------------------------------

CREATE TABLE slugs (
  key text PRIMARY KEY,
  scraped boolean DEFAULT false
);

-- Talks ---------------------------------------------------------

CREATE TABLE talks (
  slug text UNIQUE PRIMARY KEY,
  title text,
  speaker text,
  description text,
  transcript text,
  tags text[],
  event text,
  year integer,
  vector double precision[],
  vector_trf double precision[],
  category integer
);

SQL
