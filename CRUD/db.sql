CREATE TABLE `cities` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` VARCHAR
);
CREATE TABLE `inhabitants` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `first_name` VARCHAR
  `city_id` INT NOT NULL
);

INSERT INTO cities ('name') VALUES ('Paris');
INSERT INTO cities ('name') VALUES ('London');

INSERT INTO inhabitants ('first_name', 'city_id') VALUES ('Toto', 1);
INSERT INTO inhabitants ('first_name', 'city_id') VALUES ('John', 2);
