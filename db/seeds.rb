## Create some dummy models

michael = User.create(username: "michael", password: "password1", password_confirmation: "password1", gender: "male", age: 27, height:69, weight: 188, activity_level: "3", bmr: 1818, tdee: 2817, goal: "lose half a pound a week",  created_at: '2019-08-11 06:15:09 UTC')

hodor = User.create(username: "hodor", password: "holdthedoor", password_confirmation: "holdthedoor", gender: "male", age: 38, height: 81, weight: 308, activity_level: "4", bmr: 2497, tdee: 3870, goal: "maintain weight", created_at: '2019-08-11 06:15:09 UTC')

draymond = User.create(username: "draymondgreen23", password: "watchyournuts", password_confirmation: "watchyournuts", gender: "male", age: 29, height: 79, weight: 230, activity_level: "5", bmr: 2157, tdee: 4206, goal: "maintain weight", created_at: '2019-08-11 06:15:09 UTC')

gordon = User.create(username: "gordonramsay", password: "itsfuckingraw", password_confirmation: "itsfuckingraw", gender: "male", age: 50, height: 74, weight: 176, activity_level: "3", bmr: 1728, tdee: 2678, goal: "maintain weight", created_at: '2019-08-11 06:15:09 UTC')

food1 = Meal.create(name: "scrambled eggs cooked in bacon fat", calories: 800, notes: "saved the bacon grease to cook with later")

food2 = Meal.create(name: "4 mini chocolate chip cookies", calories: 240, notes: "these were addicting, next time I need to limit myself to 2 a day", created_at: '2019-08-11 06:17:09 UTC')

food3 = Meal.create(name: "Pasta with meat sauce", calories: 760, notes: "used whole cream to thicken the sauce", created_at: '2019-08-11 06:17:09 UTC')

food4 = Meal.create(name: "Overnight Oats with Blueberries", calories: 550, notes: "forgot to add chia seeds and greek yogurt", created_at: '2019-08-11 06:17:09 UTC')

food5 = Meal.create(name: "Swedish Meatballs", calories: 800, notes: "had a spicy kick to it")

food6 = Meal.create(name: "Banana", calories: 170, notes: "too ripe :(", created_at: '2019-08-11 08:17:09 UTC')

food7 = Meal.create(name: "Gelato", calories: 400, notes: "pistachio is still the best flavor, next time get a bigger bowl", created_at: '2019-08-15 11:17:09 UTC')

food8 = Meal.create(name: "Beef Wellington", calories: 835, notes: "fucking delicous", created_at: '2019-08-16 11:17:09 UTC')

food9 = Meal.create(name: "Lobster Tortellini", calories: 865, notes: "Perfect, garnished with a touch of olive oil", created_at: '2019-08-13 11:17:09 UTC')

food10 = Meal.create(name: "Sticky Toffee Pudding", calories: 950, notes: "needed a touch of olive oil", created_at: '2019-08-14 11:17:09 UTC')

food11 = Meal.create(name: "Lobster Ravioli", calories: 670, notes: "this was fucking raw", created_at: '2019-08-15 11:17:29 UTC')

food12 = Meal.create(name: "Gourmet Mud Pie", calories: 666, notes: "made with the blood of a dying giant")

food13 = Meal.create(name: "Braised Lamb with Rosemary", calories: 666, notes: "Kept the bones to make slow cooked broth for ramen")

## preload user's meal array with some food
michael.meals << food3
michael.meals << food1
michael.meals << food2
michael.meals << food4
draymond.meals << food5
michael.meals << food6
michael.meals << food7
gordon.meals << food8
gordon.meals << food9
gordon.meals << food10
gordon.meals << food11
michael.meals << food13
hodor.meals << food12