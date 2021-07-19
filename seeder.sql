USE adlister_db;

INSERT INTO users (username, email, password)
VALUES ('testUser', 'test@gmail.com','hashedpassed');

# Change userids to fit your table!

INSERT INTO ads (user_id, title, description,ingredients)
VALUES (6, 'Quick & Crispy Home Fries','Prep: 10 mins, Cook:15 mins, Additional: 20 mins, Total: 45 mins, Servings: 2','3 large russet potatoes, peeled and quartered, 2 tablespoons olive oil ,1 tablespoon butter, Salt and freshly ground black pepper to taste, ¼ teaspoon paprika, cayenne pepper to taste, 1 pinch garlic powder,1 pinch onion powder, 1 tablespoon Chopped fresh chives.'),
       (7, 'Delicious Egg Salad for Sandwiches', 'Prep: 10 mins, Cook: 15 mins, Additional: 10 mins, Total: 35 mins, Servings: 4','8 eggs, ½ cup mayonnaise, 1 teaspoon prepared yellow mustard,¼ cup chopped green onion, salt and pepper to taste, ¼ teaspoon paprika'),
       (6, 'Buffalo Chicken Wing Sauce', 'Prep: 5 mins, Cook: 5 mins, Total: 10 mins,  Servings: 8',' ⅔ cup hot pepper sauce, ½ cup cold unsalted butter, 1½ tablespoons white vinegar, ¼ teaspoon Worcestershire sauce, ¼ teaspoon cayenne pepper, ⅛ teaspoon garlic powder, salt to taste. Step 1 - Combine the hot sauce, butter, vinegar, Worcestershire sauce, cayenne pepper, garlic powder'),
       (7,'Chicken Escabeche','Chicken breasts, onions, and carrots stew in vinegar and wine for a tangy South American escabeche meal. This is delicious served over rice or quinoa. This dish can be served immediately but it is even better if served at room temperature after the flavors have had some time to meld.','3 tablespoons extra-virgin olive oil, 12 and a half ounces skinless, boneless chicken breast halves, 3 and a half ounces carrots, julienned, 3 and a half ounces white onion, thinly sliced, 3 and a half ounces red onion, thinly sliced, 2 bay leaves, 1 clove garlic minced, 1 teaspoon ground black pepper, a half teaspoon salt, a quarter cup red wine vinegar, a quarter cup dry white wine, a quarter cup water, 1 teaspoon achiote powder, a half teaspoon cayenne pepper');

INSERT INTO cat(cat_name)
VALUES ('Meat Lovers'),
       ('Vegetarian'),
       ('Keto'),
       ('Gluten Free'),
       ('Japanese Style'),
       ('Mexican'),
       ('American'),
       ('Tex-mex');

# Change ad_ids to fit your table, using ad's ids!
INSERT INTO ad_cat (ad_id, cat_id)
VALUES (14,2),
       (14,4),
       (15,1),
       (15,5),
       (16,1),
       (16,7),
       (16,8);
