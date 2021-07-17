
USE adlister_db;


alter table ads
    add directions TEXT null;

alter table ads
    add ingredients text null;


INSERT INTO cat(cat_name)
VALUES ('Meat Lovers'),
       ('Vegetarian'),
       ('Keto'),
       ('Gluten Free'),
       ('Japanese Style'),
       ('Mexican'),
       ('American'),
       ('Tex-mex');

INSERT INTO ads (user_id, title, description)
VALUES (9, 'Some potats','This is going to be vegetarian Gluten Free (so 2, 4)'),
       (9,'Fishies','This should be meat lovers, japanese style. (so 1, 5)'),
       (9,'Burger bruh', 'Meat lovers, American, tex-mex cats. (so 1 7 8)');

TRUNCATE ad_cat;

INSERT INTO ad_cat (ad_id, cat_id)
VALUES (14,2),
       (14,4),
       (15,1),
       (15,5),
       (16,1),
       (16,7),
       (16,8);

USE adlister_db;
SELECT *
FROM ads
WHERE id IN (SELECT ad_id
             FROM ad_cat
             WHERE cat_id = 1);
# 1 would be the cat we want to search by Cat_ID...
# And return  the resultset for all the ads that have that cat ID.
