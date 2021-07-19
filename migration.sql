USE adlister_db;

DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL,
    email    VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);


DROP TABLE IF EXISTS ads;

CREATE TABLE ads
(
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id     INT UNSIGNED NOT NULL,
    title       VARCHAR(240) NOT NULL,
    description TEXT         NOT NULL,
    ingredients TEXT         NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
        ON DELETE CASCADE
);
DROP TABLE IF EXISTS cat;

CREATE TABLE cat
(
    cat_id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cat_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (cat_id)
);

DROP TABLE IF EXISTS ad_cat;

CREATE TABLE ad_cat
(
    ad_id  INT UNSIGNED NOT NULL,
    cat_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES ads (id)
        ON DELETE CASCADE,
    FOREIGN KEY (cat_id) REFERENCES cat (cat_id)
        ON DELETE CASCADE
);
