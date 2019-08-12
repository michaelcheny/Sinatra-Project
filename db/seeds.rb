michael = User.create(name: "Michael", username: "michael", password: "password1")

fat_michael = User.create(name: "Future Michael", username: "fat michael", password: "password1", gender: "male", age: 57, height: 69, weight: 288, activity_level: "1")

hodor = User.create(name: "Hodor", username: "hodor", password: "holdthedoor", gender: "male", age: 38, height: 81, weight: 308, activity_level: "3")

witch = User.create(name: "Wanda Maximoff", username: "scarlet witch", password: "ripvision", gender: "female", age: 30, height: 67, weight: 132, activity_level: "2")

draymond = User.create(name: "Draymond Green", username: "dayday", password: "watchyournuts", gender: "male", age: 29, height: 79, weight: 230, activity_level: "4")

hotdog = User.create(name: "Joey Chestnut", username: "hot dog eater", password: "hotdogs", gender: "male", age: 35, height: 73, weight: 230, activity_level: "3")

food1 = Meal.create(name: "scrambled eggs cooked in bacon fat", calories: 800)

food2 = Meal.create(name: "4 mini chocolate chip cookies", calories: 240)

food3 = Meal.create(name: "Pasta with meat sauce", calories: 760)

food4 = Meal.create(name: "Overnight Oats with Blueberries", calories: 550)

food5 = Meal.create(name: "Swedish Meatballs", calories: 800)

michael.meals << food3
fat_michael.meals << food1
fat_michael.meals << food2
michael.meals << food4
draymond.meals << food5