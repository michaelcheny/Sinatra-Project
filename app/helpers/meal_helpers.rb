class MealHelper

  def self.meals_from_today(meals)
    meals.collect do |meal|
      # binding.pry
      meal.created_at.strftime("%A, %B %d, %Y") == Date.today.strftime("%A, %B %d, %Y")
    end
    meals
  end


end