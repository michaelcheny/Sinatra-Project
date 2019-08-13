## Create some dummy models

michael = User.create(name: "Michael", username: "michael", password: "password1", password_confirmation: "password1", created_at: '2019-08-11 06:15:09 UTC')

fat_michael = User.create(name: "Future Michael", username: "fat michael", password: "password1", password_confirmation: "password1", gender: "male", age: 57, height: 69, weight: 288, activity_level: "1", created_at: '2019-08-11 06:15:09 UTC')

hodor = User.create(name: "Hodor", username: "hodor", password: "holdthedoor", password_confirmation: "holdthedoor", gender: "male", age: 38, height: 81, weight: 308, activity_level: "3", created_at: '2019-08-11 06:15:09 UTC')

witch = User.create(name: "Wanda Maximoff", username: "scarlet witch", password: "ripvision",  password_confirmation: "ripvision", gender: "female", age: 30, height: 67, weight: 132, activity_level: "2", created_at: '2019-08-11 06:15:09 UTC')

draymond = User.create(name: "Draymond Green", username: "dayday", password: "watchyournuts", password_confirmation: "watchyournuts", gender: "male", age: 29, height: 79, weight: 230, activity_level: "4", created_at: '2019-08-11 06:15:09 UTC')

simone = User.create(name: "Simone Biles", username: "spin2win", password: "password1", password_confirmation: "password1", gender: "female", age: 22, height: 57, weight: 115, activity_level: "4", created_at: '2019-08-11 06:15:09 UTC')

hotdog = User.create(name: "Joey Chestnut", username: "hot dog eater", password: "hotdogs", password_confirmation: "hotdogs", gender: "male", age: 35, height: 73, weight: 230, activity_level: "3", created_at: '2019-08-11 06:15:09 UTC')

food1 = Meal.create(name: "scrambled eggs cooked in bacon fat", calories: 800, created_at: '2019-08-11 06:17:09 UTC')

food2 = Meal.create(name: "4 mini chocolate chip cookies", calories: 240, created_at: '2019-08-11 06:17:09 UTC')

food3 = Meal.create(name: "Pasta with meat sauce", calories: 760, created_at: '2019-08-11 06:17:09 UTC')

food4 = Meal.create(name: "Overnight Oats with Blueberries", calories: 550, created_at: '2019-08-11 06:17:09 UTC')

food5 = Meal.create(name: "Swedish Meatballs", calories: 800, created_at: '2019-08-11 06:17:09 UTC')

food6 = Meal.create(name: "Banana", calories: 170, created_at: '2019-08-11 08:17:09 UTC')

food7 = Meal.create(name: "Gelato", calories: 400, created_at: '2019-08-11 11:17:09 UTC')

## preload user's meal array with some food
michael.meals << food3
fat_michael.meals << food1
fat_michael.meals << food2
michael.meals << food4
draymond.meals << food5
michael.meals << food6
michael.meals << food7