

USE adlister_db;

INSERT INTO users (username, email, password)
VALUES ('testUser', 'test@gmail.com','hashedpassed');

TRUNCATE ads;

INSERT INTO ads (user_id, title, description)
VALUES (4, 'Quick & Crispy Home Fries','Prep:
10 mins, Cook:15 mins, Additional: 20 mins,
Total: 45 mins, Servings: 2, Ingredients: 3 large russet potatoes, peeled and quartered, 2 tablespoons olive oil ,1 tablespoon butter, Salt and freshly ground black pepper to taste, ¼ teaspoon paprika, cayenne pepper to taste, 1 pinch garlic powder,1 pinch onion powder, 1 tablespoon Chopped fresh chives, Step 1 -
Arrange potato pieces evenly on a microwave-safe plate. Microwave on high until just tender, about 4 minutes. Let cool to room temperature. Cut potatoes into bite-size chunks. , Step 2 - Heat butter and olive oil in a non-stick skillet over medium-high heat. When butter melts and starts to turn brown, swirl the pan and add the potatoes. Shake pan to arrange in an even layer. Season with salt, pepper, paprika, garlic powder, and onion powder.  , Step 3 -
As potatoes brown, toss them and keep turning them every few minutes until they are crusty and crispy-edged and a rich reddish-brown color, 10 to 12 minutes. If potatoes seem to be cooking too quickly, reduce heat to medium. Serve topped with chopped chives.'),

       (4, 'Delicious Egg Salad for Sandwiches', 'Prep: 10 mins,
Cook: 15 mins, Additional: 10 mins, Total: 35 mins, Servings: 4, Ingredient Checklist: 8 eggs, ½ cup mayonnaise, 1 teaspoon prepared yellow mustard,¼ cup chopped green onion, salt and pepper to taste, ¼ teaspoon paprika, Directions: Step 1 - Place egg in a saucepan and cover with cold water. Bring water to a boil and immediately remove from heat. Cover and let eggs stand in hot water for 10 to 12 minutes. Remove from hot water, cool, peel and chop. Step 2 -
Place the chopped eggs in a bowl, and stir in the mayonnaise, mustard and green onion. Season with salt, pepper and paprika. Stir and serve on your favorite bread or crackers.
 '),
       (4, 'Buffalo Chicken Wing Sauce', 'Prep: 5 mins, Cook: 5 mins, Total: 10 mins,  Servings: 8, Ingredients: ⅔ cup hot pepper sauce, ½ cup cold unsalted butter, 1½ tablespoons white vinegar, ¼ teaspoon Worcestershire sauce, ¼ teaspoon cayenne pepper, ⅛ teaspoon garlic powder, salt to taste. Step 1 - Combine the hot sauce, butter, vinegar, Worcestershire sauce, cayenne pepper, garlic powder, and salt in a pot and place over medium heat. Bring to a simmer while stirring with a whisk. As soon as the liquid begins to bubble on the sides of the pot, remove from heat, stir with the whisk, and set aside for use.');

