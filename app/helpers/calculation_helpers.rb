class CalculationHelpers


  ## calculates basal metabolic rate using the Harris-Benedict equation
  def self.calculate_user_bmr(user)
    if user.gender == "male"
      bmr = (10 * (user.weight * 0.4535934)) + (6.25 * (user.height * 2.54)) - (5 * user.age) + 5
    elsif user.gender == "female"
      bmr = (10 * (user.weight * 0.4535934)) + (6.25 * (user.height * 2.54)) - (5 * user.age) - 161
    end
    return bmr.to_i

  end


  ## calculates total daily energy expedenture using BMR and activity level of user
  def self.calculate_user_tdee(user)
    case user.activity_level
    when "1"
      multiplier = 1.25
    when "2" 
      multiplier = 1.475
    when "3"
      multiplier = 1.72
    when "4"
      multiplier = 2.35
    end
    tdee = user.bmr * multiplier
    return tdee.to_i
  end


  ## calculates 
  ## gets the calories for today
  def self.calculate_current_calories(user)
    cals = 0
    meals = MealHelper.grab_meals_from_today(user.meals)
    meals.each do |meal|
      cals += meal.calories
    end
    cals
  end


end