class MealHelper

  def self.meals_from_today(meals)
    today_meals = []
    meals.each do |meal|
      # binding.pry
      if meal.created_at.strftime("%A, %B %d, %Y") == Date.today.strftime("%A, %B %d, %Y")
        today_meals << meal
      end
    end
    today_meals
  end


end