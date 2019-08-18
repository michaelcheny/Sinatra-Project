# class MealHelper

#   # "%A, %B %d, %Y" ====>>>>> Monday, August 30, 2019
#   # %D ====>>>> 08/30/19

#   ## returns the meal from today
#   def self.grab_meals_from_today(meals)
#     today_meals = []
#     meals.each do |meal|
#       if meal.created_at.strftime("%D") == Date.today.strftime("%D")
#         today_meals << meal
#       end
#     end
#     today_meals
#   end


#   ## Sorts the meals by newest on top
#   def self.sort_meals(meals)
#      meals.sort_by{|m| m.created_at}.reverse
#   end

# end