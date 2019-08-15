class Meal < ActiveRecord::Base
  belongs_to :user

  validates :calories, numericality: { only_integer: true }
end