class MealHelper

  # "%A, %B %d, %Y" ====>>>>> Monday, August 30, 2019
  # %D ====>>>> 08/30/19

  ## returns the meal from today
  def self.meals_from_today(meals)
    today_meals = []
    meals.each do |meal|
      # binding.pry
      if meal.created_at.strftime("%D") == Date.today.strftime("%D")
        today_meals << meal
      end
    end
    today_meals
  end




end