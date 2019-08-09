class CalculationHelpers

  ## calculates basal metabolic rate using the Harris-Benedict equation
  def self.calculate_bmr(gender, age, height, weight)
    if gender == "male"
      @bmr = (10 * (weight * 0.4535934)) + (6.25 * (height * 2.54)) - (5 * age) + 5
    elsif gender == "female"
      @bmr = (10 * (weight * 0.4535934)) + (6.25 * (height * 2.54)) - (5 * age) - 161
    end
    return @bmr
  end

  def self.testing
    "testing"
  end

end