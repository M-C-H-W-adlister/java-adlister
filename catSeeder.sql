# Make sure to edit user ids to fit what's in your table.

alter table ads
    add ingredients text null;

INSERT INTO ads (user_id, title, description,ingredients)
VALUES (1, 'Quick & Crispy Home Fries','Prep: 10 mins, Cook:15 mins, Additional: 20 mins, Total: 45 mins, Servings: 2','3 large russet potatoes, peeled and quartered, 2 tablespoons olive oil ,1 tablespoon butter, Salt and freshly ground black pepper to taste, ¼ teaspoon paprika, cayenne pepper to taste, 1 pinch garlic powder,1 pinch onion powder, 1 tablespoon Chopped fresh chives.'),

       (1, 'Delicious Egg Salad for Sandwiches', 'Prep: 10 mins, Cook: 15 mins, Additional: 10 mins, Total: 35 mins, Servings: 4','8 eggs, ½ cup mayonnaise, 1 teaspoon prepared yellow mustard,¼ cup chopped green onion, salt and pepper to taste, ¼ teaspoon paprika'),
       (1, 'Buffalo Chicken Wing Sauce', 'Prep: 5 mins, Cook: 5 mins, Total: 10 mins,  Servings: 8',' ⅔ cup hot pepper sauce, ½ cup cold unsalted butter, 1½ tablespoons white vinegar, ¼ teaspoon Worcestershire sauce, ¼ teaspoon cayenne pepper, ⅛ teaspoon garlic powder, salt to taste. Step 1 - Combine the hot sauce, butter, vinegar, Worcestershire sauce, cayenne pepper, garlic powder'),
       (1,'Chicken Escabeche','Chicken breasts, onions, and carrots stew in vinegar and wine for a tangy South American escabeche meal. This is delicious served over rice or quinoa. This dish can be served immediately but it is even better if served at room temperature after the flavors have had some time to meld.','3 tablespoons extra-virgin olive oil, 12 and a half ounces skinless, boneless chicken breast halves, 3 and a half ounces carrots, julienned, 3 and a half ounces white onion, thinly sliced, 3 and a half ounces red onion, thinly sliced, 2 bay leaves, 1 clove garlic minced, 1 teaspoon ground black pepper, a half teaspoon salt, a quarter cup red wine vinegar, a quarter cup dry white wine, a quarter cup water, 1 teaspoon achiote powder, a half teaspoon cayenne pepper');

# FROM first link, Step 1 -
# Arrange potato pieces evenly on a microwave-safe plate. Microwave on high until just tender, about 4 minutes. Let cool to room temperature. Cut potatoes into bite-size chunks. , Step 2 - Heat butter and olive oil in a non-stick skillet over medium-high heat. When butter melts and starts to turn brown, swirl the pan and add the potatoes. Shake pan to arrange in an even layer. Season with salt, pepper, paprika, garlic powder, and onion powder.  , Step 3 -
# As potatoes brown, toss them and keep turning them every few minutes until they are crusty and crispy-edged and a rich reddish-brown color, 10 to 12 minutes. If potatoes seem to be cooking too quickly, reduce heat to medium. Serve topped with chopped chives.

# From 2nd ad
# Directions: Step 1 - Place egg in a saucepan and cover with cold water. Bring water to a boil and immediately remove from heat. Cover and let eggs stand in hot water for 10 to 12 minutes. Remove from hot water, cool, peel and chop. Step 2 -
# Place the chopped eggs in a bowl, and stir in the mayonnaise, mustard and green onion. Season with salt, pepper and paprika. Stir and serve on your favorite bread or crackers.

# From 3rd
# and salt in a pot and place over medium heat. Bring to a simmer while stirring with a whisk. As soon as the liquid begins to bubble on the sides of the pot, remove from heat, stir with the whisk, and set aside for use.


CREATE TABLE cat
(
    cat_id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cat_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (cat_id)
);

CREATE TABLE ad_cat
(
    ad_id  INT UNSIGNED NOT NULL,
    cat_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES ads (id)
        ON DELETE CASCADE,
    FOREIGN KEY (cat_id) REFERENCES cat (cat_id)
        ON DELETE CASCADE
);

INSERT INTO cat(cat_name)
VALUES ('Meat Lovers'),
       ('Vegetarian'),
       ('Keto'),
       ('Gluten Free'),
       ('Japanese Style'),
       ('Mexican'),
       ('American'),
       ('Tex-mex');
# Make sure to edit the these ids to match ids of ads you have, in the first column, 2nd number should be the same tho.
INSERT INTO ad_cat (ad_id, cat_id)
VALUES (4,2),
       (5,3),
       (10,4),
       (10,7),
       (10,7),
       (10,1),
       (11,7),
       (12,1),
       (13,6),
       (13,8);

INSERT INTO ad_cat (ad_id, cat_id)
VALUES (14,2),
       (14,4),
       (15,1),
       (15,5),
       (16,1),
       (16,7),
       (16,8);


