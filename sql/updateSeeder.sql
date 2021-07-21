USE adlister_db;

INSERT INTO users (username, email, password, bio, image, isAdmin)
VALUES ('testUser', 'test@gmail.com','hashedpassed', 'user bio', 'user image link', false);

# Change userids to fit your table!

INSERT INTO ads (user_id, title, description,ingredients, directions, image)
VALUES (6, 'Quick & Crispy Home Fries','Prep: 10 mins, Cook:15 mins, Additional: 20 mins, Total: 45 mins, Servings: 2','3 large russet potatoes, peeled and quartered, 2 tablespoons olive oil ,1 tablespoon butter, Salt and freshly ground black pepper to taste, ¼ teaspoon paprika, cayenne pepper to taste, 1 pinch garlic powder,1 pinch onion powder, 1 tablespoon Chopped fresh chives.', 'Arrange potato pieces evenly on a microwave-safe plate. Microwave on high until just tender, about 4 minutes. Let cool to room temperature. Cut potatoes into bite-size chunks. Heat butter and olive oil in a non-stick skillet over medium-high heat. When butter melts and starts to turn brown, swirl the pan and add the potatoes. Shake pan to arrange in an even layer. Season with salt, pepper, paprika, garlic powder, and onion powder. As potatoes brown, toss them and keep turning them every few minutes until they are crusty and crispy-edged and a rich reddish-brown color, 10 to 12 minutes. If potatoes seem to be cooking too quickly, reduce heat to medium. Serve topped with chopped chives.' ,'https://www.kindpng.com/picc/m/74-746950_fry-pan-cooking-food-beverage-cartoon-hd-png.pn'),
       (7, 'Delicious Egg Salad for Sandwiches', 'Prep: 10 mins, Cook: 15 mins, Additional: 10 mins, Total: 35 mins, Servings: 4','8 eggs, ½ cup mayonnaise, 1 teaspoon prepared yellow mustard,¼ cup chopped green onion, salt and pepper to taste, ¼ teaspoon paprika', 'Place egg in a saucepan and cover with cold water. Bring water to a boil and immediately remove from heat. Cover and let eggs stand in hot water for 10 to 12 minutes. Remove from hot water, cool, peel and chop. Place the chopped eggs in a bowl, and stir in the mayonnaise, mustard and green onion. Season with salt, pepper and paprika. Stir and serve on your favorite bread or crackers.', 'https://www.kindpng.com/picc/m/74-746950_fry-pan-cooking-food-beverage-cartoon-hd-png.pn'),
       (6, 'Buffalo Chicken Wing Sauce', 'Prep: 5 mins, Cook: 5 mins, Total: 10 mins,  Servings: 8',' ⅔ cup hot pepper sauce, ½ cup cold unsalted butter, 1½ tablespoons white vinegar, ¼ teaspoon Worcestershire sauce, ¼ teaspoon cayenne pepper, ⅛ teaspoon garlic powder, salt to taste. Step 1 - Combine the hot sauce, butter, vinegar, Worcestershire sauce, cayenne pepper, garlic powder','Bring to a simmer while stirring with a whisk. As soon as the liquid begins to bubble on the sides of the pot, remove from heat, stir with the whisk, and set aside for use.' ,'https://www.kindpng.com/picc/m/74-746950_fry-pan-cooking-food-beverage-cartoon-hd-png.pn');

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
