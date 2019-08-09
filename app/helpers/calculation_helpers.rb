class CalculationHelpers

  ## calculates basal metabolic rate using the Harris-Benedict equation
  def self.calculate_bmr(gender, age, height, weight)
    if gender == "male"
      @bmr = (10 * (weight * 0.4535934)) + (6.25 * (height * 2.54)) - (5 * age) + 5
    elsif gender == "female"
      @bmr = (10 * (weight * 0.4535934)) + (6.25 * (height * 2.54)) - (5 * age) - 161
    end
    return @bmr.to_i
  end

  ## calculates total daily energy expedenture using BMR and activity level of user
  def self.calculate_tdee(activity_level, bmr)
    case activity_level
    when "1"
      multiplier = 1.25
    when "2" 
      multiplier = 1.475
    when "3"
      multiplier = 1.72
    when "4"
      multiplier = 2.35
    end

    tdee = bmr * multiplier

    return tdee.to_i
    
  end

end