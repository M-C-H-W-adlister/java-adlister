USE adlister_db;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS cuisine;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS recipes;


CREATE TABLE users
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL,
    email    VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id)
);

CREATE TABLE cuisine
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(240) NOT NULL DEFAULT 'American',
    PRIMARY KEY (id)
);

CREATE TABLE author
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL DEFAULT 'Unknown',
    PRIMARY KEY (id)
);

# CREATE TABLE recipes
# (
#     id        INT UNSIGNED NOT NULL AUTO_INCREMENT,
#     title     varchar(240) NOT NULL,
#     author_id INT UNSIGNED,
#     FOREIGN KEY (author_id) REFERENCES author(id),
#     PRIMARY KEY (id)
# ); //Delete?

CREATE TABLE recipes
(
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id     INT UNSIGNED NOT NULL,
    author_id   INT UNSIGNED NOT NULL,
    recipe_title    VARCHAR(240) NOT NULL,
    description TEXT         NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (author_id) REFERENCES author (id),
    FOREIGN KEY (recipe_title) REFERENCES recipes (id)
        ON DELETE CASCADE

);

